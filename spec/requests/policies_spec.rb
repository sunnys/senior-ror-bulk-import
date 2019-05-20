require 'rails_helper'

RSpec.describe "Policies", :type => :request do
  describe "GET /policies" do
    it "works! (now write some real specs)" do
      get policies_path
      expect(response.status).to be(200)
    end
  end
end
