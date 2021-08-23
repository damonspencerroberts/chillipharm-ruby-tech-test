class LibrariesController < ApplicationController
  def show
    options = Filtering::Intelligence.filter_assets(params)
    sort_string = Filtering::Intelligence.create_sorting_options(params)
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
end
