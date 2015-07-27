# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Post.count < 1
  post = FactoryGirl.create(:post)
  post.comments = FactoryGirl.create_list(:comment, 5)
  post.comments.each do |comment|
    comment.comments = FactoryGirl.create_list(:comment, 3)
  end
end
