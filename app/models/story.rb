class Story < ActiveRecord::Base
  has_many :contributions
  has_many :comments, :as => :commentable
  validates_presence_of :title, :genre
end
