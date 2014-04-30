class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|


    	# I want to add some columns to our database
    	# we want to save the tital as a string (letters and nums)
    	t.string :title
    	t.string :description
    	t.string :link

      t.timestamps
    end
  end
end
