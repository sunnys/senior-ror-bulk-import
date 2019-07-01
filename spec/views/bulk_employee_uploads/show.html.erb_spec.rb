require 'rails_helper'

RSpec.describe "bulk_employee_uploads/show", :type => :view do
  before(:each) do
    @bulk_employee_upload = assign(:bulk_employee_upload, BulkEmployeeFile.create!(
      :create => "Create"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Create/)
  end
end
