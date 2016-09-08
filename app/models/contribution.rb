class Contribution < ActiveRecord::Base
  belongs_to :story
  validates_presence_of :image_url, :username, :content


end
