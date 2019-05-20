require 'rails_helper'

RSpec.describe "Employees", :type => :request do
  describe "GET /employees" do
    it "works! (now write some real specs)" do
      get employees_path
      expect(response.status).to be(200)
    end
  end
end
