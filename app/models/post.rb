class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content

  has_many :comments, as: :parent
end
