# database-design-project

This EER is designed around Users, their submissions (of content and comments), and their relationship with both the content they add and that content in reference to pre-existing Sewing Patterns. The most important data here will be between the Users and the Patterns. Without the connecting categories (comments, submissions), there would be no point for storing User or Pattern data. 

One challenge yet to be determined is how to handle upvoting the comments, submissions, and patterns, while maintaining the relationship between an existing User and a Pattern.
