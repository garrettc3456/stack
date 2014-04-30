class Comment < ActiveRecord::Base

	# associations
	# my comment belongs to a story
	belongs_to :story, counter_cache: true

	# add validations
	validates :body, presence: true

end
