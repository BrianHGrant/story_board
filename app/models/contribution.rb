class Contribution < ActiveRecord::Base
  belongs_to :story
  has_many :comments, :as => :commentable
  validates_presence_of :image_url, :username, :content


end
