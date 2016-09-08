class Story < ActiveRecord::Base
  has_many :contributions
  validates_presence_of :title, :genre
end
