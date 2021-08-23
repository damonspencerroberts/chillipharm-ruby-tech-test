require 'rails_helper'

RSpec.describe Asset, type: :model do
  it { should belong_to(:library) }
  it { should belong_to(:uploader) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:filename) }
  it { should validate_presence_of(:library) }
  it { should validate_presence_of(:uploader) }

  context 'Class Method search tests' do
    before(:each) do
      create(:asset)
      create(:asset, title: 'Test Mri 500')
    end

    it 'Returns the correct amount of records for search' do
      records = Asset.search('fi')
      expect(records.size).to eq 1
    end

    it 'Returns the correct amount of records for nil search' do
      records = Asset.search(nil)
      expect(records.size).to eq 2
    end
  end
end
