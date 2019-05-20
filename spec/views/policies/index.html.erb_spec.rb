require 'rails_helper'

RSpec.describe "policies/index", :type => :view do
  before(:each) do
    assign(:policies, [
      Policy.create!(
        :name => "Name",
        :company => nil
      ),
      Policy.create!(
        :name => "Name",
        :company => nil
      )
    ])
  end

  it "renders a list of policies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
