require 'rails_helper'

RSpec.describe "bulk_employee_uploads/new", :type => :view do
  before(:each) do
    assign(:bulk_employee_upload, BulkEmployeeFile.new(
      :create => "MyString"
    ))
  end

  it "renders new bulk_employee_upload form" do
    render

    assert_select "form[action=?][method=?]", bulk_employee_uploads_path, "post" do

      assert_select "input#bulk_employee_upload_create[name=?]", "bulk_employee_upload[create]"
    end
  end
end
