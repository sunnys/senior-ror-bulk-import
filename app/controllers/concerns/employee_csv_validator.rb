class EmployeeCsvValidator < ActiveModel::Validator
    def validate(record)
        require 'csv'
        if !record.file.present?
            record.errors.add(:file, "Can't be blank")
        else
            data = CSV.read(record.file.path, headers: true)
            expected_headers = ["Employee Name","Email","Phone","Report To","Assigned Policies"]
            if data.headers.sort != expected_headers.sort
                record.errors.add(:file, "CSV Header Mismatch expecting #{expected_headers} got #{data.headers} or no data")
            elsif data.count <= 0
                record.errors.add(:file, "is empty")
            end
        end
    end
end