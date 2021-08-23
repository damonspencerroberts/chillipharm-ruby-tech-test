module SearchSave
  class Intelligence
    def create_keyword(params)
      final_string = 'Search saved: '
      final_string += params[:filter].nil? ? 'All Files ' : "#{params[:filter]} "
      final_string += "#{params[:sort]} " unless params[:sort].nil?
      final_string += "#{params[:search]} " unless params[:search].nil?
      final_string.strip
    end
  end
end
