class LinksController < ApplicationController
	before_filter :authorize

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

	def destroy
		@friendship = Friendship.find(params[:friendship_id])
		link = @friendship.links.find(params[:id].to_i)
		link.destroy
		redirect_to friendship_path(@friendship)
	end
end