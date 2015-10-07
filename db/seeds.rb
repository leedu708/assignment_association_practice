# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Category.destroy_all
Comment.destroy_all
Tag.destroy_all
UserPosting.destroy_all
PostTagging.destroy_all

puts "Old records destroyed"

MULTIPLIER = 10

def generate_users

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  u = User.new
  u[:name] = first_name + " " + last_name
  u.save

end

def generate_categories

  cat_name = Faker::Commerce.department

  c = Category.new
  c[:name] = cat_name
  c.save

end

def generate_tags

  tag_name = Faker::Company.buzzword

  t = Tag.new
  t[:name] = tag_name
  t.save

end

def generate_posts

  post_title = Faker::Book.title
  post_body  = Faker::Lorem.paragraph(2)
  category   = Category.all.sample

  p = Post.new
  p[:title]       = post_title
  p[:body]        = post_body
  p[:category_id] = category.id
  p.save

  # generate user_posting
  user = User.all.sample

  uP = UserPosting.new
  uP[:post_id] = p.id
  uP[:user_id] = user.id
  uP.save

  # generate post_tagging
  tag = Tag.all.sample

  pT = PostTagging.new
  pT[:post_id] = p.id
  pT[:tag_id]  = tag.id
  pT.save

end

def generate_comments

  user = User.all.sample
  post = Post.all.sample
  comment_body = Faker::Lorem.paragraph

  c = Comment.new
  c[:user_id] = user.id
  c[:post_id] = post.id
  c[:body]    = comment_body
  c.save

end

# Create Users
(MULTIPLIER * 10).times { generate_users }
puts "Created Users"

# Create Categories
(MULTIPLIER * 10).times { generate_categories }
puts "Created Categories"

# Create Tags
(MULTIPLIER * 10).times { generate_tags }
puts "Created Tags"

# Create Posts
(MULTIPLIER * 10).times { generate_posts }
puts "Created Posts"

# Create Comments
(MULTIPLIER * 10).times { generate_comments }
puts "Created Comments"

puts "Complete"