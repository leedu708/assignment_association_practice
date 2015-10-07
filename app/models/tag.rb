class Tag < ActiveRecord::Base

  has_many :post_taggings, dependent: :destroy
  has_many :tagged_posts, :through => :post_taggings, :source => :post

  has_many :user_postings, :through => :tagged_posts, :source => :post_authorings
  has_many :authors_of_tagged_posts, :through => :user_postings, :class_name => 'User', :source => :user
  
end
