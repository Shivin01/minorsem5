class Pin < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user}
	acts_as_votable
	belongs_to :user
	has_many :cs

	has_attached_file :image, styles: { medium: "300*300>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	#attr_accessible :title, :description, :image, :tag_list
	acts_as_taggable

	has_attached_file :mp3
	validates_attachment_content_type :mp3, :content_type => /.*/
	#validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg"]}
end
