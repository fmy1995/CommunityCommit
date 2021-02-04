class Users:: SearchController < ApplicationController

	def search
		@model = 'community'
		@content = params[:content]
		@method = params[:method]
    	@records = Community.search_for(@content, @method)
	end    
    
end
