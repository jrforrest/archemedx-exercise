class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :parent, polymorphic: true

  validates_presence_of :body

  has_many :comments, as: :parent

  def soft_deleted?
    !!soft_deleted
  end

  def soft_delete
    update_attribute(:soft_deleted, true)
  end
end
