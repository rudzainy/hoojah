class SearchController < ApplicationController

	def search

	  if params[:query].nil?
	  	opinion = []
	  else
	  	@opinions = Opinion.search params[:query]
	  	if @opinions.nil?
	  	  redirect_to search_path, notice: "Oops, there are no such opinions!"
	    end
	  end

    end

end


# this is the tutorial i followed: http://www.sitepoint.com/full-text-search-rails-elasticsearch/