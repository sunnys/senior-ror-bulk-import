require 'rails_helper'

RSpec.describe "companies/index", :type => :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name"
      ),
      Company.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
