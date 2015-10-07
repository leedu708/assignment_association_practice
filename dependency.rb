# Destroying a user should also destroy all of the comments that user authored
User.first.destroy

# Destroying a comment should NOT destroy its author or its parent post
Comment.first.destroy

# Destroying a post should destroy all comments on it.
Post.first.destroy

# Destroying a post should NOT destroy all its authors but it shouldn't leave any lines in the join table which still point to it (so, for instance, asking User.first.authored_post_ids should NOT return ids from posts that were destroyed and User.first.post_authorings should be empty)
Post.find(2).destroy

# Destroying a category should NOT destroy posts under it, and destroying a post should certainly not destroy its category
Category.first.destroy
Post.first.destroy

# Same for authors -- destroying a user should NOT destroy all the posts they wrote (there may be co-authors and the readers still want to read them!) but it should not continue to list that author among a given post's authors.
User.first.destroy

# Use the same logic to ensure that Tags and Posts do not leave any dangling foreign keys that point to non-existant objects.
Tag.first.destroy
Post.first.destroy