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
  (16, 'Symmetra'),
  (17, 'Torbjörn'),
  (18, 'Tracer'),
  (19, 'Widowmaker'),
  (20, 'Wiston'),
  (21, 'Zarya'),
  (22, 'Zenyatta'),
  (23, 'Sombra');


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
  -- Player Icons
  (NULL, 1, NULL, NULL, 'Overwatch Dark', '2016-05-24'), -- Default All Heroes Player Icons
  (NULL, 1, NULL, NULL, 'Overwatch Light', '2016-05-24'),
  (NULL, 1, NULL, NULL, 'You Are Not Prepared', '2016-07-19'),
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
  (1, 1, 1, NULL, 'Zerg', '2016-05-24'),
  (5, 1, 1, NULL, 'Season 1 Competitor', '2016-06-28'), -- Competitive All Heroes Player Icons
  (5, 1, 1, NULL, 'Season 1 Hero', '2016-06-28'),
  (5, 1, 1, NULL, 'Season 2 Competitor', '2016-07-02'),
  (5, 1, 1, NULL, 'Season 2 Hero', '2016-07-02'),
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
  (1, 1, 1, 5, 'Hanzo', '2016-05-24'), -- Normal Hanzo Player Icons
  (1, 1, 1, 5, 'Shimada', '2016-05-24'),
  (1, 1, 1, 5, 'Storm', '2016-05-24'),
  (6, 1, 1, 5, 'Archery', '2016-08-02'), -- Summer Games Hanzo Player Icons
  (1, 1, 1, 6, 'Ahhhh!', '2016-05-24'), -- Normal Junkrat Player Icons
  (1, 1, 1, 6, 'Have A Nice Day!', '2016-05-24'),
  (1, 1, 1, 6, 'Junkrat', '2016-05-24'),
  (6, 1, 1, 6, 'Tennis', '2016-08-02'), -- Summer Games Junkrat Player Icons
  (7, 1, 1, 6, 'The Doctor', '2016-10-11'), -- Halloween Junkrat Player Icons
  (1, 1, 1, 7, 'Frog', '2016-05-24'), -- Normal Lúcio Player Icons
  (1, 1, 1, 7, 'Kambô', '2016-05-24'),
  (1, 1, 1, 7, 'Lúcio', '2016-05-24'),
  (6, 1, 1, 7, 'Football', '2016-08-02'), -- Summer Games Lúcio Player Icons
  (1, 1, 1, 8, 'Badge', '2016-05-24'), -- Normal McCree Player Icons
  (1, 1, 1, 8, 'Deadeye', '2016-05-24'),
  (1, 1, 1, 8, 'McCree', '2016-05-24'),
  (6, 1, 1, 8, 'Equestrian', '2016-08-02'), -- Summer Games McCree Player Icons
  (1, 1, 1, 9, 'Hairpin', '2016-05-24'), -- Normal Mei Player Icons
  (1, 1, 1, 9, 'Mei', '2016-05-24'),
  (1, 1, 1, 9, 'Snowball', '2016-05-24'),
  (6, 1, 1, 9, 'Table Tennis', '2016-08-02'), -- Summer Games Mei Player Icons
  (1, 1, 1, 10, 'Guardian Angel', '2016-05-24'), -- Normal Mercy Player Icons
  (1, 1, 1, 10, 'Mercy', '2016-05-24'),
  (1, 1, 1, 10, 'Valkyrie', '2016-05-24'),
  (6, 1, 1, 10, 'Badminton', '2016-08-02'), -- Summer Games Mercy Player Icons
  (7, 1, 1, 10, 'The Witch', '2016-10-11'), -- Halloween Mercy Player Icons
  (1, 1, 1, 11, 'Pharah', '2016-05-24'), -- Normal Pharah Player Icons
  (1, 1, 1, 11, 'Raptora', '2016-05-24'),
  (1, 1, 1, 11, 'Wadjet', '2016-05-24'),
  (6, 1, 1, 11, 'Basketball', '2016-08-02'), -- Summer Games Pharah Player Icons
  (1, 1, 1, 12, 'Emblem', '2016-05-24'), -- Normal Reaper Player Icons
  (1, 1, 1, 12, 'Reaper', '2016-05-24'),
  (1, 1, 1, 12, 'Soul Globe', '2016-05-24'),
  (6, 1, 1, 12, 'BMX', '2016-08-02'), -- Summer Games Reaper Player Icons
  (7, 1, 1, 12, 'The Reaper', '2016-10-11'), -- Halloween Reaper Player Icons
  (1, 1, 1, 13, 'Lionhardt', '2016-05-24'), -- Normal Reinhardt Player Icons
  (1, 1, 1, 13, 'Reinhardt', '2016-05-24'),
  (1, 1, 1, 13, 'Scar', '2016-05-24'),
  (6, 1, 1, 13, 'Wrestling', '2016-08-02'), -- Summer Games Reinhardt Player Icons
  (1, 1, 1, 14, 'Hook', '2016-05-24'), -- Normal Roadhog Player Icons
  (1, 1, 1, 14, 'Piggy', '2016-05-24'),
  (1, 1, 1, 14, 'Roadhog', '2016-05-24'),
  (6, 1, 1, 14, 'Diving', '2016-08-02'), -- Summer Games Roadhog Player Icons
  (7, 1, 1, 14, 'The Monster', '2016-10-11'), -- Halloween Roadhog Player Icons
  (1, 1, 1, 15, '76', '2016-05-24'), -- Normal Soldier: 76 Player Icons
  (1, 1, 1, 15, 'Soldier: 76', '2016-05-24'),
  (1, 1, 1, 15, 'Strike-Commander', '2016-05-24'),
  (6, 1, 1, 15, 'Golf', '2016-08-02'), -- Summer Games Soldier: 76 Player Icons
  (1, 1, 1, 16, 'Sentry', '2016-05-24'), -- Normal Symmetra Player Icons
  (1, 1, 1, 16, 'Symmetra', '2016-05-24'),
  (1, 1, 1, 16, 'Vishkar', '2016-05-24'),
  (6, 1, 1, 16, 'Rythmic Gymnastics', '2016-08-02'), -- Summer Games Symmetra Player Icons
  (1, 1, 1, 17, 'Forge', '2016-05-24'), -- Normal Torbjörn Player Icons
  (1, 1, 1, 17, 'Gears', '2016-05-24'),
  (1, 1, 1, 17, 'Torbjörn', '2016-05-24'),
  (6, 1, 1, 17, 'Water Polo', '2016-08-02'), -- Summer Games Torbjörn Player Icons
  (1, 1, 1, 18, 'Patch', '2016-05-24'), -- Normal Tracer Player Icons
  (1, 1, 1, 18, 'Pulse Bomb', '2016-05-24'),
  (1, 1, 1, 18, 'Tracer', '2016-05-24'),
  (6, 1, 1, 18, 'Track', '2016-08-02'), -- Summer Games Tracer Player Icons
  (1, 1, 1, 19, 'Baiser', '2016-05-24'), -- Normal Widowmaker Player Icons
  (1, 1, 1, 19, 'Grappling Hook', '2016-05-24'),
  (1, 1, 1, 19, 'Widowmaker', '2016-05-24'),
  (6, 1, 1, 19, 'Gymnastics', '2016-08-02'), -- Summer Games Widowmaker Player Icons
  (1, 1, 1, 20, 'Lunar Ops', '2016-05-24'), -- Normal Winston Player Icons
  (1, 1, 1, 20, 'Peanut Butter', '2016-05-24'),
  (1, 1, 1, 20, 'Winston', '2016-05-24'),
  (6, 1, 1, 20, 'Volleyball', '2016-08-02'), -- Summer Games Winston Player Icons
  (1, 1, 1, 21, '512', '2016-05-24'), -- Normal Zarya Player Icons
  (1, 1, 1, 21, 'Particle Barrier', '2016-05-24'),
  (1, 1, 1, 21, 'Zarya', '2016-05-24'),
  (6, 1, 1, 21, 'Weightlifting', '2016-08-02'), -- Summer Games Zarya Player Icons
  (1, 1, 1, 22, 'Harmony', '2016-05-24'), -- Normal Zenyatta Player Icons
  (1, 1, 1, 22, 'Meditation Barrier', '2016-05-24'),
  (1, 1, 1, 22, 'Zenyatta', '2016-05-24'),
  (6, 1, 1, 22, 'Taekwondo', '2016-08-02'), -- Summer Games Zenyatta Player Icons
  -- Skins TODO defaults
  (1, 2, 2, 1, 'Citrine', '2016-07-19'), -- Normal Ana Skins
  (1, 2, 2, 1, 'Garnet', '2016-07-19'),
  (1, 2, 2, 1, 'Peridot', '2016-07-19'),
  (1, 2, 2, 1, 'Turquoise', '2016-07-19'),
  (1, 2, 3, 1, 'Merciful', '2016-07-19'),
  (1, 2, 3, 1, 'Shrike', '2016-07-19'),
  (1, 2, 4, 1, 'Wadjet', '2016-07-19'),
  (1, 2, 4, 1, 'Wasteland', '2016-07-19'),
  (1, 2, 4, 1, 'Captain Amari', '2016-07-19'),
  (1, 2, 4, 1, 'Horus', '2016-07-19'),
  (7, 2, 3, 1, 'Ghoul', '2016-10-11'), -- Halloween Ana Skins
  (1, 2, 2, 2, 'Dawn', '2016-05-24'), -- Normal Bastion Skins
  (1, 2, 2, 2, 'Meadow', '2016-05-24'),
  (1, 2, 2, 2, 'Sky', '2016-05-24'),
  (1, 2, 2, 2, 'Soot', '2016-05-24'),
  (1, 2, 3, 2, 'Defense Matrix', '2016-05-24'),
  (1, 2, 3, 2, 'Omnic Crisis', '2016-05-24'),
  (1, 2, 4, 2, 'Antique', '2016-05-24'),
  (1, 2, 4, 2, 'Gearbot', '2016-05-24'),
  (1, 2, 4, 2, 'Steambot', '2016-05-24'),
  (1, 2, 4, 2, 'Woodbot', '2016-05-24'),
  (3, 2, 4, 2, 'Overgrown', '2016-05-24'), -- Origins Edition Bastion Skins
  (7, 2, 3, 2, 'Tombstone', '2016-10-11'), -- Halloween Bastion Skins
  (8, 2, 3, 2, 'BlizzCon 2016', '2016-10-11'), -- BlizzCon Bastion Skins TODO Try to find exact release date
  (1, 2, 2, 3, 'Blueberry', '2016-05-24'), -- Normal D.Va Skins
  (1, 2, 2, 3, 'Lemon-Lime', '2016-05-24'),
  (1, 2, 2, 3, 'Tangerine', '2016-05-24'),
  (1, 2, 2, 3, 'Watermelon', '2016-05-24'),
  (1, 2, 3, 3, 'Carbon Fiber', '2016-05-24'),
  (1, 2, 3, 3, 'White Rabbit', '2016-05-24'),
  (1, 2, 4, 3, 'B.Va', '2016-05-24'),
  (1, 2, 4, 3, 'Junebug', '2016-05-24'),
  (1, 2, 4, 3, 'Junker', '2016-05-24'),
  (1, 2, 4, 3, 'Scavenger', '2016-05-24'),
  (6, 2, 3, 3, 'Taegeukgi', '2016-08-02'), -- Summer Games D.Va Skins
  (1, 2, 2, 4, 'Azurite', '2016-05-24'), -- Normal Genji Skins
  (1, 2, 2, 4, 'Cinnabar', '2016-05-24'),
  (1, 2, 2, 4, 'Malachite', '2016-05-24'),
  (1, 2, 2, 4, 'Ochre', '2016-05-24'),
  (1, 2, 3, 4, 'Carbon Fiber', '2016-05-24'), --TODO double check name
  (1, 2, 3, 4, 'Chrome', '2016-05-24'),
  (1, 2, 4, 4, 'Bedouin', '2016-05-24'),
  (1, 2, 4, 4, 'Nomad', '2016-05-24'),
  (1, 2, 4, 4, 'Sparrow', '2016-05-24'),
  (1, 2, 4, 4, 'Young Genji', '2016-05-24'),
  (6, 2, 3, 4, 'Nihon', '2016-08-02'), -- Summer Games Genji Skins
  (1, 2, 2, 5, 'Azuki', '2016-05-24'), -- Normal Hanzo Skins
  (1, 2, 2, 5, 'Kinoko', '2016-05-24'),
  (1, 2, 2, 5, 'Midori', '2016-05-24'),
  (1, 2, 2, 5, 'Sora', '2016-05-24'),
  (1, 2, 3, 5, 'Cloud', '2016-05-24'),
  (1, 2, 3, 5, 'Dragon', '2016-05-24'),
  (1, 2, 4, 5, 'Lone Wolf', '2016-05-24'),
  (1, 2, 4, 5, 'Okami', '2016-05-24'),
  (1, 2, 4, 5, 'Young Hanzo', '2016-05-24'),
  (1, 2, 4, 5, 'Young Master', '2016-05-24'),
  (6, 2, 3, 5, 'Demon', '2016-08-02'), -- Summer Games Hanzo Skins
  (1, 2, 2, 6, 'Bleached', '2016-05-24'), -- Normal Junkrat Skins
  (1, 2, 2, 6, 'Drowned', '2016-05-24'),
  (1, 2, 2, 6, 'Irradiated', '2016-05-24'),
  (1, 2, 2, 6, 'Rusted', '2016-05-24'),
  (1, 2, 3, 6, 'Jailbird', '2016-05-24'),
  (1, 2, 3, 6, 'Toasted', '2016-05-24'),
  (1, 2, 4, 6, 'Fool', '2016-05-24'),
  (1, 2, 4, 6, 'Hayseed', '2016-05-24'),
  (1, 2, 4, 6, 'Jester', '2016-05-24'),
  (1, 2, 4, 6, 'Scarecrow', '2016-05-24'),
  (7, 2, 4, 6, 'Dr. Junkenstein', '2016-10-11'), -- Halloween Junkrat Skins
  (1, 2, 2, 7, 'Azul', '2016-05-24'), -- Normal Lúcio Skins
  (1, 2, 2, 7, 'Laranja', '2016-05-24'),
  (1, 2, 2, 7, 'Roxo', '2016-05-24'),
  (1, 2, 2, 7, 'Vermelho', '2016-05-24'),
  (1, 2, 3, 7, 'Auditiva', '2016-05-24'),
  (1, 2, 3, 7, 'Synaesthesia', '2016-05-24'),
  (1, 2, 4, 7, 'Breakaway', '2016-05-24'),
  (1, 2, 4, 7, 'Hippityhop', '2016-05-24'),
  (1, 2, 4, 7, 'Ribbit', '2016-05-24'),
  (1, 2, 4, 7, 'Slapshot', '2016-05-24'),
  (6, 2, 4, 7, 'Seleção', '2016-08-02'), -- Summer Games Lúcio Skins
  (6, 2, 4, 7, 'Striker', '2016-08-02'),
  (1, 2, 2, 8, 'Ebony', '2016-05-24'), -- Normal McCree Skins
  (1, 2, 2, 8, 'Lake', '2016-05-24'),
  (1, 2, 2, 8, 'Sage', '2016-05-24'),
  (1, 2, 2, 8, 'Wheat', '2016-05-24'),
  (1, 2, 3, 8, 'On The Range', '2016-05-24'),
  (1, 2, 3, 8, 'White Hat', '2016-05-24'),
  (1, 2, 4, 8, 'Gambler', '2016-05-24'),
  (1, 2, 4, 8, 'Mystery Man', '2016-05-24'),
  (1, 2, 4, 8, 'Riverboat', '2016-05-24'),
  (1, 2, 4, 8, 'Vigilante', '2016-05-24'),
  (6, 2, 3, 8, 'American', '2016-08-02'), -- Summer Games McCree Skins
  (1, 2, 2, 9, 'Chrysanthemum', '2016-05-24'), -- Normal Mei Skins
  (1, 2, 2, 9, 'Heliotrope', '2016-05-24'),
  (1, 2, 2, 9, 'Jade', '2016-05-24'),
  (1, 2, 2, 9, 'Persimmon', '2016-05-24'),
  (1, 2, 3, 9, 'Earthen', '2016-05-24'),
  (1, 2, 3, 9, 'Snow Plum', '2016-05-24'),
  (1, 2, 4, 9, 'Abominable', '2016-05-24'),
  (1, 2, 4, 9, 'Firefighter', '2016-05-24'),
  (1, 2, 4, 9, 'Rescue Mei', '2016-05-24'),
  (1, 2, 4, 9, 'Yeti Hunter', '2016-05-24'),
  (1, 2, 2, 10, 'Celestial', '2016-05-24'), -- Normal Mercy Skins
  (1, 2, 2, 10, 'Mist', '2016-05-24'),
  (1, 2, 2, 10, 'Orchid', '2016-05-24'),
  (1, 2, 2, 10, 'Verdant', '2016-05-24'),
  (1, 2, 3, 10, 'Amber', '2016-05-24'),
  (1, 2, 3, 10, 'Cobalt', '2016-05-24'),
  (1, 2, 4, 10, 'Devil', '2016-05-24'),
  (1, 2, 4, 10, 'Imp', '2016-05-24'),
  (1, 2, 4, 10, 'Sigrún', '2016-05-24'),
  (1, 2, 4, 10, 'Valkyrie', '2016-05-24'),
  (6, 2, 3, 10, 'Eidgenossin', '2016-08-02'), -- Summer Games Mercy Skins
  (7, 2, 4, 10, 'Witch', '2016-10-11'), -- Halloween Mercy Skins
  (1, 2, 2, 11, 'Amethyst', '2016-05-24'), -- Normal Pharah Skins
  (1, 2, 2, 11, 'Copper', '2016-05-24'),
  (1, 2, 2, 11, 'Emerald', '2016-05-24'),
  (1, 2, 2, 11, 'Titanium', '2016-05-24'),
  (1, 2, 3, 11, 'Anubis', '2016-05-24'),
  (1, 2, 3, 11, 'Jackal', '2016-05-24'),
  (1, 2, 4, 11, 'Mechaqueen', '2016-05-24'),
  (1, 2, 4, 11, 'Raindancer', '2016-05-24'),
  (1, 2, 4, 11, 'Raptorion', '2016-05-24'),
  (1, 2, 4, 11, 'Thunderbird', '2016-05-24'),
  (3, 2, 4, 11, 'Security Chief', '2016-05-24'), -- Origins Edition Pharah Skins
  (6, 2, 3, 11, 'Possessed', '2016-10-11'), -- Halloween Pharah Skins
  (1, 2, 2, 12, 'Blood', '2016-05-24'), -- Normal Reaper Skins
  (1, 2, 2, 12, 'Midnight', '2016-05-24'),
  (1, 2, 2, 12, 'Moss', '2016-05-24'),
  (1, 2, 2, 12, 'Royal', '2016-05-24'),
  (1, 2, 3, 12, 'Desert', '2016-05-24'),
  (1, 2, 3, 12, 'Wight', '2016-05-24'),
  (1, 2, 4, 12, 'El Blanco', '2016-05-24'),
  (1, 2, 4, 12, 'Mariachi', '2016-05-24'),
  (1, 2, 4, 12, 'Nevermore', '2016-05-24'),
  (1, 2, 4, 12, 'Plague Doctor', '2016-05-24'),
  (3, 2, 4, 12, 'Blackwatch Reyes', '2016-05-24'), -- Origins Edition Reaper Skins
  (7, 2, 4, 12, 'Pumpkin', '2016-10-11'), -- Halloween Reaper Skins
  (1, 2, 2, 13, 'Brass', '2016-05-24'), -- Normal Reinhardt Skins
  (1, 2, 2, 13, 'Cobalt', '2016-05-24'),
  (1, 2, 2, 13, 'Copper', '2016-05-24'),
  (1, 2, 2, 13, 'Viridian', '2016-05-24'),
  (1, 2, 3, 13, 'Bundeswehr', '2016-05-24'),
  (1, 2, 3, 13, 'Paragon', '2016-05-24'),
  (1, 2, 4, 13, 'Balderich', '2016-08-23'),
  (1, 2, 4, 13, 'Blackhardt', '2016-05-24'),
  (1, 2, 4, 13, 'Bloodhardt', '2016-05-24'),
  (1, 2, 4, 13, 'Griefhardt', '2016-08-23'),
  (1, 2, 4, 13, 'Lionhardt', '2016-05-24'),
  (1, 2, 4, 13, 'Stonehardt', '2016-05-24'),
  (7, 2, 3, 13, 'Coldhardt', '2016-10-11'), -- Halloween Reinhardt Skins
  (1, 2, 2, 14, 'Kiwi', '2016-05-24'), -- Normal Roadhog Skins
  (1, 2, 2, 14, 'Mud', '2016-05-24'),
  (1, 2, 2, 14, 'Sand', '2016-05-24'),
  (1, 2, 2, 14, 'Thistle', '2016-05-24'),
  (1, 2, 3, 14, 'Pigpen', '2016-05-24'),
  (1, 2, 3, 14, 'Stitched', '2016-05-24'),
  (1, 2, 4, 14, 'Islander', '2016-05-24'),
  (1, 2, 4, 14, 'Mako', '2016-05-24'),
  (1, 2, 4, 14, 'Sharkbait', '2016-05-24'),
  (1, 2, 4, 14, 'Toa', '2016-05-24'),
  (7, 2, 4, 14, 'Junkenstein''s Monster', '2016-10-11'), -- Halloween Roadhog Skins
  (1, 2, 2, 15, 'Jet', '2016-05-24'), -- Normal Soldier: 76 Skins
  (1, 2, 2, 15, 'Olive', '2016-05-24'),
  (1, 2, 2, 15, 'Russet', '2016-05-24'),
  (1, 2, 2, 15, 'Smoke', '2016-05-24'),
  (1, 2, 3, 15, 'Bone', '2016-05-24'),
  (1, 2, 3, 15, 'Golden', '2016-05-24'),
  (1, 2, 4, 15, 'Commando: 76', '2016-05-24'),
  (1, 2, 4, 15, 'Daredevil: 76', '2016-05-24'),
  (1, 2, 4, 15, 'Night Ops: 76', '2016-05-24'),
  (1, 2, 4, 15, 'Stunt Rider: 76', '2016-05-24'),
  (3, 2, 4, 15, 'Strike-Commander Morrison', '2016-05-24'), -- Origins Edition Soldier: 76 Skins
  (7, 2, 3, 15, 'Immortal', '2016-10-11'), -- Halloween Soldier: 76 Skins
  (1, 2, 2, 16, 'Cardamom', '2016-05-24'), -- Normal Symmetra Skins
  (1, 2, 2, 16, 'Hyacinth', '2016-05-24'),
  (1, 2, 2, 16, 'Saffron', '2016-05-24'),
  (1, 2, 2, 16, 'Technomancer', '2016-05-24'),
  (1, 2, 3, 16, 'Regal', '2016-05-24'),
  (1, 2, 3, 16, 'Utopaea', '2016-05-24'),
  (1, 2, 4, 16, 'Architech', '2016-05-24'),
  (1, 2, 4, 16, 'Devi', '2016-05-24'),
  (1, 2, 4, 16, 'Goddess', '2016-05-24'),
  (1, 2, 4, 16, 'Vishkar', '2016-05-24'),
  (7, 2, 3, 16, 'Vampire', '2016-10-11'), -- Halloween Symmetra Skins
  (1, 2, 2, 17, 'Blå', '2016-05-24'), -- Normal Torbjörn Skins
  (1, 2, 2, 17, 'Citron', '2016-05-24'),
  (1, 2, 2, 17, 'Grön', '2016-05-24'),
  (1, 2, 2, 17, 'Plommon', '2016-05-24'),
  (1, 2, 3, 17, 'Cathode', '2016-05-24'),
  (1, 2, 3, 17, 'Woodclad', '2016-05-24'),
  (1, 2, 4, 17, 'Barbarossa', '2016-05-24'),
  (1, 2, 4, 17, 'Blackbeard', '2016-05-24'),
  (1, 2, 4, 17, 'Chopper', '2016-05-24'),
  (1, 2, 4, 17, 'Deadlock', '2016-05-24'),
  (6, 2, 3, 17, 'Tre Kronor', '2016-08-02'), -- Summer Games Torbjörn Skins
  (1, 2, 2, 18, 'Electric Purple', '2016-05-24'), -- Normal Tracer Skins
  (1, 2, 2, 18, 'Hot Pink', '2016-05-24'),
  (1, 2, 2, 18, 'Neon Green', '2016-05-24'),
  (1, 2, 2, 18, 'Royal Blue', '2016-05-24'),
  (1, 2, 3, 18, 'Posh', '2016-05-24'),
  (1, 2, 3, 18, 'Sporty', '2016-05-24'),
  (1, 2, 4, 18, 'Mach T', '2016-05-24'),
  (1, 2, 4, 18, 'Punk', '2016-05-24'),
  (1, 2, 4, 18, 'T. Racer', '2016-05-24'),
  (1, 2, 4, 18, 'Ultraviolet', '2016-05-24'),
  (3, 2, 4, 18, 'Slipstream', '2016-05-24'), -- Origins Edition Tracer Skins
  (6, 2, 4, 18, 'Sprinter', '2016-08-02'), -- Summer Games Tracer Skins
  (6, 2, 4, 18, 'Track And Field', '2016-08-02'),
  (1, 2, 2, 19, 'Ciel', '2016-05-24'), -- Normal Widowmaker Skins
  (1, 2, 2, 19, 'Nuit', '2016-05-24'),
  (1, 2, 2, 19, 'Rose', '2016-05-24'),
  (1, 2, 2, 19, 'Vert', '2016-05-24'),
  (1, 2, 3, 19, 'Patina', '2016-05-24'),
  (1, 2, 3, 19, 'Winter', '2016-05-24'),
  (1, 2, 4, 19, 'Comptesse', '2016-05-24'),
  (1, 2, 4, 19, 'Huntress', '2016-05-24'),
  (1, 2, 4, 19, 'Odette', '2016-05-24'),
  (1, 2, 4, 19, 'Odile', '2016-05-24'),
  (4, 2, 4, 19, 'Noire', '2016-05-24'), -- Preorder Widowmaker Skins
  (6, 2, 3, 19, 'Tricolore', '2016-08-02'), -- Summer Games Widowmaker Skins
  (1, 2, 2, 20, 'Atmosphere', '2016-05-24'), -- Normal Winston Skins
  (1, 2, 2, 20, 'Banana', '2016-05-24'),
  (1, 2, 2, 20, 'Forest', '2016-05-24'),
  (1, 2, 2, 20, 'Red Planet', '2016-05-24'),
  (1, 2, 3, 20, 'Desert', '2016-05-24'),
  (1, 2, 3, 20, 'Horizon', '2016-05-24'),
  (1, 2, 4, 20, 'Explorer', '2016-05-24'),
  (1, 2, 4, 20, 'Frogston', '2016-05-24'),
  (1, 2, 4, 20, 'Safari', '2016-05-24'),
  (1, 2, 4, 20, 'Undersea', '2016-05-24'),
  (1, 2, 2, 21, 'Brick', '2016-05-24'), -- Normal Zarya Skins
  (1, 2, 2, 21, 'Goldenrod', '2016-05-24'),
  (1, 2, 2, 21, 'Taiga', '2016-05-24'),
  (1, 2, 2, 21, 'Violet', '2016-05-24'),
  (1, 2, 3, 21, 'Dawn', '2016-05-24'),
  (1, 2, 3, 21, 'Midnight', '2016-05-24'),
  (1, 2, 4, 21, 'Arctic', '2016-05-24'),
  (1, 2, 4, 21, 'Cybergoth', '2016-05-24'),
  (1, 2, 4, 21, 'Industrial', '2016-05-24'),
  (1, 2, 4, 21, 'Siberian Front', '2016-05-24'),
  (6, 2, 4, 21, 'Champion', '2016-08-02'), -- Summer Games Zarya Skins
  (6, 2, 4, 21, 'Weightlifter', '2016-08-02'),
  (1, 2, 2, 22, 'Air', '2016-05-24'), -- Normal Zenyatta Skins
  (1, 2, 2, 22, 'Earth', '2016-05-24'),
  (1, 2, 2, 22, 'Leaf', '2016-05-24'),
  (1, 2, 2, 22, 'Water', '2016-05-24'),
  (1, 2, 3, 22, 'Ascendant', '2016-05-24'),
  (1, 2, 3, 22, 'Harmonious', '2016-05-24'),
  (1, 2, 4, 22, 'Djinnyatta', '2016-05-24'),
  (1, 2, 4, 22, 'Ifrit', '2016-05-24'),
  (1, 2, 4, 22, 'Ra', '2016-05-24'),
  (1, 2, 4, 22, 'Sunyatta', '2016-05-24'),
  (7, 2, 3, 22, 'Skullyatta', '2016-10-11'), -- Halloween Zenyatta Skins
  -- Emotes
  -- Victory Poses
  -- Voice Line
  -- Sprays
  (NULL, 6, NULL, NULL, 'Logo', '2016-05-24'), -- Default All Heroes Sprays
  (NULL, 6, NULL, NULL, 'You Are Not Prepared', '2016-07-19'),
  (1, 6, 1, NULL, '...Punch', '2016-05-24'), -- Normal All Heroes Sprays
  (1, 6, 1, NULL, 'Catcher', '2016-05-24'),
  (1, 6, 1, NULL, 'Caution', '2016-05-24'),
  (1, 6, 1, NULL, 'Dance', '2016-05-24'),
  (1, 6, 1, NULL, 'Dark Logo', '2016-05-24'),
  (1, 6, 1, NULL, 'Dark Overwatch', '2016-05-24'),
  (1, 6, 1, NULL, 'Dark Title', '2016-05-24'),
  (1, 6, 1, NULL, 'FotS2', '2016-05-24'),
  (1, 6, 1, NULL, 'Fuji', '2016-05-24'),
  (1, 6, 1, NULL, 'Goldshire Pictures', '2016-05-24'),
  (1, 6, 1, NULL, 'Leek', '2016-05-24'),
  (1, 6, 1, NULL, 'Lumérico', '2016-05-24'),
  (1, 6, 1, NULL, 'Numbani Statue', '2016-05-24'),
  (1, 6, 1, NULL, 'Omnic Rights', '2016-05-24'),
  (1, 6, 1, NULL, 'Overwatch', '2016-05-24'),
  (1, 6, 1, NULL, 'Overwatch Title', '2016-05-24'),
  (1, 6, 1, NULL, 'Pachimari', '2016-05-24'),
  (1, 6, 1, NULL, 'Rhino', '2016-05-24'),
  (1, 6, 1, NULL, 'Rikimaru', '2016-05-24'),
  (1, 6, 1, NULL, 'Sarcophagus', '2016-05-24'),
  (1, 6, 1, NULL, 'Scooter', '2016-05-24'),
  (1, 6, 1, NULL, 'Scroll', '2016-05-24'),
  (1, 6, 1, NULL, 'Siege Mode', '2016-05-24'),
  (1, 6, 1, NULL, 'Six Gun Killer', '2016-05-24'),
  (1, 6, 1, NULL, 'Sol', '2016-05-24'),
  (1, 6, 1, NULL, 'Soulstone', '2016-05-24'),
  (1, 6, 1, NULL, 'Vivi''s Adventure', '2016-05-24'),
  (2, 6, 1, NULL, 'Beyond The Moon', '2016-05-24'), -- Achievements All Heroes Sprays
  (2, 6, 1, NULL, 'Forge Onward', '2016-05-24'),
  (2, 6, 1, NULL, 'GL HF', '2016-05-24'),
  (2, 6, 1, NULL, 'Halloween Special', '2016-10-11'),
  (2, 6, 1, NULL, 'Jail', '2016-05-24'),
  (2, 6, 1, NULL, 'Junkenstein''s Revenge', '2016-10-11'),
  (2, 6, 1, NULL, 'Man And Omnic', '2016-05-24'),
  (2, 6, 1, NULL, 'Oops', '2016-05-24'),
  (2, 6, 1, NULL, 'Out Of My Way', '2016-05-24'),
  (2, 6, 1, NULL, 'Piñata', '2016-05-24'),
  (2, 6, 1, NULL, 'Red O', '2016-05-24'),
  (2, 6, 1, NULL, 'Red X', '2016-05-24'),
  (2, 6, 1, NULL, 'Respect', '2016-05-24'),
  (2, 6, 1, NULL, 'Rise', '2016-05-24'),
  (2, 6, 1, NULL, 'Rise Of The Zomnics', '2016-10-11'),
  (2, 6, 1, NULL, 'Sorry', '2016-05-24'),
  (2, 6, 1, NULL, 'Tea Time', '2016-05-24'),
  (2, 6, 1, NULL, 'Thanks', '2016-05-24'),
  (2, 6, 1, NULL, 'The Reapening', '2016-10-11'),
  (2, 6, 1, NULL, 'Victory', '2016-05-24'),
  (2, 6, 1, NULL, 'Well Played', '2016-05-24'),
  (5, 6, 1, NULL, 'Season 1 Competitor', '2016-06-28'), -- Competitive All Heroes Sprays
  (5, 6, 1, NULL, 'Season 1 Hero', '2016-06-28'),
  (5, 6, 1, NULL, 'Season 2 Competitor', '2016-07-02'),
  (5, 6, 1, NULL, 'Season 2 Hero', '2016-07-02'),
  (7, 6, 1, NULL, '...Never Die', '2016-10-11'), -- Halloween All Heroes Sprays
  (7, 6, 1, NULL, 'Bats', '2016-10-11'),
  (7, 6, 1, NULL, 'Boo!', '2016-10-11'),
  (7, 6, 1, NULL, 'Boop!', '2016-10-11'),
  (7, 6, 1, NULL, 'Candyball', '2016-10-11'),
  (7, 6, 1, NULL, 'Fangs', '2016-10-11'),
  (7, 6, 1, NULL, 'Gummy Hog', '2016-10-11'),
  (7, 6, 1, NULL, 'Halloween Special', '2016-10-11'),
  (7, 6, 1, NULL, 'Halloween Terror', '2016-10-11'),
  (7, 6, 1, NULL, 'Junkenstein''s Revenge', '2016-10-11'),
  (7, 6, 1, NULL, 'Pumpkins', '2016-10-11'),
  (7, 6, 1, NULL, 'Rise Of The Zomnics', '2016-10-11'),
  (7, 6, 1, NULL, 'The Reapening', '2016-10-11'),
  (7, 6, 1, NULL, 'Witch''s Brew', '2016-10-11'),
  (1, 6, 1, NULL, '', '2016-05-24'); --TODO characters
-- Highlight Intros
-- Weapons

--TODO double check season 2 competitive start date
-- TODO rename to Halloween Terror in some cases?
-- Double check defaults

CREATE TABLE events (
  id    SERIAL,
  name  TEXT NOT NULL,
  start DATE NOT NULL,
  "end" DATE,
  CONSTRAINT pk_events PRIMARY KEY (id)
);

INSERT INTO events (name, start, "end")
VALUES
  ('Overwatch Release', '2016-05-24', NULL),
  ('Competitive Season 1', '2016-06-28', '2016-08-18'),
  ('Ana Patch', '2016-07-19', NULL),
  ('Summer Games 2016', '2016-08-02', '2016-08-23'),
  ('Eichenwalde Patch', '2016-08-23', NULL),
  ('Competitive Season 2', '2016-07-02', '2016-11-24'),
  ('Halloween Terror 2016', '2016-10-11', '2016-11-01'),
  ('Sombra Patch', '2016-05-24', NULL), -- TODO Cuando es Sombra?
  ('Competitive Season 3', '2016-12-01', NULL); -- TODO end


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