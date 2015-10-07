class Post < ActiveRecord::Base

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :post_authorings, :class_name => 'UserPosting', dependent: :destroy
  has_many :authors, :through => :post_authorings, :class_name => 'User', :source => :user
  has_many :post_taggings, dependent: :destroy
  has_many :tags, :through => :post_taggings

end
