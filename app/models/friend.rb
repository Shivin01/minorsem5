class Friend < ActiveRecord::Base
include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user}
	belongs_to :user
	belongs_to :cfriend, :class_name => "User"
end
