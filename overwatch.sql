DROP OWNED BY overwatch;
DROP TABLE IF EXISTS characters, categories, types, rarities, cosmetics, users, user_cosmetics;
DROP ROLE IF EXISTS overwatch;

CREATE ROLE overwatch WITH LOGIN PASSWORD 'localpass';

CREATE TABLE characters (
  id   INTEGER,
  name TEXT NOT NULL,
  CONSTRAINT pk_characters PRIMARY KEY (id)
);
GRANT SELECT ON TABLE characters TO overwatch;

INSERT INTO characters (id, name)
VALUES
  (1, 'Ana'),
  (2, 'Bastion'),
  (3, 'D.Va'),
  (4, 'Genji'),
  (5, 'Hanzo'),
  (6, 'Junkrat'),
  (7, 'Lúcio'),
  (8, 'McCree'),
  (9, 'Mei'),
  (10, 'Mercy'),
  (11, 'Pharah'),
  (12, 'Reaper'),
  (13, 'Reinhardt'),
  (14, 'Roadhog'),
  (15, 'Soldier: 76'),
  (16, 'Sombra'),
  (17, 'Symmetra'),
  (18, 'Torbjörn'),
  (19, 'Tracer'),
  (20, 'Widowmaker'),
  (21, 'Wiston'),
  (22, 'Zarya'),
  (23, 'Zenyatta');


CREATE TABLE categories (
  id          INTEGER,
  name        TEXT NOT NULL,
  description TEXT NOT NULL,
  CONSTRAINT pk_categories PRIMARY KEY (id)
);
GRANT SELECT ON TABLE categories TO overwatch;

INSERT INTO categories (id, name, description)
VALUES
  (1, 'Normal', 'Unlockable by opening normal Loot Boxes or by spending the normal amount of credits.'),
  (2, 'Achievements', 'Unlockable by completing achievements.'),
  (3, 'Origins Edition', 'Unlockable by buying the Origins Edition of Overwatch.'),
  (4, 'Preorder', 'Unlockable by preodering Overwatch.'),
  (5, 'Competitive', 'Unlockable through the competitive system.'),
  (6, 'Summer Games', 'Unlockable by opening Summer Games Loot Boxes.'),
  (7, 'Halloween',
   'Unlockable by opening Halloween Loot Boxes or by spending 3 times the normal amount of credits during the Halloween event.'),
  (8, 'BlizzCon', 'Unlockable by purchasing a BlizzCon ticket.');


CREATE TABLE types (
  id   INTEGER,
  name TEXT NOT NULL,
  CONSTRAINT pk_types PRIMARY KEY (id)
);
GRANT SELECT ON TABLE types TO overwatch;

INSERT INTO types (id, name)
VALUES
  (1, 'Player Icon'),
  (2, 'Skin'),
  (3, 'Emote'),
  (4, 'Victory Pose'),
  (5, 'Voice Line'),
  (6, 'Spray'),
  (7, 'Highlight Intro'),
  (8, 'Weapon');


CREATE TABLE rarities (
  id         INTEGER,
  name       TEXT    NOT NULL,
  base_price INTEGER NOT NULL,
  CONSTRAINT pk_rarities PRIMARY KEY (id)
);
GRANT SELECT ON TABLE rarities TO overwatch;

INSERT INTO rarities (id, name, base_price)
VALUES
  (1, 'Common', 25),
  (2, 'Rare', 75),
  (3, 'Epic', 250),
  (4, 'Legendary', 1000),
  (5, 'Weapon', 3000);


CREATE TABLE cosmetics (
  id           SERIAL,
  category_id  INTEGER,
  type_id      INTEGER NOT NULL,
  rarity_id    INTEGER,
  character_id INTEGER,
  name         TEXT    NOT NULL,
  patch        DATE,
  CONSTRAINT pk_cosmetics PRIMARY KEY (id),
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES types (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_rarity FOREIGN KEY (rarity_id) REFERENCES rarities (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_character FOREIGN KEY (character_id) REFERENCES characters (id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);
GRANT SELECT ON TABLE cosmetics TO overwatch;

INSERT INTO cosmetics (category_id, type_id, rarity_id, character_id, name, patch)
VALUES
  (NULL, 1, NULL, NULL, 'Overwatch Dark', '2016-05-24'), -- Default All Heroes Player Icons
  (NULL, 1, NULL, NULL, 'Overwatch Light', '2016-05-24'),
  (1, 1, 1, NULL, '16-Bit Hero', '2016-05-24'), -- Normal All Heroes Player Icons
  (1, 1, 1, NULL, 'Anubis', '2016-05-24'),
  (1, 1, 1, NULL, 'Bao', '2016-05-24'),
  (1, 1, 1, NULL, 'Barbarian', '2016-05-24'),
  (1, 1, 1, NULL, 'Capsule', '2016-05-24'),
  (1, 1, 1, NULL, 'Cheers', '2016-05-24'),
  (1, 1, 1, NULL, 'Colossus', '2016-05-24'),
  (1, 1, 1, NULL, 'Credit', '2016-05-24'),
  (1, 1, 1, NULL, 'Crusader', '2016-05-24'),
  (1, 1, 1, NULL, 'Dark Lady', '2016-05-24'),
  (1, 1, 1, NULL, 'Demolition', '2016-05-24'),
  (1, 1, 1, NULL, 'Demon Hunter', '2016-05-24'),
  (1, 1, 1, NULL, 'Dominion', '2016-05-24'),
  (1, 1, 1, NULL, 'Elephant', '2016-05-24'),
  (1, 1, 1, NULL, 'For The Alliance', '2016-05-24'),
  (1, 1, 1, NULL, 'For The Horde', '2016-05-24'),
  (1, 1, 1, NULL, 'From Beyond The Moon', '2016-05-24'),
  (1, 1, 1, NULL, 'Garrosh', '2016-05-24'),
  (1, 1, 1, NULL, 'Happy Squid', '2016-05-24'),
  (1, 1, 1, NULL, 'Hearthstone', '2016-05-24'),
  (1, 1, 1, NULL, 'Hierarch', '2016-05-24'),
  (1, 1, 1, NULL, 'Jaina', '2016-05-24'),
  (1, 1, 1, NULL, 'Jim', '2016-05-24'),
  (1, 1, 1, NULL, 'Kofi Aromo', '2016-05-24'),
  (1, 1, 1, NULL, 'Lich King', '2016-05-24'),
  (1, 1, 1, NULL, 'Loot Box', '2016-05-24'),
  (1, 1, 1, NULL, 'Lord Of Candy', '2016-05-24'),
  (1, 1, 1, NULL, 'Lord Of Terror', '2016-05-24'),
  (1, 1, 1, NULL, 'Los Muertos', '2016-05-24'),
  (1, 1, 1, NULL, 'Mama Pig''s', '2016-05-24'),
  (1, 1, 1, NULL, 'Mariachi', '2016-05-24'),
  (1, 1, 1, NULL, 'Mech', '2016-05-24'),
  (1, 1, 1, NULL, 'Monk', '2016-05-24'),
  (1, 1, 1, NULL, 'Nexus', '2016-05-24'),
  (1, 1, 1, NULL, 'Pachimari', '2016-05-24'),
  (1, 1, 1, NULL, 'Pharaoh', '2016-05-24'),
  (1, 1, 1, NULL, 'Protoss', '2016-05-24'),
  (1, 1, 1, NULL, 'Queen Of Blades', '2016-05-24'),
  (1, 1, 1, NULL, 'Ramen', '2016-05-24'),
  (1, 1, 1, NULL, 'Rhino', '2016-05-24'),
  (1, 1, 1, NULL, 'Rikimaru', '2016-05-24'),
  (1, 1, 1, NULL, 'Route 66', '2016-05-24'),
  (1, 1, 1, NULL, 'Sakura', '2016-05-24'),
  (1, 1, 1, NULL, 'Scooter', '2016-05-24'),
  (1, 1, 1, NULL, 'Siege Mode', '2016-05-24'),
  (1, 1, 1, NULL, 'Six-Gun Killer', '2016-05-24'),
  (1, 1, 1, NULL, 'Svyatogor', '2016-05-24'),
  (1, 1, 1, NULL, 'Terran', '2016-05-24'),
  (1, 1, 1, NULL, 'Totem', '2016-05-24'),
  (1, 1, 1, NULL, 'Training Bot', '2016-05-24'),
  (1, 1, 1, NULL, 'Varian', '2016-05-24'),
  (1, 1, 1, NULL, 'Vivi', '2016-05-24'),
  (1, 1, 1, NULL, 'Witch Doctor', '2016-05-24'),
  (1, 1, 1, NULL, 'Wizard', '2016-05-24'),
  (1, 1, 1, NULL, 'You Are Not Prepared', '2016-07-19'),
  (1, 1, 1, NULL, 'Zerg', '2016-05-24'),
  (5, 1, 1, NULL, 'Season 1 Competitor', '2016-06-28'), -- Competitive All Heroes Player Icons
  (5, 1, 1, NULL, 'Season 1 Hero', '2016-06-28'),
  (5, 1, 1, NULL, 'Season 2 Competitor', '2016-06-28'),
  (5, 1, 1, NULL, 'Season 2 Hero', '2016-06-28'),
  (5, 1, 1, NULL, 'Top 500', '2016-06-28'),
  (6, 1, 1, NULL, 'Australia', '2016-08-02'), -- Summer Games All Heroes Player Icons
  (6, 1, 1, NULL, 'Brazil', '2016-08-02'),
  (6, 1, 1, NULL, 'China', '2016-08-02'),
  (6, 1, 1, NULL, 'Egypt', '2016-08-02'),
  (6, 1, 1, NULL, 'France', '2016-08-02'),
  (6, 1, 1, NULL, 'Germany', '2016-08-02'),
  (6, 1, 1, NULL, 'Greece', '2016-08-02'),
  (6, 1, 1, NULL, 'Japan', '2016-08-02'),
  (6, 1, 1, NULL, 'Mexico', '2016-08-02'),
  (6, 1, 1, NULL, 'Nepal', '2016-08-02'),
  (6, 1, 1, NULL, 'Numbani', '2016-08-02'),
  (6, 1, 1, NULL, 'Russia', '2016-08-02'),
  (6, 1, 1, NULL, 'South Korea', '2016-08-02'),
  (6, 1, 1, NULL, 'Summer Games 2016', '2016-08-02'),
  (6, 1, 1, NULL, 'Sweden', '2016-08-02'),
  (6, 1, 1, NULL, 'Switzerland', '2016-08-02'),
  (6, 1, 1, NULL, 'United Kingdom', '2016-08-02'),
  (6, 1, 1, NULL, 'United States Of America', '2016-08-02'),
  (7, 1, 1, NULL, '...Never Die', '2016-10-11'), -- Halloween All Heroes Player Icons
  (7, 1, 1, NULL, 'Bewitching', '2016-10-11'),
  (7, 1, 1, NULL, 'Calavera', '2016-10-11'),
  (7, 1, 1, NULL, 'Candle', '2016-10-11'),
  (7, 1, 1, NULL, 'Eyeball', '2016-10-11'),
  (7, 1, 1, NULL, 'Ghostymari', '2016-10-11'),
  (7, 1, 1, NULL, 'Halloween Terror 2016', '2016-10-11'),
  (7, 1, 1, NULL, 'Spider', '2016-10-11'),
  (7, 1, 1, NULL, 'Superstition', '2016-10-11'),
  (7, 1, 1, NULL, 'Tombstone', '2016-10-11'),
  (7, 1, 1, NULL, 'Vampachimari', '2016-10-11'),
  (7, 1, 1, NULL, 'Witch''s Brew', '2016-10-11'),
  (7, 1, 1, NULL, 'Witch''s Hat', '2016-10-11'),
  (7, 1, 1, NULL, 'Wolf', '2016-10-11'),
  (1, 1, 1, 1, 'Ana', '2016-07-19'), -- Normal Ana Player Icons
  (1, 1, 1, 1, 'Watcher', '2016-07-19'),
  (1, 1, 1, 1, 'Wedjat', '2016-07-19'),
  (6, 1, 1, 1, 'Shooting', '2016-08-02'), -- Summer Games Ana Player Icons
  (1, 1, 1, 2, 'Bastion', '2016-05-24'), -- Normal Bastion Player Icons
  (1, 1, 1, 2, 'Ganymede', '2016-05-24'),
  (1, 1, 1, 2, 'Tank Crossing', '2016-05-24'),
  (6, 1, 1, 2, 'Boxing', '2016-08-02'), -- Summer Games Bastion Player Icons
  (1, 1, 1, 3, 'D.Va', '2016-05-24'), -- Normal D.Va Player Icons
  (1, 1, 1, 3, 'Bunny', '2016-05-24'),
  (1, 1, 1, 3, 'Charm', '2016-05-24'),
  (6, 1, 1, 3, 'Cycling', '2016-08-02'), -- Summer Games D.Va Player Icons
  (1, 1, 1, 4, 'Genji', '2016-05-24'), -- Normal Genji Player Icons
  (1, 1, 1, 4, 'God Of War', '2016-05-24'),
  (1, 1, 1, 4, 'Nin', '2016-05-24'),
  (6, 1, 1, 4, 'Fencing', '2016-08-02'), -- Summer Games Genji Player Icons
  --The Doctor  The Reaper  The Witch
  (1, 2, 2, 1, 'Citrine', NULL),
  (1, 2, 2, 1, 'Garnet', NULL),
  (1, 2, 2, 1, 'Peridot', NULL),
  (1, 2, 2, 1, 'Turquoise', NULL),
  (7, 2, 3, 1, 'Ghoul', NULL),
  (1, 2, 3, 1, 'Merciful', NULL);


CREATE TABLE users (
  id       SERIAL,
  username TEXT NOT NULL,
  CONSTRAINT pk_users PRIMARY KEY (id)
);
GRANT SELECT ON TABLE users TO overwatch;

INSERT INTO users (username)
VALUES
  ('Tititesouris');


CREATE TABLE user_cosmetics (
  user_id     INTEGER NOT NULL,
  cosmetic_id INTEGER NOT NULL,
  CONSTRAINT pk_user_cosmetics PRIMARY KEY (user_id, cosmetic_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_cosmetic FOREIGN KEY (cosmetic_id) REFERENCES cosmetics (id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);
GRANT SELECT, INSERT, DELETE ON TABLE user_cosmetics TO overwatch;

INSERT INTO user_cosmetics (user_id, cosmetic_id)
VALUES
  (1, 15),
  (1, 25);