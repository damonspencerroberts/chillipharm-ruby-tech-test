class LibrariesController < ApplicationController
  before_action :save_params, only: [:save, :delete_save]

  def show
    options = Filtering::Intelligence.filter_assets(params)
    sort_string = Filtering::Intelligence.create_sorting_options(params)
    @args = { filter: params[:filter], sort: params[:sort], search: params[:search], id: params[:id], url: request.fullpath }
    @saved_searches = SavedSearch.where(library: params[:id])
    @assets = Asset.search(params[:search]).where(options).order(sort_string)
  end

  def index
    @libraries = Library.all
    render layout: 'library_dashboard'
  end

  def activity
    @activity = current_library.activities
    @activity = current_library.activities.order(created_at: :desc)

    render partial: 'shared/activity_list', layout: false if request.xhr?
  end

  def info
    render layout: false if request.xhr?
  end

  def save
    options = {}
    save_params.keys.each { |k| options[k] = save_params[k] unless k == 'id' }
    save_service = SearchSave::Intelligence.new
    keyword = save_service.create_keyword(save_params)
    options[:name] = keyword
    options[:library] = Library.find(params[:id])
    saved_search_exists = SavedSearch.find_by(url: options[:url])
    if saved_search_exists.nil?
      SavedSearch.create(options)
      redirect_to "/libraries/#{save_params[:id]}"
    end
  end

  def delete_save
    redirect_to "/libraries/#{save_params[:id]}" if SavedSearch.find(save_params[:save_id]).delete
  end

  private

  def save_params
    params.permit(:filter, :search, :sort, :id, :url, :save_id)
  end
end
