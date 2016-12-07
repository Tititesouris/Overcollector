# Overcollector
Overcollector is a tool that allows you to track all of your Overwatch cosmetics collection.  

#### Features
- Track owned cosmetics
- Filter by hero, category and type
- Get statistics about completion
- Get statistics about credits

#### Work In Progress
- Adding images for Dia de los Muertos and menu icons
- Adding data for Christmas event
- Improve README
- Improve Welcome page
- Improve design

#### To Do
- On prod server only, figure out how to keep sessions open longer
- "Open a Lootbox" page where you can quickly input a couple new items
- Change import dialog to work cross browser
- Add settings for sort by "heroes", "heroes and types", "types", "categories", etc
- Add setting for "group all player icons together"
- Optimise DAO to avoid useless database calls
- Button "Go to top of the page" in collection
- Fix display of buttons in collection on smaller screens
- Improve user profiles
- Make FAQ
- Search in collection
- Wishlists
- Statistics about probability in lootboxes
- Event optimisers
- Achievements tracker
- Recreate competitive gif sprays
- Compare collections


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
- Make sure you can work locally on https (ignore browser warning about self-signed certificate)

#### Working
- Look for unresolved issues [here](https://github.com/Tititesouris/Overcollector/issues)
- Look for issues in existing code and [report](https://github.com/Tititesouris/Overcollector/issues) or fix them
- Look at the [To Do List](https://github.com/Tititesouris/Overcollector#to-do)
- Come up with something. To avoid wasting your time, [create an issue](https://github.com/Tititesouris/Overcollector/issues) first explaining what you want to do and wait for approval.
- Try to limit the size of commits (1 feature/fix per commit is ideal)
- Make a pull request for every commit
- Unsure about anything: [contact me](mailto:support@overcollector.com?subject=[Dev] )