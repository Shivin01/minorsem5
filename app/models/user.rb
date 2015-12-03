class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :friends
  has_many :cfriends, :through => :friends
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable
  has_many :pins
  has_many :cs

  has_attached_file :thumbnail, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end
