class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :parent, polymorphic: true

  validates_presence_of :body

  has_many :comments, foreign_key: :parent_id
end
