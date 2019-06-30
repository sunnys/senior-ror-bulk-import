class Employee < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :policies

  validates :name, presence: true
  validates :email, uniqueness: true

  acts_as_nested_set

  def self.upsert_employee_and_manager(record, upload_file)
    employee = Employee.find_or_initialize_by(email: record[:email])
    employee_attrs = {name: record[:employee_name], company_id: upload_file.company_id, phone: record[:phone], bulk_employee_upload_id: upload_file.id}
    if !employee.id.nil? and !employee.name.include?("'s Manager")
      raise "Validation failed: Email already taken"
      return
    end
    employee.assign_attributes(employee_attrs)
    employee.save!
    if record[:report_to].present? and !employee.nil?
      manager = Employee.find_or_initialize_by(email: record[:report_to])
      if manager.id.nil?
        manager_temp_attrs = {company_id: upload_file.company_id, name: "#{employee.name}'s Manager"}
        manager.assign_attributes(manager_temp_attrs)
        manager.save!
        employee.move_to_child_of(manager)
      end
    else
      employee.move_to_root
    end
    employee.assign_policies(record)
    return true
  end

  def assign_policies(record)
    if !self.nil?
      if record[:assigned_policies].present?
        assigned_policies = record[:assigned_policies].split('|').map(&:strip)
        assigned_policies.each do |assigned_policy|
          policy = Policy.find_or_initialize_by(name: assigned_policy, company_id: self.company_id)
          policy.save!
          self.policies << policy
        end
      end
    end
  end

  def assign_parent_and_policies
    if self.report_to.present?
      manager = Employee.find_by(email: self.report_to)
      if !manager.nil?
        self.move_to_child_of(manager)
      end
    end
    if self.assigned_policies.present?
      assigned_policies = self.assigned_policies.split('|').map(&:strip)
      assigned_policies.each do |assigned_policy|
        policy = Policy.find_or_initialize_by(name: assigned_policy, company_id: self.company_id)
        self.policies << policy
      end
    end
  end

end
