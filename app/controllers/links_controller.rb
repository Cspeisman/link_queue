class LinksController < ApplicationController
	def new
		@friendship = Friendship.find(params[:friendship_id])
		@link = Link.new
	end
	
	def create
	  @friendship = Friendship.find(params[:friendship_id])
	  @link = @friendship.links.build(params[:link].permit(:url))
	  if @link.save
	  	redirect_to friendship_path(@friendship)
		else
			render 'new'
		end
	end
end