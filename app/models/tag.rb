class Tag < ActiveRecord::Base

  has_many :post_taggings
  has_many :tagged_posts, :through => :post_taggings, :source => :post

  has_many :user_postings, :through => :tagged_posts, :source => :post_authorings
  has_many :authors_of_tagged_posts, :through => :user_postings, :class_name => 'User', :source => :user

  before_destroy :destroy_post_taggings

  def destroy_post_taggings
    post_taggings.destroy_all
  end
  
end
