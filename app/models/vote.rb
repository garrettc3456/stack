class Vote < ActiveRecord::Base

	# association
	belongs_to :story, counter_cache: true
	
	# validation to make sure stories cant be voted
	# multiple times
	validates :ip_address, uniqueness: { scope: :story_id }

end
