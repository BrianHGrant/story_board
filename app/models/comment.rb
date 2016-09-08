class Comment < ActiveRecord::Base
  validates_presence_of :content, :username
  belongs_to :commentable, polymorphic: true
end
