#This class is for the 'Project' Model containing some validations as the presence of the attributes
#Also it contains the searhing method

class Project < ActiveRecord::Base
	belongs_to :user
	default_scope order: 'projects.created_at DESC' 
	validates :user_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validate :location, presence: true

	#This method is to perform the search functionality on the projects
	
    def self.search(search)
	  if search
	    find(:all, :conditions => ['lower(location) LIKE lower(?)', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

end
