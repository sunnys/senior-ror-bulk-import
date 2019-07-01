require 'rails_helper'

RSpec.describe BulkEmployeeUpload, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '.create' do
    let(:company) { Company.create(name: "C1")}
    let(:csv_file) { File.new(fixture_path + '/valid_sample.csv')}
    it "is not valid without a company and file" do
      bu = BulkEmployeeUpload.new(company_id: nil, file: nil)
      expect(bu).to_not be_valid
    end

    it 'is not valid without a file' do
      bu = BulkEmployeeUpload.new(company_id: company.id, file: nil)
      expect(bu).to_not be_valid
    end

  end
end
