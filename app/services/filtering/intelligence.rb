module Filtering
  module Intelligence
    extend self

    def filter_assets(params)
      create_filter_options(params)
    end

    def create_filter_options(params)
      options = { library_id: params[:id] }
      all_options = params[:filter].nil? || params[:filter] == 'all'
      options[:file_type] = params[:filter] unless all_options
      options
    end

    def create_sorting_options(params)
      return nil if params[:sort].nil?

      sort_str = params[:sort]
      sort_by_split = sort_str.rpartition('_')
      "#{sort_by_split.first} #{sort_by_split.last.upcase}"
    end
  end
end
