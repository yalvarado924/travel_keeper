# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Added the Sinatra gem & is in the environment.rb file
- [x] Use ActiveRecord for storing information in a database - used ActiveRecord migrations to create tables and store seed data
- [x] Include more than one model class (e.g. User, Post, Category) - User model & Destination model class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many Destinations
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Destination belongs_to User
- [x] Include user accounts with unique login attribute (username or email) - applied validations for unique username
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Destinations has CRUD routes
- [x] Ensure that users can't modify content created by other users - Users can't modify Destinations that dont' belong to them
- [x] Include user input validations - created validations for forms & routes they're not allowed to go to
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - flash & error messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - created README per instructions

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
