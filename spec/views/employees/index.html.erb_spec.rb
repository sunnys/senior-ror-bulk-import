require 'rails_helper'

RSpec.describe "employees/index", :type => :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :company => nil
      ),
      Employee.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :company => nil
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
