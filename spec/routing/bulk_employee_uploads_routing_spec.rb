require "rails_helper"

RSpec.describe BulkEmployeeUploadsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bulk_employee_uploads").to route_to("bulk_employee_uploads#index")
    end

    it "routes to #new" do
      expect(:get => "/bulk_employee_uploads/new").to route_to("bulk_employee_uploads#new")
    end

    it "routes to #show" do
      expect(:get => "/bulk_employee_uploads/1").to route_to("bulk_employee_uploads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bulk_employee_uploads/1/edit").to route_to("bulk_employee_uploads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bulk_employee_uploads").to route_to("bulk_employee_uploads#create")
    end

    it "routes to #update" do
      expect(:put => "/bulk_employee_uploads/1").to route_to("bulk_employee_uploads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bulk_employee_uploads/1").to route_to("bulk_employee_uploads#destroy", :id => "1")
    end

  end
end
