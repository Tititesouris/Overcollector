# Overcollector
Overcollector is a tool that allows you to track all of your Overwatch cosmetics collection.  

#### Features
- Track owned cosmetics
- Filter by hero, category and type
- Get statistics about owned cosmetics

#### Work In Progress
- Wishlists
- Improve README
- Improve Welcome page
- Improve design

#### To Do
- Make FAQ
- Statistics about credits (worth of collection and missing)
- Statistics about probability in lootboxes
- Achievements tracker
- Event optimisers
- User profiles
- Optimise DAO to avoid useless database calls


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
- In the database run the file `overcollector.sql` to create the database structure and `data.sql` to fill the database with data.

#### Configuring
- Make a copy of `overcollector.example` and rename it `overcollector.ini`. Never share this file, it will contain all the sensitive information about the application.
- Edit `overcollector.ini` appropriately
- Make sure you can work locally on https (ignore browser warning about self-signed certificate)

#### Working
- Look for unresolved issues [here](https://github.com/Tititesouris/Overcollector/issues)
- Look for issues in existing code and [report](https://github.com/Tititesouris/Overcollector/issues) or fix them
- Look at the [To Do List](https://github.com/Tititesouris/Overcollector#to-do)
- Come up with something. To avoid wasting your time, [create an issue](https://github.com/Tititesouris/Overcollector/issues) first explaining what you want to do and wait for approval.
- Try to limit the size of commits (1 feature/fix per commit is ideal)
- Make a pull request for every commit
- Unsure about anything: [contact me](mailto:dev@overcollector.com?subject=[Dev] )