class Post < ActiveRecord::Base

  belongs_to :category
  has_many :comments
  has_many :post_authorings, :class_name => 'UserPosting'
  has_many :authors, :through => :post_authorings, :class_name => 'User', :source => :user
  has_many :post_taggings
  has_many :tags, :through => :post_taggings

  before_destroy :destroy_comments, :destroy_post_authorings, :destroy_post_taggings

  def destroy_comments
    comments.destroy_all
  end

  def destroy_post_authorings
    post_authorings.destroy_all
  end

  def destroy_post_taggings
    post_taggings.destroy_all
  end
  
end
