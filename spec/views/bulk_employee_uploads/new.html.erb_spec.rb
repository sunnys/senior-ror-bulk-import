require 'rails_helper'
# require 'authentication_helpers'

RSpec.feature "bulk_employee_uploads/new", :type => :view do
  let(:company) { FactoryGirl.create(:company, {name: "Comp1"}) }
  let(:company2) { FactoryGirl.create(:company, {name: "Comp2"}) }
  let(:company3) { FactoryGirl.create(:company, {name: "Comp3"}) }
  let(:user) { FactoryGirl.create(:user, {email: "admin@example.com", password: "password", password_confirmation: "password"}) }
  before(:each) do
    sign_in_as(user)
  end

  describe 'a registered user logins and upload an employee upload files' do
    count = BulkEmployeeUpload.all.count
    before do
      visit new_bulk_employee_upload_path
      # fill_in 'Company', with: "1"
      attach_file('File', File.join(Rails.root, '/spec/fixtures/valid_sample.csv'))
      find("#bulk_employee_upload_company_id").find(:xpath, 'option[2]').select_option
      click_button('commit')
    end
    it "Create a bulk employee upload example" do
      expect(page).to have_content('Bulk employee file was successfully created.')
      expect(BulkEmployeeUpload.all.count).to eq(count + 1)
    end
  end
end
