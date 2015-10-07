# 1. List all Users, Comments, Posts, Categories or Tags.

User.all
Comment.all
Post.all
Category.all
Tag.all

# 2. List a given user's comments
User.find(3).authored_comments

# 3. Set a comment to belong to a different user
  comment = Comment.first
  old_user = comment.author
  new_user = User.where('id != ?', old_user.id).last
  comment.author = new_user

  # change comment back to old_user
  comment.author = old_user

# 4. Set a post to be in a different category
post = Post.first
old_category = post.category
new_category = Category.where('id != ?', old_category.id).first
post.category = new_category
post.category = old_category

# 5. Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
comments = Comment.all.where('user_id = 2')
old_user = comments.first.author
new_user = User.where('id != 1').first
comments = new_user.authored_comments
comments = old_user.authored_comments

# 6. Set a comment's author to be a different user
comment = Comment.all.sample
new_user = User.all.sample
old_user = comment.author
comment.author = new_user
comment.author = old_user

# 7. Return a given comment's author
Comment.all.sample.author

# 8. List a given post's comments
Post.first.comments

# 9. Return a given comment's parent post
Comment.last.parent_post

# 10. Remove one post from a category's collection of posts
  category = Category.first
  post = category.posts.first
  category.posts.delete(post)
  category.posts

  # re-add original post
  category.posts << post
  category.posts

# 11. List the posts authored by a given user
User.find(1).authored_posts

# 12. List the IDs of all posts authored by a given user (hint: there's an association method for this)
User.find(1).authored_post_ids

# 13. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
user1 = User.first
user2 = User.find(2)
post_ids1 = user1.authored_post_ids
post_ids2 = user2.authored_post_ids

user1.authored_post_ids = post_ids2
user2.authored_post_ids = post_ids1

user1.authored_posts
user2.authored_posts

user1.authored_post_ids = post_ids1
user2.authored_post_ids = post_ids2

# 14. List the authors of a given post
Post.first.authors

# 15. Set a collection of users to replace a given Post's authors in a similar way
post = Post.first
authors = post.authors
post.authors = User.all
post.authors = authors

# 16. Accomplish the same thing by only using IDs (hint: there's an association method for this...)
post1 = Post.first
post2 = Post.find(2)
author_ids1 = post1.author_ids
author_ids2 = post2.author_ids

post1.author_ids = author_ids2
post2.author_ids = author_ids1

post1.authors
post2.authors

post1.author_ids = author_ids1
post2.author_ids = author_ids2

# 17. List the posts under a given tag
Tag.first.tagged_posts

# 18. Add a new post to a given tag by only using its ID
tag = Tag.first
post = Post.first
tag.tagged_post_ids << post.id

# 19. Add a new tag to a given post by only using its ID
post = Post.find(3)
tag = Tag.last
post.tag_ids << tag.id

# 20. List the tags on a given post
Post.first.tags