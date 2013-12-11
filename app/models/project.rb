class Project < ActiveRecord::Base
	belongs_to :user
	default_scope order: 'projects.created_at DESC' 
	validates :user_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validate :location, presence: true

	 def self.search(search_query)

		find(:all, :conditions => ['name LIKE ?', "%#{search_query}%"])

	end 
end
