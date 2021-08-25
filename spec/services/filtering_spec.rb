require 'rails_helper'

RSpec.describe 'Filtering Service' do
  context 'Filters' do
    it 'Returns the correct options hash for filter with video' do
      params = { id: '1', filter: 'video' }
      result = Filtering::Intelligence.create_filter_options(params)
      correct = { library_id: '1', file_type: 'video' }
      expect(result).to eq(correct)
    end

    it 'Returns the correct options hash for no filter' do
      params = { id: '1' }
      result = Filtering::Intelligence.create_filter_options(params)
      correct = { library_id: '1' }
      expect(result).to eq(correct)
    end

    it 'Returns the correct options hash with all as filter' do
      params = { id: '1', filter: 'all' }
      result = Filtering::Intelligence.create_filter_options(params)
      correct = { library_id: '1' }
      expect(result).to eq(correct)
    end
  end
  context 'Sorting' do
    it 'Returns the correct sorting string for sort params' do
      params = { sort: 'created_at_desc' }
      result = Filtering::Intelligence.create_sorting_options(params)
      expect(result).to eq('created_at DESC')
    end

    it 'Returns "created_at DESC" when no sort params' do
      params = {}
      result = Filtering::Intelligence.create_sorting_options(params)
      expect(result).to eq("created_at DESC")
    end
  end
end
