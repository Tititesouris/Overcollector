# Overcollector
Overcollector is a tool that allows you to track all of your Overwatch cosmetics collection.  

#### Features
- Track cosmetics
- Filter by hero, category and type
- Get statistics about completion
- Get statistics about credits
- Easily add new cosmetics with the Open a Lootbox page
- Customize your collection with lots of settings

#### Work In Progress
- Adding images for menu icons

#### To Do
- Replace credits symbol to make it more readable (maybe with an image?)
- Only show items for current event on lootbox page
- Improve Welcome page
- Button "Go to top of the page" in collection
- Improve design
- Make FAQ
- Search in collection
- Wishlists
- Add settings for sort by "heroes", "heroes and types", "types", "categories", etc
- Fix display of buttons in collection on smaller screens
- Improve user profiles
- Statistics about probability on lootbox page
- Event optimisers
- Achievements tracker
- Recreate competitive gif sprays
- Compare collections
- Tracking over time


## How to contribute

#### Prerequisites
- [Composer](https://getcomposer.org/doc/00-intro.md)
- [PostgreSQL 9.5 or higher](https://www.postgresql.org/download/)
- PHP 5.6 or higher
- [A Battle.net application](https://dev.battle.net/)
- An HTTPS server (such as Apache or Nginx)

#### Installing
- Fork this repository
- Clone your forked version of this repository
- In the topmost directory of the repository, run `composer install`
- Create a database called `overcollector`
- Create a role called `overcollector` with a password of your choice
- In the database run the file `overcollector.sql` to create the database structure and `data.sql` to fill the database with data

#### Configuring
- Make a copy of `overcollector.example` and rename it `overcollector.ini`. Never share this file, it will contain all the sensitive information about the application
- Edit `overcollector.ini`: Set the Battle.net callback uri to go to the login page
- Make a copy of `maintenance.example` and rename it `maintenance.ini`. This file is only useful in a production environment.
- Make sure you can work locally on https (ignore browser warning about self-signed certificate)

#### Working
- Look for unresolved issues [here](https://github.com/Tititesouris/Overcollector/issues)
- Look for issues in existing code and [report](https://github.com/Tititesouris/Overcollector/issues) or fix them
- Look at the [To Do List](https://github.com/Tititesouris/Overcollector#to-do)
- Come up with something. To avoid wasting your time, [create an issue](https://github.com/Tititesouris/Overcollector/issues) first explaining what you want to do and wait for approval.
- Try to limit the size of commits (1 feature/fix per commit is ideal)
- Make a pull request for every commit
- Unsure about anything: [contact me](mailto:support@overcollector.com?subject=[Dev] )