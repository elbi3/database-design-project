# Relationships

## Users
- User has 0 or many Comments
- User has 0 or many Submissions
- User makes 0 or many Upvotes

## Patterns
- Patterns have 1 and only 1 User who submitted the Pattern
- Patterns have 0 or many Pattern Comments
- Patterns have 0 or many Nested Comments that are children of Pattern Comments (technically these are comment-comment relationships)
- Patterns have 0 or many Upvotes

## Comments
- Comment has one and only one author(User)
- Comment has 0 or many Upvotes
- Comment references either 1 Pattern or 1 Submission or 1 Comment

## Nested Comments
- Nested Comments have one parent comment
- Nested Comments have 0 or many child comments


(wishlist table: )
## Upvote
- Upvotes have one User and one Comment, Pattern Comment, or Nested Comment

(upvotes have to be linked to user so that they are unique to the user to avoid spamming, and require registered users)
