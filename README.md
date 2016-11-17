# Overcollector
Overcollector is a tool that allows you to track all of your Overwatch cosmetics collection.  
Features include:
- Track owned cosmetics
- Filter by hero, type and category
- Wishlists (WIP)
- Statistics such as completion progress and credits needed to buy cosmetics (WIP)

## How to contribute

#### Setting up

##### Installing
- Fork this repository
- Clone your forked version of this repository
- In the topmost directory of the repository, run `composer install` (TODO how to install composer)

##### Configuring
- Make a copy of `overcollector.example` and rename it `overcollector.ini`. Never share this file, it will contain every sensitive information needed to connect to various things (Database, Battle.net API).
- Fill `overcollector.ini` appropriately.

#### Working
- Look for unresolved issues at (TODO url). If you want to implement something that isn't listed as an issue, add an issue before starting and wait for approval. This will avoid the frustration of working on an unwanted feature/fix and getting your pull request rejected.
- Get going
- Try to limit the size of commits (1 feature/fix per commit is ideal)
- Create a pull request for every commit

## TODO
- Implement wishlists
- Optimise DAO to avoid useless database calls
- Gold count