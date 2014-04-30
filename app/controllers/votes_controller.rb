class VotesController < ApplicationController

	def create
		# actually create a vote
		# dont need new because we dont need a form page
		# find the story we're talking about
		@story = Story.find(params[:story_id])

		# make a new vote on this story
		@vote = @story.votes.new 

		@vote.save

		flash[:success] = "You have voted this story up"

		redirect_to story_path(@story)
	end
end
