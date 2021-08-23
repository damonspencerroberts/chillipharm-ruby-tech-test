require 'rails_helper'

RSpec.describe 'Save Search Services' do
  it 'Generates the correct keyword no params' do
    save_service = SearchSave::Intelligence.new
    params = {}
    result = save_service.create_keyword(params)
    expect(result).to eq 'Search saved: All Files'
  end

  it 'Generates the correct keyword filter' do
    save_service = SearchSave::Intelligence.new
    params = { filter: 'video' }
    result = save_service.create_keyword(params)
    expect(result).to eq 'Search saved: video'
  end

  it 'Generates the correct keyword filter search and sort' do
    save_service = SearchSave::Intelligence.new
    params = { filter: 'video', search: 'report', sort: 'created_at_desc' }
    result = save_service.create_keyword(params)
    expect(result).to eq 'Search saved: video created_at_desc report'
  end

  it 'Generates the correct keyword filter and search' do
    save_service = SearchSave::Intelligence.new
    params = { filter: 'video', search: 'report' }
    result = save_service.create_keyword(params)
    expect(result).to eq 'Search saved: video report'
  end
end
