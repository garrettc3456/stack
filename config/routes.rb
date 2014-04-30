Rails.application.routes.draw do
 
 # active admin auto added these two lines
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	# we want the ability to add, edit, delete stories
	# in Rails, there are 7 default actions:
	# index, show
	# new, create-actual form page
	# edit, update
	# destroy
	resources :stories do
		# comments are related to stories
		# so the URLS will be related too
		resources :comments

		# votes are also related to stories
		resources :votes
	end



  # set up a url for the home page
  root "stories#index"

end


# if you wanted to add votes to comments, you need to nest it within the nested comments:
# resources :comments do
# 	resources votes
# end