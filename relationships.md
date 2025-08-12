- User has 0 or many Comments
- User has 0 or many Submissions
- User makes 0 or many Upvotes

(let's pretend we have an API for the pattern data input)
- Patterns have 0 or many Comments
- Patterns have 0 or many Submissions

- Comment has one author(User)
- Comment has 0 or many Upvotes

- Submission has one and only one author
- Submission has 0 or many Comments
- Submission has 0 or many Upvotes

- Upvotes have one User and one Comment 
- Upvotes have one User and one Submission
- Upvotes have one User and one Pattern

(upvotes have to be linked to user so that they are unique to the user to avoid spamming, and require registered users)
