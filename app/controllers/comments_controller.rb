class CommentsController < ApplicationController
	def index
		@link = Link.find(params[:link_id])
		@comments = @link.comments
	end

	def create
		@link = Link.find(params[:link_id])
		@comment = @link.comments.create(params[:comment].permit(:message))
		redirect_to link_comments_path(@link)
	end

	def new
		@link = Link.find(params[:link_id])
		@comment = Comment.new
	end

	def show
	end
end