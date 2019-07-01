require 'rails_helper'

RSpec.describe "bulk_employee_uploads/index", :type => :view do
  before(:each) do
    assign(:bulk_employee_uploads, [
      BulkEmployeeFile.create!(
        :create => "Create"
      ),
      BulkEmployeeFile.create!(
        :create => "Create"
      )
    ])
  end

  it "renders a list of bulk_employee_uploads" do
    render
    assert_select "tr>td", :text => "Create".to_s, :count => 2
  end
end
