class CommentsController < ApplicationController

	def new
		# this is the comment form
		# find the story that the new comment will be on
		# it is story id because we are in comments and we have to get back to story id
		@story = Story.find(params[:story_id])
		
		# make a new comment on this @story variable
		# you are finding a particular story and finding its comments, and adding a new one
		@comment = @story.comments.new
	end

	def create
		# this is actually creating a comment
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		# if the comment saves, go back to the story page
		# if not, show the new form again
		if @comment.save
			flash[:success] = "Your comment was added"
			redirect_to story_path(@story)
		else
			render "new"
		end
	end

	def comment_params
		# whitelisted form data
		params.require(:comment).permit(:body)
	end
end
