require 'rails_helper'

RSpec.describe "bulk_employee_uploads/edit", :type => :view do
  before(:each) do
    @bulk_employee_upload = assign(:bulk_employee_upload, BulkEmployeeFile.create!(
      :create => "MyString"
    ))
  end

  it "renders the edit bulk_employee_upload form" do
    render

    assert_select "form[action=?][method=?]", bulk_employee_upload_path(@bulk_employee_upload), "post" do

      assert_select "input#bulk_employee_upload_create[name=?]", "bulk_employee_upload[create]"
    end
  end
end
