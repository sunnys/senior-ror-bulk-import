require 'rails_helper'

RSpec.describe "employees/new", :type => :view do
  before(:each) do
    assign(:employee, Employee.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :company => nil
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input#employee_name[name=?]", "employee[name]"

      assert_select "input#employee_email[name=?]", "employee[email]"

      assert_select "input#employee_phone[name=?]", "employee[phone]"

      assert_select "input#employee_company_id[name=?]", "employee[company_id]"
    end
  end
end
