require 'rails_helper'

RSpec.describe "BulkEmployeeUploads", :type => :request do
  describe "GET /bulk_employee_uploads" do
    it "works! (now write some real specs)" do
      get bulk_employee_uploads_path
      expect(response.status).to be(200)
    end
  end
end
