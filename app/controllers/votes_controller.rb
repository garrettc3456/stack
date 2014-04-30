class VotesController < ApplicationController

	def create
		# actually create a vote
		# dont need new because we dont need a form page
		# find the story we're talking about
		@story = Story.find(params[:story_id])

		# make a new vote on this story
		@vote = @story.votes.new

		# save the ip address to the vote
		@vote.ip_address = request.ip

		if @vote.save

			flash[:success] = "You have voted this story up"
		else
			# the error part doesnt mean anything, you can put whatever
			flash[:error] = "You can't vote up twice"
		end

		redirect_to story_path(@story)
	end
end
