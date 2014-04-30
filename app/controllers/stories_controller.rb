class StoriesController < ApplicationController

	# we want to add a list of all of the stories
	# in statics websitres, this is the index.html
	def index

		#I want to pass some data to our HTML
		# this data may change, so it is variable
		# so we store the data in a ruby thing called a variable
		@username = "garrett"


		# we want to store some stories in a list
		# in ruby we call this an array
		# @stories = ["Google", "Facebook", "Twitter"]
		# instead we want to get the real @stories from the database
		# to get the story from the db, we use the variable from db and .all
		# @stories = Story.order("votes_count desc, title asc")
		if params[:featured] == "true"
				# find just the featured stories
				@stories = Story.where(is_featured: true).order("created_at desc")
		elsif params[:sort] == "recent"
			# sort by recent
			@stories = Story.order("created_at desc")
		else
			# sort by top
			@stories = Story.order("votes_count desc, title asc")
		end

	end

	def show
		#read more page
		# params get extra information from forms AND urls
		@story = Story.find(params[:id])
	end



	def new
		# this is a new story form
		@story = Story.new
	end


	def create
		# actually add things to the database
		@story = Story.new(story_params)

		#save to the database
		if @story.save

			# let the user know it was successful
			flash[:success] = "Your story was added"

			# I want to go back to the homepage after I've saved
			redirect_to root_path

		else

			# this hasnt saved to the database 
			# because it will have failed validations
			# so lets show the add a story form
			render "new"

		end
	end

	def edit
		#this is the form to edit the story
		@story = Story.find(params[:id])
	end

	def update
		# this is actually updating the database using form data
		@story = Story.find(params[:id])

		# update this story based on the form data
		if @story.update(story_params)

			# Let the user know
			flash[:success] = "You've edited this story"

			# go back to the individual page
			redirect_to story_path(@story)
		else
			# show the edit form if it didnt update
			render "edit"
		end
	end

	def destroy
		# actually delete the story from the database
		@story = Story.find(params[:id])

		# remove from the database
		@story.destroy

		# let the user know
		flash[:success] = "You've deleted this story"

		# redirect back to the homepage
		redirect_to root_path
	end


	def story_params
		#find the data from the form
		params.require(:story).permit(:title, :description, :link)
	end

end
