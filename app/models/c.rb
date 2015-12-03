class C < ActiveRecord::Base
  belongs_to :pin
  belongs_to :user
  include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user}
end
