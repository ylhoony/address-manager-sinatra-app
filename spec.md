# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app => used Sinatra
- [x] Use ActiveRecord for storing information in a database => used ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
=> created 6 models - user, country, company, user_company, company_address, company_contacts
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
=> set has_many relationship
- [X] Include user accounts => created user signup/login routes
- [x] Ensure that users can't modify content created by other users
=> added condition to check the current_user and if the user has access on join table.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying => set up delete route on company_contacts only
- [x] Include user input validations => added validation to model
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) => used one for creating and editing country
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
