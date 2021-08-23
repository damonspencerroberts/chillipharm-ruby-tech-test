class LibrariesController < ApplicationController
  before_action :save_params, only: [:save]

  def show
    options = Filtering::Intelligence.filter_assets(params)
    sort_string = Filtering::Intelligence.create_sorting_options(params)
    @args = { filter: params[:filter], sort: params[:sort], search: params[:search], id: params[:id] }
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
    
    binding.pry
  end

  private

  def save_params
    params.permit(:filter, :search, :sort, :id)
  end
end
