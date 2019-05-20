require 'rails_helper'

RSpec.describe "policies/new", :type => :view do
  before(:each) do
    assign(:policy, Policy.new(
      :name => "MyString",
      :company => nil
    ))
  end

  it "renders new policy form" do
    render

    assert_select "form[action=?][method=?]", policies_path, "post" do

      assert_select "input#policy_name[name=?]", "policy[name]"

      assert_select "input#policy_company_id[name=?]", "policy[company_id]"
    end
  end
end
