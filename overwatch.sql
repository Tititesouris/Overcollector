DROP OWNED BY overwatch;
DROP TABLE IF EXISTS heroes, categories, types, rarities, events, cosmetics, users, user_cosmetics, settings, user_settings;
DROP ROLE IF EXISTS overwatch;

CREATE ROLE overwatch WITH LOGIN PASSWORD 'localpass';

CREATE TABLE heroes (
  id    INTEGER,
  name  TEXT NOT NULL,
  slug TEXT NOT NULL,
  CONSTRAINT pk_heroes PRIMARY KEY (id)
);
GRANT SELECT ON TABLE heroes TO overwatch;

INSERT INTO heroes (id, name, slug)
VALUES
  (1, 'Ana', 'ana'),
  (2, 'Bastion', 'bastion'),
  (3, 'D.Va', 'dva'),
  (4, 'Genji', 'genji'),
  (5, 'Hanzo', 'hanzo'),
  (6, 'Junkrat', 'junkrat'),
  (7, 'Lúcio', 'lucio'),
  (8, 'McCree', 'mccree'),
  (9, 'Mei', 'mei'),
  (10, 'Mercy', 'mercy'),
  (11, 'Pharah', 'pharah'),
  (12, 'Reaper', 'reaper'),
  (13, 'Reinhardt', 'reinhardt'),
  (14, 'Roadhog', 'roadhog'),
  (15, 'Soldier: 76', 'soldier76'),
  (16, 'Symmetra', 'symmetra'),
  (17, 'Torbjörn', 'torbjorn'),
  (18, 'Tracer', 'tracer'),
  (19, 'Widowmaker', 'widowmaker'),
  (20, 'Winston', 'winston'),
  (21, 'Zarya', 'zarya'),
  (22, 'Zenyatta', 'zenyatta'),
  (23, 'Sombra', 'sombra');


CREATE TABLE categories (
  id          INTEGER,
  name        TEXT NOT NULL,
  description TEXT NOT NULL,
  slug       TEXT NOT NULL,
  CONSTRAINT pk_categories PRIMARY KEY (id)
);
GRANT SELECT ON TABLE categories TO overwatch;

INSERT INTO categories (id, name, description, slug)
VALUES
  (1, 'Normal', 'Obtainable by opening normal Loot Boxes or by spending the normal amount of credits.', 'normal'),
  (2, 'Achievements', 'Obtainable by completing achievements.', 'achievements'),
  (3, 'Origins Edition', 'Obtainable by buying the Origins Edition of Overwatch.', 'originsedition'),
  (4, 'Preorder', 'Obtainable by preodering Overwatch.', 'preorder'),
  (5, 'Competitive', 'Obtainable by spending competitive points.', 'competitive'),
  (6, 'Summer Games', 'Obtainable by opening Summer Games Loot Boxes.', 'summergames'),
  (7, 'Halloween Terror',
   'Obtainable by opening Halloween Loot Boxes or by spending 3 times the normal amount of credits during the Halloween Terror event.',
   'halloweenterror'),
  (8, 'BlizzCon', 'Obtainable by purchasing a BlizzCon ticket.', 'blizzcon'),
  (9, 'Blizzard', 'Obtainable by playing other Blizzard games.', 'blizzard');


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


CREATE TABLE events (
  id    INTEGER,
  name  TEXT NOT NULL,
  start DATE NOT NULL,
  "end" DATE,
  CONSTRAINT pk_events PRIMARY KEY (id)
);
GRANT SELECT ON TABLE events TO overwatch;

INSERT INTO events (id, name, start, "end")
VALUES
  (1, 'Overwatch Release', '2016-05-24', NULL),
  (2, 'Competitive Season 1', '2016-06-28', '2016-08-18'),
  (3, 'Ana Patch', '2016-07-19', NULL),
  (4, 'Summer Games 2016', '2016-08-02', '2016-08-23'),
  (5, 'Eichenwalde Patch', '2016-08-23', NULL),
  (6, 'Competitive Season 2', '2016-07-02', '2016-11-24'),
  (7, 'Halloween Terror 2016', '2016-10-11', '2016-11-01'),
  (8, 'Día De Los Muertos 2016', '2016-11-01', NULL),
  (9, 'Sombra Patch', '2016-11-15', NULL), -- TODO Cuando es Sombra?
  (10, 'Competitive Season 3', '2016-12-01', NULL); -- TODO end


CREATE TABLE cosmetics (
  id          SERIAL,
  category_id INTEGER,
  type_id     INTEGER NOT NULL,
  rarity_id   INTEGER,
  hero_id     INTEGER,
  name        TEXT    NOT NULL,
  event_id    INTEGER,
  CONSTRAINT pk_cosmetics PRIMARY KEY (id),
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES types (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_rarity FOREIGN KEY (rarity_id) REFERENCES rarities (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_hero FOREIGN KEY (hero_id) REFERENCES heroes (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES events (id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);
GRANT SELECT ON TABLE cosmetics TO overwatch;

INSERT INTO cosmetics (category_id, type_id, rarity_id, hero_id, name, event_id)
VALUES
  -- Player Icons
  (NULL, 1, NULL, NULL, 'Overwatch Dark', 1), -- Default All Heroes Player Icons
  (NULL, 1, NULL, NULL, 'Overwatch Light', 1),
  (NULL, 1, NULL, NULL, 'You Are Not Prepared', 3),
  (1, 1, 1, NULL, '16-Bit Hero', 1), -- Normal All Heroes Player Icons
  (1, 1, 1, NULL, 'Anubis', 1),
  (1, 1, 1, NULL, 'Bao', 1),
  (1, 1, 1, NULL, 'Barbarian', 1),
  (1, 1, 1, NULL, 'Capsule', 1),
  (1, 1, 1, NULL, 'Cheers', 1),
  (1, 1, 1, NULL, 'Colossus', 1),
  (1, 1, 1, NULL, 'Credit', 1),
  (1, 1, 1, NULL, 'Crusader', 1),
  (1, 1, 1, NULL, 'Dark Lady', 1),
  (1, 1, 1, NULL, 'Demolition', 1),
  (1, 1, 1, NULL, 'Demon Hunter', 1),
  (1, 1, 1, NULL, 'Dominion', 1),
  (1, 1, 1, NULL, 'Elephant', 1),
  (1, 1, 1, NULL, 'For The Alliance', 1),
  (1, 1, 1, NULL, 'For The Horde', 1),
  (1, 1, 1, NULL, 'From Beyond The Moon', 1),
  (1, 1, 1, NULL, 'Garrosh', 1),
  (1, 1, 1, NULL, 'Happy Squid', 1),
  (1, 1, 1, NULL, 'Hearthstone', 1),
  (1, 1, 1, NULL, 'Hierarch', 1),
  (1, 1, 1, NULL, 'Jaina', 1),
  (1, 1, 1, NULL, 'Jim', 1),
  (1, 1, 1, NULL, 'Kofi Aromo', 1),
  (1, 1, 1, NULL, 'Lich King', 1),
  (1, 1, 1, NULL, 'Loot Box', 1),
  (1, 1, 1, NULL, 'Lord Of Candy', 1),
  (1, 1, 1, NULL, 'Lord Of Terror', 1),
  (1, 1, 1, NULL, 'Los Muertos', 1),
  (1, 1, 1, NULL, 'Mama Pig''s', 1),
  (1, 1, 1, NULL, 'Mariachi', 1),
  (1, 1, 1, NULL, 'Mech', 1),
  (1, 1, 1, NULL, 'Monk', 1),
  (1, 1, 1, NULL, 'Nexus', 1),
  (1, 1, 1, NULL, 'Pachimari', 1),
  (1, 1, 1, NULL, 'Pharaoh', 1),
  (1, 1, 1, NULL, 'Protoss', 1),
  (1, 1, 1, NULL, 'Queen Of Blades', 1),
  (1, 1, 1, NULL, 'Ramen', 1),
  (1, 1, 1, NULL, 'Rhino', 1),
  (1, 1, 1, NULL, 'Rikimaru', 1),
  (1, 1, 1, NULL, 'Route 66', 1),
  (1, 1, 1, NULL, 'Sakura', 1),
  (1, 1, 1, NULL, 'Scooter', 1),
  (1, 1, 1, NULL, 'Siege Mode', 1),
  (1, 1, 1, NULL, 'Six-Gun Killer', 1),
  (1, 1, 1, NULL, 'Svyatogor', 1),
  (1, 1, 1, NULL, 'Terran', 1),
  (1, 1, 1, NULL, 'Totem', 1),
  (1, 1, 1, NULL, 'Training Bot', 1),
  (1, 1, 1, NULL, 'Varian', 1),
  (1, 1, 1, NULL, 'Vivi', 1),
  (1, 1, 1, NULL, 'Witch Doctor', 1),
  (1, 1, 1, NULL, 'Wizard', 1),
  (1, 1, 1, NULL, 'Zerg', 1),
  (5, 1, 1, NULL, 'Season 1 Competitor', 2), -- Competitive All Heroes Player Icons
  (5, 1, 1, NULL, 'Season 1 Hero', 2),
  (5, 1, 1, NULL, 'Season 2 Competitor', 6),
  (5, 1, 1, NULL, 'Season 2 Hero', 6),
  (5, 1, 1, NULL, 'Season 3 Competitor', 10),
  (5, 1, 1, NULL, 'Season 3 Hero', 10),
  (5, 1, 1, NULL, 'Top 500', 2),
  (6, 1, 1, NULL, 'Australia', 4), -- Summer Games All Heroes Player Icons
  (6, 1, 1, NULL, 'Brazil', 4),
  (6, 1, 1, NULL, 'China', 4),
  (6, 1, 1, NULL, 'Egypt', 4),
  (6, 1, 1, NULL, 'France', 4),
  (6, 1, 1, NULL, 'Germany', 4),
  (6, 1, 1, NULL, 'Greece', 4),
  (6, 1, 1, NULL, 'Japan', 4),
  (6, 1, 1, NULL, 'Mexico', 4),
  (6, 1, 1, NULL, 'Nepal', 4),
  (6, 1, 1, NULL, 'Numbani', 4),
  (6, 1, 1, NULL, 'Russia', 4),
  (6, 1, 1, NULL, 'South Korea', 4),
  (6, 1, 1, NULL, 'Summer Games 2016', 4),
  (6, 1, 1, NULL, 'Sweden', 4),
  (6, 1, 1, NULL, 'Switzerland', 4),
  (6, 1, 1, NULL, 'United Kingdom', 4),
  (6, 1, 1, NULL, 'United States Of America', 4),
  (7, 1, 1, NULL, '...Never Die', 7), -- Halloween Terror All Heroes Player Icons
  (7, 1, 1, NULL, 'Bewitching', 7),
  (7, 1, 1, NULL, 'Calavera', 7),
  (7, 1, 1, NULL, 'Candle', 7),
  (7, 1, 1, NULL, 'Eyeball', 7),
  (7, 1, 1, NULL, 'Ghostymari', 7),
  (7, 1, 1, NULL, 'Halloween Terror 2016', 7),
  (7, 1, 1, NULL, 'Spider', 7),
  (7, 1, 1, NULL, 'Superstition', 7),
  (7, 1, 1, NULL, 'Tombstone', 7),
  (7, 1, 1, NULL, 'Vampachimari', 7),
  (7, 1, 1, NULL, 'Witch''s Brew', 7),
  (7, 1, 1, NULL, 'Witch''s Hat', 7),
  (7, 1, 1, NULL, 'Wolf', 7),
  (1, 1, 1, 1, 'Ana', 3), -- Normal Ana Player Icons
  (1, 1, 1, 1, 'Watcher', 3),
  (1, 1, 1, 1, 'Wedjat', 3),
  (6, 1, 1, 1, 'Shooting', 4), -- Summer Games Ana Player Icons
  (1, 1, 1, 2, 'Bastion', 1), -- Normal Bastion Player Icons
  (1, 1, 1, 2, 'Ganymede', 1),
  (1, 1, 1, 2, 'Tank Crossing', 1),
  (6, 1, 1, 2, 'Boxing', 4), -- Summer Games Bastion Player Icons
  (1, 1, 1, 3, 'D.Va', 1), -- Normal D.Va Player Icons
  (1, 1, 1, 3, 'Bunny', 1),
  (1, 1, 1, 3, 'Charm', 1),
  (6, 1, 1, 3, 'Cycling', 4), -- Summer Games D.Va Player Icons
  (1, 1, 1, 4, 'Genji', 1), -- Normal Genji Player Icons
  (1, 1, 1, 4, 'God Of War', 1),
  (1, 1, 1, 4, 'Nin', 1),
  (6, 1, 1, 4, 'Fencing', 4), -- Summer Games Genji Player Icons
  (8, 1, 1, 4, 'Oni', 9), -- Blizzard Genji Player Icons
  (1, 1, 1, 5, 'Hanzo', 1), -- Normal Hanzo Player Icons
  (1, 1, 1, 5, 'Shimada', 1),
  (1, 1, 1, 5, 'Storm', 1),
  (6, 1, 1, 5, 'Archery', 4), -- Summer Games Hanzo Player Icons
  (1, 1, 1, 6, 'Ahhhh!', 1), -- Normal Junkrat Player Icons
  (1, 1, 1, 6, 'Have A Nice Day!', 1),
  (1, 1, 1, 6, 'Junkrat', 1),
  (6, 1, 1, 6, 'Tennis', 4), -- Summer Games Junkrat Player Icons
  (7, 1, 1, 6, 'The Doctor', 7), -- Halloween Terror Junkrat Player Icons
  (1, 1, 1, 7, 'Frog', 1), -- Normal Lúcio Player Icons
  (1, 1, 1, 7, 'Kambô', 1),
  (1, 1, 1, 7, 'Lúcio', 1),
  (6, 1, 1, 7, 'Football', 4), -- Summer Games Lúcio Player Icons
  (1, 1, 1, 8, 'Badge', 1), -- Normal McCree Player Icons
  (1, 1, 1, 8, 'Deadeye', 1),
  (1, 1, 1, 8, 'McCree', 1),
  (6, 1, 1, 8, 'Equestrian', 4), -- Summer Games McCree Player Icons
  (1, 1, 1, 9, 'Hairpin', 1), -- Normal Mei Player Icons
  (1, 1, 1, 9, 'Mei', 1),
  (1, 1, 1, 9, 'Snowball', 1),
  (6, 1, 1, 9, 'Table Tennis', 4), -- Summer Games Mei Player Icons
  (1, 1, 1, 10, 'Guardian Angel', 1), -- Normal Mercy Player Icons
  (1, 1, 1, 10, 'Mercy', 1),
  (1, 1, 1, 10, 'Valkyrie', 1),
  (6, 1, 1, 10, 'Badminton', 4), -- Summer Games Mercy Player Icons
  (7, 1, 1, 10, 'The Witch', 7), -- Halloween Terror Mercy Player Icons
  (1, 1, 1, 11, 'Pharah', 1), -- Normal Pharah Player Icons
  (1, 1, 1, 11, 'Raptora', 1),
  (1, 1, 1, 11, 'Wadjet', 1),
  (6, 1, 1, 11, 'Basketball', 4), -- Summer Games Pharah Player Icons
  (1, 1, 1, 12, 'Emblem', 1), -- Normal Reaper Player Icons
  (1, 1, 1, 12, 'Reaper', 1),
  (1, 1, 1, 12, 'Soul Globe', 1),
  (6, 1, 1, 12, 'BMX', 4), -- Summer Games Reaper Player Icons
  (7, 1, 1, 12, 'The Reaper', 7), -- Halloween Terror Reaper Player Icons
  (1, 1, 1, 13, 'Lionhardt', 1), -- Normal Reinhardt Player Icons
  (1, 1, 1, 13, 'Reinhardt', 1),
  (1, 1, 1, 13, 'Scar', 1),
  (6, 1, 1, 13, 'Wrestling', 4), -- Summer Games Reinhardt Player Icons
  (1, 1, 1, 14, 'Hook', 1), -- Normal Roadhog Player Icons
  (1, 1, 1, 14, 'Piggy', 1),
  (1, 1, 1, 14, 'Roadhog', 1),
  (6, 1, 1, 14, 'Diving', 4), -- Summer Games Roadhog Player Icons
  (7, 1, 1, 14, 'The Monster', 7), -- Halloween Terror Roadhog Player Icons
  (1, 1, 1, 15, '76', 1), -- Normal Soldier: 76 Player Icons
  (1, 1, 1, 15, 'Soldier: 76', 1),
  (1, 1, 1, 15, 'Strike-Commander', 1),
  (6, 1, 1, 15, 'Golf', 4), -- Summer Games Soldier: 76 Player Icons
  (1, 1, 1, 16, 'Sentry', 1), -- Normal Symmetra Player Icons
  (1, 1, 1, 16, 'Symmetra', 1),
  (1, 1, 1, 16, 'Vishkar', 1),
  (6, 1, 1, 16, 'Rythmic Gymnastics', 4), -- Summer Games Symmetra Player Icons
  (1, 1, 1, 17, 'Forge', 1), -- Normal Torbjörn Player Icons
  (1, 1, 1, 17, 'Gears', 1),
  (1, 1, 1, 17, 'Torbjörn', 1),
  (6, 1, 1, 17, 'Water Polo', 4), -- Summer Games Torbjörn Player Icons
  (1, 1, 1, 18, 'Patch', 1), -- Normal Tracer Player Icons
  (1, 1, 1, 18, 'Pulse Bomb', 1),
  (1, 1, 1, 18, 'Tracer', 1),
  (6, 1, 1, 18, 'Track', 4), -- Summer Games Tracer Player Icons
  (1, 1, 1, 19, 'Baiser', 1), -- Normal Widowmaker Player Icons
  (1, 1, 1, 19, 'Grappling Hook', 1),
  (1, 1, 1, 19, 'Widowmaker', 1),
  (6, 1, 1, 19, 'Gymnastics', 4), -- Summer Games Widowmaker Player Icons
  (1, 1, 1, 20, 'Lunar Ops', 1), -- Normal Winston Player Icons
  (1, 1, 1, 20, 'Peanut Butter', 1),
  (1, 1, 1, 20, 'Winston', 1),
  (6, 1, 1, 20, 'Volleyball', 4), -- Summer Games Winston Player Icons
  (1, 1, 1, 21, '512', 1), -- Normal Zarya Player Icons
  (1, 1, 1, 21, 'Particle Barrier', 1),
  (1, 1, 1, 21, 'Zarya', 1),
  (6, 1, 1, 21, 'Weightlifting', 4), -- Summer Games Zarya Player Icons
  (1, 1, 1, 22, 'Harmony', 1), -- Normal Zenyatta Player Icons
  (1, 1, 1, 22, 'Meditation Barrier', 1),
  (1, 1, 1, 22, 'Zenyatta', 1),
  (6, 1, 1, 22, 'Taekwondo', 4), -- Summer Games Zenyatta Player Icons
  (1, 1, 1, 23, 'Hacker', 9), -- Normal Sombra Player Icons
  (1, 1, 1, 23, 'Skull', 9),
  (1, 1, 1, 23, 'Sombra', 9),
  -- Skins TODO defaults
  (1, 2, 2, 1, 'Citrine', 3), -- Normal Ana Skins
  (1, 2, 2, 1, 'Garnet', 3),
  (1, 2, 2, 1, 'Peridot', 3),
  (1, 2, 2, 1, 'Turquoise', 3),
  (1, 2, 3, 1, 'Merciful', 3),
  (1, 2, 3, 1, 'Shrike', 3),
  (1, 2, 4, 1, 'Wadjet', 3),
  (1, 2, 4, 1, 'Wasteland', 3),
  (1, 2, 4, 1, 'Captain Amari', 3),
  (1, 2, 4, 1, 'Horus', 3),
  (7, 2, 3, 1, 'Ghoul', 7), -- Halloween Terror Ana Skins
  (1, 2, 2, 2, 'Dawn', 1), -- Normal Bastion Skins
  (1, 2, 2, 2, 'Meadow', 1),
  (1, 2, 2, 2, 'Sky', 1),
  (1, 2, 2, 2, 'Soot', 1),
  (1, 2, 3, 2, 'Defense Matrix', 1),
  (1, 2, 3, 2, 'Omnic Crisis', 1),
  (1, 2, 4, 2, 'Antique', 1),
  (1, 2, 4, 2, 'Gearbot', 1),
  (1, 2, 4, 2, 'Steambot', 1),
  (1, 2, 4, 2, 'Woodbot', 1),
  (3, 2, 4, 2, 'Overgrown', 1), -- Origins Edition Bastion Skins
  (7, 2, 3, 2, 'Tombstone', 7), -- Halloween Terror Bastion Skins
  (8, 2, 3, 2, 'BlizzCon 2016', 7), -- BlizzCon Bastion Skins
  (1, 2, 2, 3, 'Blueberry', 1), -- Normal D.Va Skins
  (1, 2, 2, 3, 'Lemon-Lime', 1),
  (1, 2, 2, 3, 'Tangerine', 1),
  (1, 2, 2, 3, 'Watermelon', 1),
  (1, 2, 3, 3, 'Carbon Fiber', 1),
  (1, 2, 3, 3, 'White Rabbit', 1),
  (1, 2, 4, 3, 'B.Va', 1),
  (1, 2, 4, 3, 'Junebug', 1),
  (1, 2, 4, 3, 'Junker', 1),
  (1, 2, 4, 3, 'Scavenger', 1),
  (6, 2, 3, 3, 'Taegeukgi', 4), -- Summer Games D.Va Skins
  (1, 2, 2, 4, 'Azurite', 1), -- Normal Genji Skins
  (1, 2, 2, 4, 'Cinnabar', 1),
  (1, 2, 2, 4, 'Malachite', 1),
  (1, 2, 2, 4, 'Ochre', 1),
  (1, 2, 3, 4, 'Carbon Fiber', 1), --TODO double check name
  (1, 2, 3, 4, 'Chrome', 1),
  (1, 2, 4, 4, 'Bedouin', 1),
  (1, 2, 4, 4, 'Nomad', 1),
  (1, 2, 4, 4, 'Sparrow', 1),
  (1, 2, 4, 4, 'Young Genji', 1),
  (6, 2, 3, 4, 'Nihon', 4), -- Summer Games Genji Skins
  (1, 2, 2, 5, 'Azuki', 1), -- Normal Hanzo Skins
  (1, 2, 2, 5, 'Kinoko', 1),
  (1, 2, 2, 5, 'Midori', 1),
  (1, 2, 2, 5, 'Sora', 1),
  (1, 2, 3, 5, 'Cloud', 1),
  (1, 2, 3, 5, 'Dragon', 1),
  (1, 2, 4, 5, 'Lone Wolf', 1),
  (1, 2, 4, 5, 'Okami', 1),
  (1, 2, 4, 5, 'Young Hanzo', 1),
  (1, 2, 4, 5, 'Young Master', 1),
  (6, 2, 3, 5, 'Demon', 4), -- Summer Games Hanzo Skins
  (1, 2, 2, 6, 'Bleached', 1), -- Normal Junkrat Skins
  (1, 2, 2, 6, 'Drowned', 1),
  (1, 2, 2, 6, 'Irradiated', 1),
  (1, 2, 2, 6, 'Rusted', 1),
  (1, 2, 3, 6, 'Jailbird', 1),
  (1, 2, 3, 6, 'Toasted', 1),
  (1, 2, 4, 6, 'Fool', 1),
  (1, 2, 4, 6, 'Hayseed', 1),
  (1, 2, 4, 6, 'Jester', 1),
  (1, 2, 4, 6, 'Scarecrow', 1),
  (7, 2, 4, 6, 'Dr. Junkenstein', 7), -- Halloween Terror Junkrat Skins
  (1, 2, 2, 7, 'Azul', 1), -- Normal Lúcio Skins
  (1, 2, 2, 7, 'Laranja', 1),
  (1, 2, 2, 7, 'Roxo', 1),
  (1, 2, 2, 7, 'Vermelho', 1),
  (1, 2, 3, 7, 'Auditiva', 1),
  (1, 2, 3, 7, 'Synaesthesia', 1),
  (1, 2, 4, 7, 'Breakaway', 1),
  (1, 2, 4, 7, 'Hippityhop', 1),
  (1, 2, 4, 7, 'Ribbit', 1),
  (1, 2, 4, 7, 'Slapshot', 1),
  (6, 2, 4, 7, 'Seleção', 4), -- Summer Games Lúcio Skins
  (6, 2, 4, 7, 'Striker', 4),
  (1, 2, 2, 8, 'Ebony', 1), -- Normal McCree Skins
  (1, 2, 2, 8, 'Lake', 1),
  (1, 2, 2, 8, 'Sage', 1),
  (1, 2, 2, 8, 'Wheat', 1),
  (1, 2, 3, 8, 'On The Range', 1),
  (1, 2, 3, 8, 'White Hat', 1),
  (1, 2, 4, 8, 'Gambler', 1),
  (1, 2, 4, 8, 'Mystery Man', 1),
  (1, 2, 4, 8, 'Riverboat', 1),
  (1, 2, 4, 8, 'Vigilante', 1),
  (6, 2, 3, 8, 'American', 4), -- Summer Games McCree Skins
  (1, 2, 2, 9, 'Chrysanthemum', 1), -- Normal Mei Skins
  (1, 2, 2, 9, 'Heliotrope', 1),
  (1, 2, 2, 9, 'Jade', 1),
  (1, 2, 2, 9, 'Persimmon', 1),
  (1, 2, 3, 9, 'Earthen', 1),
  (1, 2, 3, 9, 'Snow Plum', 1),
  (1, 2, 4, 9, 'Abominable', 1),
  (1, 2, 4, 9, 'Firefighter', 1),
  (1, 2, 4, 9, 'Rescue Mei', 1),
  (1, 2, 4, 9, 'Yeti Hunter', 1),
  (1, 2, 2, 10, 'Celestial', 1), -- Normal Mercy Skins
  (1, 2, 2, 10, 'Mist', 1),
  (1, 2, 2, 10, 'Orchid', 1),
  (1, 2, 2, 10, 'Verdant', 1),
  (1, 2, 3, 10, 'Amber', 1),
  (1, 2, 3, 10, 'Cobalt', 1),
  (1, 2, 4, 10, 'Devil', 1),
  (1, 2, 4, 10, 'Imp', 1),
  (1, 2, 4, 10, 'Sigrún', 1),
  (1, 2, 4, 10, 'Valkyrie', 1),
  (6, 2, 3, 10, 'Eidgenossin', 4), -- Summer Games Mercy Skins
  (7, 2, 4, 10, 'Witch', 7), -- Halloween Terror Mercy Skins
  (1, 2, 2, 11, 'Amethyst', 1), -- Normal Pharah Skins
  (1, 2, 2, 11, 'Copper', 1),
  (1, 2, 2, 11, 'Emerald', 1),
  (1, 2, 2, 11, 'Titanium', 1),
  (1, 2, 3, 11, 'Anubis', 1),
  (1, 2, 3, 11, 'Jackal', 1),
  (1, 2, 4, 11, 'Mechaqueen', 1),
  (1, 2, 4, 11, 'Raindancer', 1),
  (1, 2, 4, 11, 'Raptorion', 1),
  (1, 2, 4, 11, 'Thunderbird', 1),
  (3, 2, 4, 11, 'Security Chief', 1), -- Origins Edition Pharah Skins
  (6, 2, 3, 11, 'Possessed', 7), -- Halloween Terror Pharah Skins
  (1, 2, 2, 12, 'Blood', 1), -- Normal Reaper Skins
  (1, 2, 2, 12, 'Midnight', 1),
  (1, 2, 2, 12, 'Moss', 1),
  (1, 2, 2, 12, 'Royal', 1),
  (1, 2, 3, 12, 'Desert', 1),
  (1, 2, 3, 12, 'Wight', 1),
  (1, 2, 4, 12, 'El Blanco', 1),
  (1, 2, 4, 12, 'Mariachi', 1),
  (1, 2, 4, 12, 'Nevermore', 1),
  (1, 2, 4, 12, 'Plague Doctor', 1),
  (3, 2, 4, 12, 'Blackwatch Reyes', 1), -- Origins Edition Reaper Skins
  (7, 2, 4, 12, 'Pumpkin', 7), -- Halloween Terror Reaper Skins
  (1, 2, 2, 13, 'Brass', 1), -- Normal Reinhardt Skins
  (1, 2, 2, 13, 'Cobalt', 1),
  (1, 2, 2, 13, 'Copper', 1),
  (1, 2, 2, 13, 'Viridian', 1),
  (1, 2, 3, 13, 'Bundeswehr', 1),
  (1, 2, 3, 13, 'Paragon', 1),
  (1, 2, 4, 13, 'Balderich', 5),
  (1, 2, 4, 13, 'Blackhardt', 1),
  (1, 2, 4, 13, 'Bloodhardt', 1),
  (1, 2, 4, 13, 'Griefhardt', 5),
  (1, 2, 4, 13, 'Lionhardt', 1),
  (1, 2, 4, 13, 'Stonehardt', 1),
  (7, 2, 3, 13, 'Coldhardt', 7), -- Halloween Terror Reinhardt Skins
  (1, 2, 2, 14, 'Kiwi', 1), -- Normal Roadhog Skins
  (1, 2, 2, 14, 'Mud', 1),
  (1, 2, 2, 14, 'Sand', 1),
  (1, 2, 2, 14, 'Thistle', 1),
  (1, 2, 3, 14, 'Pigpen', 1),
  (1, 2, 3, 14, 'Stitched', 1),
  (1, 2, 4, 14, 'Islander', 1),
  (1, 2, 4, 14, 'Mako', 1),
  (1, 2, 4, 14, 'Sharkbait', 1),
  (1, 2, 4, 14, 'Toa', 1),
  (7, 2, 4, 14, 'Junkenstein''s Monster', 7), -- Halloween Terror Roadhog Skins
  (1, 2, 2, 15, 'Jet', 1), -- Normal Soldier: 76 Skins
  (1, 2, 2, 15, 'Olive', 1),
  (1, 2, 2, 15, 'Russet', 1),
  (1, 2, 2, 15, 'Smoke', 1),
  (1, 2, 3, 15, 'Bone', 1),
  (1, 2, 3, 15, 'Golden', 1),
  (1, 2, 4, 15, 'Commando: 76', 1),
  (1, 2, 4, 15, 'Daredevil: 76', 1),
  (1, 2, 4, 15, 'Night Ops: 76', 1),
  (1, 2, 4, 15, 'Stunt Rider: 76', 1),
  (3, 2, 4, 15, 'Strike-Commander Morrison', 1), -- Origins Edition Soldier: 76 Skins
  (7, 2, 3, 15, 'Immortal', 7), -- Halloween Terror Soldier: 76 Skins
  (1, 2, 2, 16, 'Cardamom', 1), -- Normal Symmetra Skins
  (1, 2, 2, 16, 'Hyacinth', 1),
  (1, 2, 2, 16, 'Saffron', 1),
  (1, 2, 2, 16, 'Technomancer', 1),
  (1, 2, 3, 16, 'Regal', 1),
  (1, 2, 3, 16, 'Utopaea', 1),
  (1, 2, 4, 16, 'Architech', 1),
  (1, 2, 4, 16, 'Devi', 1),
  (1, 2, 4, 16, 'Goddess', 1),
  (1, 2, 4, 16, 'Vishkar', 1),
  (7, 2, 3, 16, 'Vampire', 7), -- Halloween Terror Symmetra Skins
  (1, 2, 2, 17, 'Blå', 1), -- Normal Torbjörn Skins
  (1, 2, 2, 17, 'Citron', 1),
  (1, 2, 2, 17, 'Grön', 1),
  (1, 2, 2, 17, 'Plommon', 1),
  (1, 2, 3, 17, 'Cathode', 1),
  (1, 2, 3, 17, 'Woodclad', 1),
  (1, 2, 4, 17, 'Barbarossa', 1),
  (1, 2, 4, 17, 'Blackbeard', 1),
  (1, 2, 4, 17, 'Chopper', 1),
  (1, 2, 4, 17, 'Deadlock', 1),
  (6, 2, 3, 17, 'Tre Kronor', 4), -- Summer Games Torbjörn Skins
  (1, 2, 2, 18, 'Electric Purple', 1), -- Normal Tracer Skins
  (1, 2, 2, 18, 'Hot Pink', 1),
  (1, 2, 2, 18, 'Neon Green', 1),
  (1, 2, 2, 18, 'Royal Blue', 1),
  (1, 2, 3, 18, 'Posh', 1),
  (1, 2, 3, 18, 'Sporty', 1),
  (1, 2, 4, 18, 'Mach T', 1),
  (1, 2, 4, 18, 'Punk', 1),
  (1, 2, 4, 18, 'T. Racer', 1),
  (1, 2, 4, 18, 'Ultraviolet', 1),
  (3, 2, 4, 18, 'Slipstream', 1), -- Origins Edition Tracer Skins
  (6, 2, 4, 18, 'Sprinter', 4), -- Summer Games Tracer Skins
  (6, 2, 4, 18, 'Track And Field', 4),
  (1, 2, 2, 19, 'Ciel', 1), -- Normal Widowmaker Skins
  (1, 2, 2, 19, 'Nuit', 1),
  (1, 2, 2, 19, 'Rose', 1),
  (1, 2, 2, 19, 'Vert', 1),
  (1, 2, 3, 19, 'Patina', 1),
  (1, 2, 3, 19, 'Winter', 1),
  (1, 2, 4, 19, 'Comptesse', 1),
  (1, 2, 4, 19, 'Huntress', 1),
  (1, 2, 4, 19, 'Odette', 1),
  (1, 2, 4, 19, 'Odile', 1),
  (4, 2, 4, 19, 'Noire', 1), -- Preorder Widowmaker Skins
  (6, 2, 3, 19, 'Tricolore', 4), -- Summer Games Widowmaker Skins
  (1, 2, 2, 20, 'Atmosphere', 1), -- Normal Winston Skins
  (1, 2, 2, 20, 'Banana', 1),
  (1, 2, 2, 20, 'Forest', 1),
  (1, 2, 2, 20, 'Red Planet', 1),
  (1, 2, 3, 20, 'Desert', 1),
  (1, 2, 3, 20, 'Horizon', 1),
  (1, 2, 4, 20, 'Explorer', 1),
  (1, 2, 4, 20, 'Frogston', 1),
  (1, 2, 4, 20, 'Safari', 1),
  (1, 2, 4, 20, 'Undersea', 1),
  (1, 2, 2, 21, 'Brick', 1), -- Normal Zarya Skins
  (1, 2, 2, 21, 'Goldenrod', 1),
  (1, 2, 2, 21, 'Taiga', 1),
  (1, 2, 2, 21, 'Violet', 1),
  (1, 2, 3, 21, 'Dawn', 1),
  (1, 2, 3, 21, 'Midnight', 1),
  (1, 2, 4, 21, 'Arctic', 1),
  (1, 2, 4, 21, 'Cybergoth', 1),
  (1, 2, 4, 21, 'Industrial', 1),
  (1, 2, 4, 21, 'Siberian Front', 1),
  (6, 2, 4, 21, 'Champion', 4), -- Summer Games Zarya Skins
  (6, 2, 4, 21, 'Weightlifter', 4),
  (1, 2, 2, 22, 'Air', 1), -- Normal Zenyatta Skins
  (1, 2, 2, 22, 'Earth', 1),
  (1, 2, 2, 22, 'Leaf', 1),
  (1, 2, 2, 22, 'Water', 1),
  (1, 2, 3, 22, 'Ascendant', 1),
  (1, 2, 3, 22, 'Harmonious', 1),
  (1, 2, 4, 22, 'Djinnyatta', 1),
  (1, 2, 4, 22, 'Ifrit', 1),
  (1, 2, 4, 22, 'Ra', 1),
  (1, 2, 4, 22, 'Sunyatta', 1),
  (7, 2, 3, 22, 'Skullyatta', 7), -- Halloween Terror Zenyatta Skins
  (1, 2, 2, 23, 'Cidro', 9), -- Normal Sombra Skins
  (1, 2, 2, 23, 'Incendio', 9),
  (1, 2, 2, 23, 'Mar', 9),
  (1, 2, 2, 23, 'Noche', 9),
  (1, 2, 3, 23, 'Azúcar', 9),
  (1, 2, 3, 23, 'Glitch', 9),
  (1, 2, 4, 23, 'Virus', 9),
  (1, 2, 4, 23, 'Augmented', 9),
  (1, 2, 4, 23, 'Cyberspace', 9),
  (1, 2, 4, 23, 'Los Muertos', 9),
  -- Emotes TODO dates for sitting 08-23
  (1, 3, 3, 1, 'Disapproving', 3), -- Normal Ana Emotes
  (1, 3, 3, 1, 'Not Impressed', 3),
  (1, 3, 3, 1, 'Protector', 3),
  (1, 3, 3, 1, 'Take A Knee', 3),
  (1, 3, 3, 1, 'Tea Time', 3),
  (7, 3, 3, 1, 'Candy', 7), -- Halloween Terror Ana Emotes
  (1, 3, 3, 2, 'Alert! Alert!', 1), -- Normal Bastion Emotes
  (1, 3, 3, 2, 'Chortle', 1),
  (1, 3, 3, 2, 'Dizzy', 1),
  (1, 3, 3, 2, 'Robot', 1),
  (1, 3, 3, 2, 'CandyCandy', 1),
  (1, 3, 3, 2, 'Rest Mode', 1),
  (6, 3, 3, 2, 'Boxing', 4), -- Summer Games Bastion Emotes
  (1, 3, 3, 3, '^O^', 1), -- Normal D.Va Emotes
  (1, 3, 3, 3, 'Bunny Hop', 1),
  (1, 3, 3, 3, 'Heartbreaker', 1),
  (1, 3, 3, 3, 'Party Time', 1),
  (1, 3, 4, 3, 'Game On', 5),
  (1, 3, 3, 4, 'Amusing', 1), -- Normal Genji Emotes
  (1, 3, 3, 4, 'Challenge', 1),
  (1, 3, 3, 4, 'Cutting Edge', 1),
  (1, 3, 3, 4, 'Meditate', 1),
  (1, 3, 3, 4, 'Salute', 1),
  (1, 3, 3, 5, 'Beckon', 1), -- Normal Hanzo Emotes
  (1, 3, 3, 5, 'Brush Shoulder', 1),
  (1, 3, 3, 5, 'Chuckle', 1),
  (1, 3, 3, 5, 'Meditate', 1),
  (1, 3, 3, 5, 'Victory', 1),
  (1, 3, 3, 6, 'Can''t Deal', 1), -- Normal Junkrat Emotes
  (1, 3, 3, 6, 'Juggling', 1),
  (1, 3, 3, 6, 'Lounging', 1),
  (1, 3, 3, 6, 'Puppet', 1),
  (1, 3, 3, 6, 'Vaudeville', 1),
  (1, 3, 3, 7, 'Capoeira', 1), -- Normal Lúcio Emotes
  (1, 3, 3, 7, 'Chilling', 1),
  (1, 3, 3, 7, 'In The Groove', 1),
  (1, 3, 3, 7, 'Knee Slapper', 1),
  (1, 3, 3, 7, 'Nah!', 1),
  (6, 3, 3, 7, 'Juggle', 4), -- Summer Games Lúcio Emotes
  (1, 3, 3, 8, 'Gunspinning', 1), -- Normal McCree Emotes
  (1, 3, 3, 8, 'Hat Tip', 1),
  (1, 3, 3, 8, 'Joker', 1),
  (1, 3, 3, 8, 'Spit', 1),
  (1, 3, 3, 8, 'Take A Load Off', 1),
  (1, 3, 3, 9, 'Companion', 1), -- Normal Mei Emotes
  (1, 3, 3, 9, 'Giggle', 1),
  (1, 3, 3, 9, 'Kneel', 1),
  (1, 3, 3, 9, 'Spray', 1),
  (1, 3, 3, 9, 'Yaaaaaaaaay!', 1),
  (1, 3, 3, 10, 'Applause', 1), -- Normal Mercy Emotes
  (1, 3, 3, 10, 'Caduceus', 1),
  (1, 3, 3, 10, 'No Pulse', 1),
  (1, 3, 3, 10, 'Relax', 1),
  (1, 3, 3, 10, 'The Best Medicine', 1),
  (1, 3, 3, 11, 'Cheer', 1), -- Normal Pharah Emotes
  (1, 3, 3, 11, 'Chuckle', 1),
  (1, 3, 3, 11, 'Flourish', 1),
  (1, 3, 3, 11, 'Knuckles', 1),
  (1, 3, 3, 11, 'Take A Knee', 1),
  (1, 3, 3, 12, 'Cackle', 1), -- Normal Reaper Emotes
  (1, 3, 3, 12, 'Not Impressed', 1),
  (1, 3, 3, 12, 'Slice', 1),
  (1, 3, 3, 12, 'Slow Clap', 1),
  (1, 3, 3, 12, 'Take A Knee', 1),
  (1, 3, 3, 13, 'Flex', 1), -- Normal Reinhardt Emotes
  (1, 3, 3, 13, 'Kneel', 1),
  (1, 3, 3, 13, 'Taunt', 1),
  (1, 3, 3, 13, 'Uproarious', 1),
  (1, 3, 3, 13, 'Warrior''s Salute', 1),
  (7, 3, 3, 13, 'Pumpkin Smash', 7), -- Halloween Terror Reinhardt Emotes
  (1, 3, 3, 14, 'Belly Laugh', 1), -- Normal Roadhog Emotes
  (1, 3, 3, 14, 'Boo!', 1),
  (1, 3, 3, 14, 'Can Crusher', 1),
  (1, 3, 3, 14, 'Headbanging', 1),
  (1, 3, 3, 14, 'Tuckered Out', 1),
  (1, 3, 3, 15, 'Amused', 1), -- Normal Soldier: 76 Emotes
  (1, 3, 3, 15, 'Fist', 1),
  (1, 3, 3, 15, 'I See You', 1),
  (1, 3, 3, 15, 'Locked And Loaded', 1),
  (1, 3, 3, 15, 'Take A Knee', 1),
  (1, 3, 3, 16, 'Clap', 1), -- Normal Symmetra Emotes
  (1, 3, 3, 16, 'Flow', 1),
  (1, 3, 3, 16, 'Have A Seat', 1),
  (1, 3, 3, 16, 'Insignificant', 1),
  (1, 3, 3, 16, 'Snicker', 1),
  (6, 3, 3, 16, 'Ribbon', 1), -- Summer Games Symmetra Emotes
  (1, 3, 3, 17, 'Clicking Heels', 1), -- Normal Torbjörn Emotes
  (1, 3, 3, 17, 'Fisticuffs', 1),
  (1, 3, 3, 17, 'Guffaw', 1),
  (1, 3, 3, 17, 'Overload', 1),
  (1, 3, 3, 17, 'Taking A Break', 1),
  (1, 3, 3, 18, 'Cheer', 1), -- Normal Tracer Emotes
  (1, 3, 3, 18, 'Having A Laugh', 1),
  (1, 3, 3, 18, 'Sitting Around...', 1),
  (1, 3, 3, 18, 'Spin', 1),
  (1, 3, 3, 19, 'At Rest', 1), -- Normal Widowmaker Emotes
  (1, 3, 3, 19, 'Curtain Call', 1),
  (1, 3, 3, 19, 'Delighted', 1),
  (1, 3, 3, 19, 'Shot Dead', 1),
  (1, 3, 3, 19, 'Widow''s Kiss', 1),
  (1, 3, 3, 20, 'Laughing Matter', 1), -- Normal Winston Emotes
  (1, 3, 3, 20, 'Monkey Business', 1),
  (1, 3, 3, 20, 'Peanut Butter?', 1),
  (1, 3, 3, 20, 'Roar', 1),
  (1, 3, 3, 20, 'Sitting Around', 1),
  (7, 3, 3, 20, 'Shadow Puppets', 1), -- Halloween Terror Winston Emotes
  (1, 3, 3, 21, 'Bring It On', 1), -- Normal Zarya Emotes
  (1, 3, 3, 21, 'Comedy Gold', 1),
  (1, 3, 3, 21, 'Crush You', 1),
  (1, 3, 3, 21, 'Pumping Iron', 1),
  (1, 3, 3, 21, 'Take A Knee', 1),
  (1, 3, 3, 22, 'Focusing', 1), -- Normal Zenyatta Emotes
  (1, 3, 3, 22, 'Meditate', 1),
  (1, 3, 3, 22, 'Round Of Applause', 1),
  (1, 3, 3, 22, 'Taunt', 1),
  (1, 3, 3, 22, 'Tickled', 1),
  (1, 3, 3, 23, 'Amused', 9), -- Normal Sombra Emotes
  (1, 3, 3, 23, 'Hold On', 9),
  (1, 3, 3, 23, 'Masterpiece', 9),
  -- Victory Poses
  (1, 4, 2, 1, 'Mission Complete', 3), -- Normal Ana Victory Poses
  (1, 4, 2, 1, 'Protector', 3),
  (1, 4, 2, 1, 'Seated', 3),
  (7, 4, 2, 1, 'R.I.P.', 7), -- Halloween Terror Ana Victory Poses
  (1, 4, 2, 2, 'Birdwatching', 1), -- Normal Bastion Victory Poses
  (1, 4, 2, 2, 'Pop Up', 1),
  (1, 4, 2, 2, 'Tank', 1),
  (7, 4, 2, 2, 'R.I.P.', 7), -- Halloween Terror Bastion Victory Poses
  (1, 4, 2, 3, 'I Heart You', 1), -- Normal D.Va Victory Poses
  (1, 4, 2, 3, 'Peace', 1),
  (1, 4, 2, 3, 'Sitting', 1),
  (7, 4, 2, 3, 'R.I.P.', 7), -- Halloween Terror D.Va Victory Poses
  (1, 4, 2, 4, 'Kneeling', 1), -- Normal Genji Victory Poses
  (1, 4, 2, 4, 'Shuriken', 1),
  (1, 4, 2, 4, 'Sword Stance', 1),
  (7, 4, 2, 4, 'R.I.P.', 7), -- Halloween Terror Genji Victory Poses
  (1, 4, 2, 5, 'Confident', 1), -- Normal Hanzo Victory Poses
  (1, 4, 2, 5, 'Kneeling', 1),
  (1, 4, 2, 5, 'Over The Shoulder', 1),
  (1, 4, 2, 5, 'Candy', 1),
  (7, 4, 2, 5, 'R.I.P.', 7), -- Halloween Terror Hanzo Victory Poses
  (1, 4, 2, 6, 'It''ll Freeze That Way', 1), -- Normal Junkrat Victory Poses
  (1, 4, 2, 6, 'Kneeling', 1),
  (1, 4, 2, 6, 'Nyah Nyah', 1),
  (7, 4, 2, 6, 'R.I.P.', 7), -- Halloween Terror Junkrat Victory Poses
  (1, 4, 2, 7, 'Confident', 1), -- Normal Lúcio Victory Poses
  (1, 4, 2, 7, 'Grooving', 1),
  (1, 4, 2, 7, 'Ready For Action', 1),
  (7, 4, 2, 7, 'R.I.P.', 7), -- Halloween Terror Lúcio Victory Poses
  (1, 4, 2, 8, 'Contemplative', 1), -- Normal McCree Victory Poses
  (1, 4, 2, 8, 'Over The Shoulder', 1),
  (1, 4, 2, 8, 'Take It Easy', 1),
  (7, 4, 2, 8, 'R.I.P.', 7), -- Halloween Terror McCree Victory Poses
  (1, 4, 2, 9, 'Casual', 1), -- Normal Mei Victory Poses
  (1, 4, 2, 9, 'Hands On Hips', 1),
  (1, 4, 2, 9, 'Kneeling', 1),
  (6, 4, 2, 9, 'Medal', 4), -- Summer Games Mei Victory Poses
  (7, 4, 2, 9, 'R.I.P.', 7), -- Halloween Terror Mei Victory Poses
  (1, 4, 2, 10, 'Angelic', 1), -- Normal Mercy Victory Poses
  (1, 4, 2, 10, 'Carefree', 1),
  (1, 4, 2, 10, 'Ready For Battle', 1),
  (7, 4, 2, 10, 'R.I.P.', 7), -- Halloween Terror Mercy Victory Poses
  (1, 4, 2, 11, 'Guardian', 1), -- Normal Pharah Victory Poses
  (1, 4, 2, 11, 'Jump Jet', 1),
  (1, 4, 2, 11, 'Kneeling', 1),
  (6, 4, 2, 11, 'Medal', 4), -- Summer Games Pharah Victory Poses
  (7, 4, 2, 11, 'R.I.P.', 7), -- Halloween Terror Pharah Victory Poses
  (1, 4, 2, 12, 'Casual', 1), -- Normal Reaper Victory Poses
  (1, 4, 2, 12, 'Enigmatic', 1),
  (1, 4, 2, 12, 'Menacing', 1),
  (1, 4, 2, 12, 'Medal', 1), -- Summer Games Reaper Victory Poses
  (7, 4, 2, 12, 'R.I.P.', 7), -- Halloween Terror Reaper Victory Poses
  (1, 4, 2, 13, 'Confident', 1), -- Normal Reinhardt Victory Poses
  (1, 4, 2, 13, 'Flex', 1),
  (1, 4, 2, 13, 'Legendary', 1),
  (7, 4, 2, 13, 'R.I.P.', 7), -- Halloween Terror Reinhardt Victory Poses
  (1, 4, 2, 14, 'Pointing To The Sky', 1), -- Normal Roadhog Victory Poses
  (1, 4, 2, 14, 'Thumbs Up', 1),
  (1, 4, 2, 14, 'Tuckered Out', 1),
  (6, 4, 2, 14, 'Medal', 4), -- Summer Games Roadhog Victory Poses
  (7, 4, 2, 14, 'R.I.P.', 7), -- Halloween Terror Roadhog Victory Poses
  (1, 4, 2, 15, 'Fist Pump', 1), -- Normal Soldier: 76 Victory Poses
  (1, 4, 2, 15, 'Locked And Loaded', 1),
  (1, 4, 2, 15, 'Soldier', 1),
  (6, 4, 2, 15, 'Golf Swing', 4), -- Summer Games Soldier: 76 Victory Poses
  (7, 4, 2, 15, 'R.I.P.', 7), -- Halloween Terror Soldier: 76 Victory Poses
  (1, 4, 2, 16, 'Balance', 1), -- Normal Symmetra Victory Poses
  (1, 4, 2, 16, 'Creation', 1),
  (1, 4, 2, 16, 'Dance', 1),
  (7, 4, 2, 16, 'R.I.P.', 7), -- Halloween Terror Symmetra Victory Poses
  (1, 4, 2, 17, 'Hammer', 1), -- Normal Torbjörn Victory Poses
  (1, 4, 2, 17, 'Sitting Pretty', 1),
  (1, 4, 2, 17, 'Take Five', 1),
  (6, 4, 2, 17, 'Medal', 4), -- Summer Games Torbjörn Victory Poses
  (7, 4, 2, 17, 'R.I.P.', 7), -- Halloween Terror Torbjörn Victory Poses
  (1, 4, 2, 18, 'Over The Shoulder', 1), -- Normal Tracer Victory Poses
  (1, 4, 2, 18, 'Salute', 1),
  (1, 4, 2, 18, 'Sitting', 1),
  (7, 4, 2, 18, 'R.I.P.', 7), -- Halloween Terror Tracer Victory Poses
  (1, 4, 2, 19, 'Activating Visor', 1), -- Normal Widowmaker Victory Poses
  (1, 4, 2, 19, 'Gaze', 1),
  (1, 4, 2, 19, 'Over The Shoulder', 1),
  (6, 4, 2, 19, 'Medal', 4), -- Summer Games Widowmaker Victory Poses
  (7, 4, 2, 19, 'R.I.P.', 7), -- Halloween Terror Widowmaker Victory Poses
  (1, 4, 2, 20, 'Beast', 1), -- Normal Winston Victory Poses
  (1, 4, 2, 20, 'Glasses', 1),
  (1, 4, 2, 20, 'The Thinker', 1),
  (6, 4, 2, 20, 'Medal', 4), -- Summer Games Winston Victory Poses
  (7, 4, 2, 20, 'R.I.P.', 7), -- Halloween Terror Winston Victory Poses
  (1, 4, 2, 21, 'Casual', 1), -- Normal Zarya Victory Poses
  (1, 4, 2, 21, 'Check Out This Gun', 1),
  (1, 4, 2, 21, 'Flexing', 1),
  (7, 4, 2, 21, 'R.I.P.', 7), -- Halloween Terror Zarya Victory Poses
  (1, 4, 2, 22, 'Balance', 1), -- Normal Zenyatta Victory Poses
  (1, 4, 2, 22, 'Harmony', 1),
  (1, 4, 2, 22, 'Peace', 1),
  (6, 4, 2, 22, 'Medals', 4), -- Summer Games Zenyatta Victory Poses
  (7, 4, 2, 22, 'R.I.P.', 7), -- Halloween Terror Zenyatta Victory Poses
  (1, 4, 2, 23, 'Hacked', 9), -- Normal Sombra Victory Poses
  (1, 4, 2, 23, 'Kneeling', 9),
  (1, 4, 2, 23, 'Rising', 9),
  -- Voice Lines
  (1, 5, 1, 1, 'Children, Behave', 3), -- Normal Ana Voice Lines
  (1, 5, 1, 1, 'Everyone Dies', 3),
  (1, 5, 1, 1, 'It Takes A Woman To Know It', 3),
  (1, 5, 1, 1, 'Justice Rains From Above', 3),
  (1, 5, 1, 1, 'Mother Knows Best', 3),
  (1, 5, 1, 1, 'No Scope Needed', 3),
  (1, 5, 1, 1, 'Someone To Tuck You In?', 3),
  (1, 5, 1, 1, 'What Are You Thinking?', 3),
  (1, 5, 1, 1, 'Witness Me', 3),
  (1, 5, 1, 1, 'You Know Nothing', 3),
  (6, 5, 1, 1, 'Learn From The Pain', 4), -- Summer Games Ana Voice Lines
  (7, 5, 1, 1, 'Are You Scared?', 7), -- Halloween Terror Ana Voice Lines
  (1, 5, 1, 2, 'Beeple', 1), -- Normal Bastion Voice Lines
  (1, 5, 1, 2, 'Boo Boo Doo De Doo', 1),
  (1, 5, 1, 2, 'Bweeeeeeeeeee', 1),
  (1, 5, 1, 2, 'Chirr Chirr Chirr', 1),
  (1, 5, 1, 2, 'Dah-Dah Weeeee!', 1),
  (1, 5, 1, 2, 'Dun Dun Boop Boop', 1),
  (1, 5, 1, 2, 'Dweet Dweet Dweet!', 1),
  (1, 5, 1, 2, 'Hee Hoo Hoo', 1),
  (1, 5, 1, 2, 'Sh-Sh-Sh', 1),
  (1, 5, 1, 2, 'Zwee?', 1),
  (6, 5, 1, 2, 'Whoo-Vweeeeee', 4), -- Summer Games Bastion Voice Lines
  (7, 5, 1, 2, 'W-w-wooooo...?', 7), -- Halloween Terror Bastion Voice Lines
  (1, 5, 1, 3, ';)', 1), -- Normal D.Va Voice Lines
  (1, 5, 1, 3, 'A New Challenger!', 1),
  (1, 5, 1, 3, 'AFK', 1),
  (1, 5, 1, 3, 'Aw, Yeah!', 1),
  (1, 5, 1, 3, 'D.Va: 1, Bad Guys: 0', 1),
  (1, 5, 1, 3, 'GG!', 1),
  (1, 5, 1, 3, 'I Play To Win', 1),
  (1, 5, 1, 3, 'Is This Easy Mode?', 1),
  (1, 5, 1, 3, 'LOL', 1),
  (1, 5, 1, 3, 'No Hacks Required', 1),
  (6, 5, 1, 3, 'I''m #1', 4), -- Summer Games D.Va Voice Lines
  (7, 5, 1, 3, 'Happy Halloween', 7), -- Halloween Terror D.Va Voice Lines
  (1, 5, 1, 4, 'Come on!', 1), -- Normal Genji Voice Lines
  (1, 5, 1, 4, 'Damn!', 1),
  (1, 5, 1, 4, 'I Am Prepared!', 1),
  (1, 5, 1, 4, 'Let''s Fight!', 1),
  (1, 5, 1, 4, 'Measure Twice, Cut Once', 1),
  (1, 5, 1, 4, 'My Soul Seeks Balance', 1),
  (1, 5, 1, 4, 'Not Good Enough', 1),
  (1, 5, 1, 4, 'Simple', 1),
  (1, 5, 1, 4, 'Yeah!', 1),
  (1, 5, 1, 4, 'You Are Only Human', 1),
  (6, 5, 1, 4, 'I Was Hoping For A Challenge', 4), -- Summer Games Genji Voice Lines
  (7, 5, 1, 4, 'My Halloween Costume?', 7), -- Halloween Terror Genji Voice Lines
  (1, 5, 1, 5, 'Flow Like Water', 1), -- Normal Hanzo Voice Lines
  (1, 5, 1, 5, 'From One Thing...', 1),
  (1, 5, 1, 5, 'Hm...', 1),
  (1, 5, 1, 5, 'I Do What I Must', 1),
  (1, 5, 1, 5, 'Never In Doubt', 1),
  (1, 5, 1, 5, 'Never Second Best', 1),
  (1, 5, 1, 5, 'Remember This Moment', 1),
  (1, 5, 1, 5, 'Sake!', 1),
  (1, 5, 1, 5, 'Spirit Dragon', 1),
  (1, 5, 1, 5, 'Step Into The Dojo', 1),
  (6, 5, 1, 5, 'Ignore All Distractions', 4), -- Summer Games Hanzo Voice Lines
  (7, 5, 1, 5, 'You Are Already Dead', 7), -- Halloween Terror Hanzo Voice Lines
  (1, 5, 1, 6, '...Blow It Up Again', 1), -- Normal Junkrat Voice Lines
  (1, 5, 1, 6, 'Anyone Want Some BBQ?', 1),
  (1, 5, 1, 6, 'Brrring!', 1),
  (1, 5, 1, 6, 'Coming Up Explodey!', 1),
  (1, 5, 1, 6, 'Happy Birthday', 1),
  (1, 5, 1, 6, 'Have A Nice Day!', 1),
  (1, 5, 1, 6, 'It''s The Little Things', 1),
  (1, 5, 1, 6, 'Kaboom', 1),
  (1, 5, 1, 6, 'Ohh, Shiny', 1),
  (1, 5, 1, 6, 'Smile!', 1),
  (6, 5, 1, 6, 'I Give It A 10!', 4), -- Summer Games Junkrat Voice Lines
  (7, 5, 1, 6, 'Happy Halloween', 7), -- Halloween Terror Junkrat Voice Lines
  (1, 5, 1, 7, 'Can''t Stop, Won''t Stop', 1), -- Normal Lúcio Voice Lines
  (1, 5, 1, 7, 'Hit Me!', 1),
  (1, 5, 1, 7, 'I Could Do This All Day', 1),
  (1, 5, 1, 7, 'I''m On Top Of The World', 1),
  (1, 5, 1, 7, 'Jackpot!', 1),
  (1, 5, 1, 7, 'Not Hearing That Noise', 1),
  (1, 5, 1, 7, 'Oh, Yeah!', 1),
  (1, 5, 1, 7, 'Tinnitus', 1),
  (1, 5, 1, 7, 'Why Are You So Angry?', 1),
  (1, 5, 1, 7, 'You Gotta Believe!', 1),
  (6, 5, 1, 7, 'Be Champions', 4), -- Summer Games Lúcio Voice Lines
  (7, 5, 1, 7, 'Killed It!', 7), -- Halloween Terror Lúcio Voice Lines
  (1, 5, 1, 8, 'Ain''t I Killed You Before', 1), -- Normal McCree Voice Lines
  (1, 5, 1, 8, 'Happens To The Best Of Us', 1),
  (1, 5, 1, 8, 'I Tried Being Reasonable', 1),
  (1, 5, 1, 8, 'I''m In The Quick...', 1),
  (1, 5, 1, 8, 'I''m Your Huckleberry', 1),
  (1, 5, 1, 8, 'I''ve Got A Bullet...', 1),
  (1, 5, 1, 8, 'Reach For The Sky', 1),
  (1, 5, 1, 8, 'Sure As Hell Ain''t Ugly', 1),
  (1, 5, 1, 8, 'Wanted: Dead Or Alive', 1),
  (1, 5, 1, 8, 'You Done?', 1),
  (6, 5, 1, 8, 'I Don''t Much Like Losing', 4), -- Summer Games McCree Voice Lines
  (7, 5, 1, 8, 'It''s Your Funeral', 7), -- Halloween Terror McCree Voice Lines
  (1, 5, 1, 9, 'A-Mei-Zing!', 1), -- Normal Mei Voice Lines
  (1, 5, 1, 9, 'Chill Out!', 1),
  (1, 5, 1, 9, 'Fight For Our World', 1),
  (1, 5, 1, 9, 'Learned Your Lesson', 1),
  (1, 5, 1, 9, 'Okay!', 1),
  (1, 5, 1, 9, 'Ouch, Are You Okay?', 1),
  (1, 5, 1, 9, 'Sorry Sorry Sorry Sorry', 1),
  (1, 5, 1, 9, 'That Was Great', 1),
  (1, 5, 1, 9, 'Yay!', 1),
  (1, 5, 1, 9, 'You Have To Let It Go', 1),
  (6, 5, 1, 9, 'Overcome All Obstacles', 4), -- Summer Games Mei Voice Lines
  (7, 5, 1, 9, 'Scary!', 7), -- Halloween Terror Mei Voice Lines
  (1, 5, 1, 10, 'Consultation Fee', 1), -- Normal Mercy Voice Lines
  (1, 5, 1, 10, 'Doctor''s Orders', 1),
  (1, 5, 1, 10, 'How Barbaric', 1),
  (1, 5, 1, 10, 'Miracle Worker', 1),
  (1, 5, 1, 10, 'Need A Second Opinion?', 1),
  (1, 5, 1, 10, 'On A Scale Of 1-10', 1),
  (1, 5, 1, 10, 'Super!', 1),
  (1, 5, 1, 10, 'Take Two', 1),
  (1, 5, 1, 10, 'The Doctor Is In', 1),
  (1, 5, 1, 10, 'The Doctor Will See You', 1),
  (6, 5, 1, 10, 'Piece Of Cake', 4), -- Summer Games Mercy Voice Lines
  (7, 5, 1, 10, 'Superstition', 7), -- Halloween Terror Mercy Voice Lines
  (1, 5, 1, 11, 'Aerial Superiority Achieved', 1), -- Normal Pharah Voice Lines
  (1, 5, 1, 11, 'Fly Like An Egyptian', 1),
  (1, 5, 1, 11, 'Flying The Friendly Skies', 1),
  (1, 5, 1, 11, 'Got You On My Radar', 1),
  (1, 5, 1, 11, 'Leave This To A Professional', 1),
  (1, 5, 1, 11, 'Not A Chance', 1),
  (1, 5, 1, 11, 'Play Nice, Play Pharah', 1),
  (1, 5, 1, 11, 'Rocket Jump?', 1),
  (1, 5, 1, 11, 'Shot Down', 1),
  (1, 5, 1, 11, 'Sorry, But I Need To Jet', 1),
  (6, 5, 1, 11, 'We Are In This Together', 4), -- Summer Games Pharah Voice Lines
  (7, 5, 1, 11, 'Dead Or Alive', 7), -- Halloween Terror Pharah Voice Lines
  (1, 5, 1, 12, 'Dead Man Walking', 1), -- Normal Reaper Voice Lines
  (1, 5, 1, 12, 'Give Me A Break', 1),
  (1, 5, 1, 12, 'Haven''t I Killed You', 1),
  (1, 5, 1, 12, 'I''m Back In Black', 1),
  (1, 5, 1, 12, 'If It Lives, I Can Kill It', 1),
  (1, 5, 1, 12, 'Next', 1),
  (1, 5, 1, 12, 'Psychopath', 1),
  (1, 5, 1, 12, 'Seen A Ghost?', 1),
  (1, 5, 1, 12, 'Too Easy', 1),
  (1, 5, 1, 12, 'Was That All?', 1),
  (6, 5, 1, 12, 'It''s In The Refrigerator', 4), -- Summer Games Reaper Voice Lines
  (7, 5, 1, 12, 'I Work The Graveyard Shift', 7), -- Halloween Terror Reaper Voice Lines
  (1, 5, 1, 13, 'Golden', 1), -- Normal Reinhardt Voice Lines
  (1, 5, 1, 13, 'Golden', 1),
  (1, 5, 1, 14, 'Golden', 1), -- Normal Roadhog Voice Lines
  (1, 5, 1, 14, 'Golden', 1),
  (1, 5, 1, 15, 'Golden', 1), -- Normal Soldier: 76 Voice Lines
  (1, 5, 1, 15, 'Golden', 1),
  (1, 5, 1, 16, 'Golden', 1), -- Normal Symmetra Voice Lines
  (1, 5, 1, 16, 'Golden', 1),
  (1, 5, 1, 17, 'Golden', 1), -- Normal Torbjörn Voice Lines
  (1, 5, 1, 17, 'Golden', 1),
  (1, 5, 1, 18, 'Golden', 1), -- Normal Tracer Voice Lines
  (1, 5, 1, 18, 'Golden', 1),
  (1, 5, 1, 19, 'Golden', 1), -- Normal Widowmaker Voice Lines
  (1, 5, 1, 19, 'Golden', 1),
  (1, 5, 1, 20, 'Golden', 1), -- Normal Winston Voice Lines
  (1, 5, 1, 20, 'Golden', 1),
  (1, 5, 1, 21, 'Golden', 1), -- Normal Zarya Voice Lines
  (1, 5, 1, 21, 'Golden', 1),
  (1, 5, 1, 22, 'Golden', 1), -- Normal Zenyatta Voice Lines
  (1, 5, 1, 22, 'Golden', 1),
  (1, 5, 1, 23, 'Golden', 9), -- Normal Sombra Voice Lines
  (1, 5, 1, 23, 'Golden', 9),
  -- Sprays
  (NULL, 6, NULL, NULL, 'Logo', 1), -- Default All Heroes Sprays
  (NULL, 6, NULL, NULL, 'You Are Not Prepared', 3),
  (NULL, 6, NULL, NULL, 'Día De Los Muertos', 8),
  (1, 6, 1, NULL, '...Punch', 1), -- Normal All Heroes Sprays
  (1, 6, 1, NULL, 'Catcher', 1),
  (1, 6, 1, NULL, 'Caution', 1),
  (1, 6, 1, NULL, 'Dance', 1),
  (1, 6, 1, NULL, 'Dark Logo', 1),
  (1, 6, 1, NULL, 'Dark Overwatch', 1),
  (1, 6, 1, NULL, 'Dark Title', 1),
  (1, 6, 1, NULL, 'FotS2', 1),
  (1, 6, 1, NULL, 'Fuji', 1),
  (1, 6, 1, NULL, 'Goldshire Pictures', 1),
  (1, 6, 1, NULL, 'Leek', 1),
  (1, 6, 1, NULL, 'Lumérico', 1),
  (1, 6, 1, NULL, 'Numbani Statue', 1),
  (1, 6, 1, NULL, 'Omnic Rights', 1),
  (1, 6, 1, NULL, 'Overwatch', 1),
  (1, 6, 1, NULL, 'Overwatch Title', 1),
  (1, 6, 1, NULL, 'Pachimari', 1),
  (1, 6, 1, NULL, 'Rhino', 1),
  (1, 6, 1, NULL, 'Rikimaru', 1),
  (1, 6, 1, NULL, 'Sarcophagus', 1),
  (1, 6, 1, NULL, 'Scooter', 1),
  (1, 6, 1, NULL, 'Scroll', 1),
  (1, 6, 1, NULL, 'Siege Mode', 1),
  (1, 6, 1, NULL, 'Six Gun Killer', 1),
  (1, 6, 1, NULL, 'Sol', 1),
  (1, 6, 1, NULL, 'Soulstone', 1),
  (1, 6, 1, NULL, 'Vivi''s Adventure', 1),
  (2, 6, 1, NULL, 'Beyond The Moon', 1), -- Achievements All Heroes Sprays
  (2, 6, 1, NULL, 'Forge Onward', 1),
  (2, 6, 1, NULL, 'GL HF', 1),
  (2, 6, 1, NULL, 'Halloween Special', 7),
  (2, 6, 1, NULL, 'Jail', 1),
  (2, 6, 1, NULL, 'Junkenstein''s Revenge', 7),
  (2, 6, 1, NULL, 'Man And Omnic', 1),
  (2, 6, 1, NULL, 'Oops', 1),
  (2, 6, 1, NULL, 'Out Of My Way', 1),
  (2, 6, 1, NULL, 'Piñata', 1),
  (2, 6, 1, NULL, 'Red O', 1),
  (2, 6, 1, NULL, 'Red X', 1),
  (2, 6, 1, NULL, 'Respect', 1),
  (2, 6, 1, NULL, 'Rise', 1),
  (2, 6, 1, NULL, 'Rise Of The Zomnics', 7),
  (2, 6, 1, NULL, 'Sorry', 1),
  (2, 6, 1, NULL, 'Tea Time', 1),
  (2, 6, 1, NULL, 'Thanks', 1),
  (2, 6, 1, NULL, 'The Reapening', 7),
  (2, 6, 1, NULL, 'Victory', 1),
  (2, 6, 1, NULL, 'Well Played', 1),
  (5, 6, 1, NULL, 'Season 1 Competitor', 2), -- Competitive All Heroes Sprays
  (5, 6, 1, NULL, 'Season 1 Hero', 2),
  (5, 6, 1, NULL, 'Season 2 Competitor', 6),
  (5, 6, 1, NULL, 'Season 2 Hero', 6),
  (5, 6, 1, NULL, 'Season 3 Competitor', 10),
  (5, 6, 1, NULL, 'Season 3 Hero', 10),
  (7, 6, 1, NULL, '...Never Die', 7), -- Halloween Terror All Heroes Sprays
  (7, 6, 1, NULL, 'Bats', 7),
  (7, 6, 1, NULL, 'Boo!', 7),
  (7, 6, 1, NULL, 'Boop!', 7),
  (7, 6, 1, NULL, 'Candyball', 7),
  (7, 6, 1, NULL, 'Fangs', 7),
  (7, 6, 1, NULL, 'Gummy Hog', 7),
  (7, 6, 1, NULL, 'Halloween Special', 7),
  (7, 6, 1, NULL, 'Halloween Terror', 7),
  (7, 6, 1, NULL, 'Junkenstein''s Revenge', 7),
  (7, 6, 1, NULL, 'Pumpkins', 7),
  (7, 6, 1, NULL, 'Rise Of The Zomnics', 7),
  (7, 6, 1, NULL, 'The Reapening', 7),
  (7, 6, 1, NULL, 'Witch''s Brew', 7),
  (1, 6, 1, 1, 'todo', 3), -- Normal Ana Sprays
  (1, 6, 1, 2, 'Golden', 1), -- Normal Bastion Sprays
  (1, 6, 1, 3, 'Golden', 1), -- Normal D.Va Sprays
  (1, 6, 1, 4, 'Golden', 1), -- Normal Genji Sprays
  (1, 6, 1, 5, 'Golden', 1), -- Normal Hanzo Sprays
  (1, 6, 1, 6, 'Golden', 1), -- Normal Junkrat Sprays
  (1, 6, 1, 7, 'Golden', 1), -- Normal Lúcio Sprays
  (1, 6, 1, 8, 'Golden', 1), -- Normal McCree Sprays
  (1, 6, 1, 9, 'Golden', 1), -- Normal Mei Sprays
  (1, 6, 1, 10, 'Golden', 1), -- Normal Mercy Sprays
  (1, 6, 1, 11, 'Golden', 1), -- Normal Pharah Sprays
  (1, 6, 1, 12, 'Golden', 1), -- Normal Reaper Sprays
  (1, 6, 1, 13, 'Golden', 1), -- Normal Reinhardt Sprays
  (1, 6, 1, 14, 'Golden', 1), -- Normal Roadhog Sprays
  (1, 6, 1, 15, 'Golden', 1), -- Normal Soldier: 76 Sprays
  (1, 6, 1, 16, 'Golden', 1), -- Normal Symmetra Sprays
  (1, 6, 1, 17, 'Golden', 1), -- Normal Torbjörn Sprays
  (1, 6, 1, 18, 'Golden', 1), -- Normal Tracer Sprays
  (1, 6, 1, 19, 'Golden', 1), -- Normal Widowmaker Sprays
  (1, 6, 1, 20, 'Golden', 1), -- Normal Winston Sprays
  (1, 6, 1, 21, 'Golden', 1), -- Normal Zarya Sprays
  (1, 6, 1, 22, 'Golden', 1), -- Normal Zenyatta Sprays
  (1, 6, 1, 23, 'Golden', 9), -- Normal Sombra Sprays--TODO heroes
  -- Highlight Intros
  (1, 7, 3, 1, 'Guardian', 3), -- Normal Ana Highlight Intros
  (1, 7, 3, 1, 'Locked On', 3),
  (1, 7, 3, 1, 'Shh...', 3),
  (1, 7, 3, 2, 'Bullet Rain', 1), -- Normal Bastion Highlight Intros
  (1, 7, 3, 2, 'Ganymede', 1),
  (1, 7, 3, 2, 'On Guard', 1),
  (1, 7, 3, 3, 'Eject', 1), -- Normal D.Va Highlight Intros
  (1, 7, 3, 3, 'Lying Around', 1),
  (1, 7, 3, 3, 'Meka Activated', 1),
  (1, 7, 3, 4, 'Shuriken', 1), -- Normal Genji Highlight Intros
  (1, 7, 3, 4, 'Unsheathing The Sword', 1),
  (1, 7, 3, 4, 'Warrior''s Salute', 1),
  (7, 7, 3, 4, 'Pumpkin Carving', 7), -- Halloween Terror Genji Highlight Intros
  (1, 7, 3, 5, 'Backflip', 1), -- Normal Hanzo Highlight Intros
  (1, 7, 3, 5, 'My Aim Is True', 1),
  (1, 7, 3, 5, 'Superior', 1),
  (1, 7, 3, 6, 'I''m Flying', 1), -- Normal Junkrat Highlight Intros
  (1, 7, 3, 6, 'Rip-Tire', 1),
  (1, 7, 3, 6, 'Unfortunate', 1),
  (6, 7, 3, 6, 'Shotput', 4), -- Summer Games Junkrat Highlight Intros
  (1, 7, 3, 7, 'Drop The Beat', 1), -- Normal Lúcio Highlight Intros
  (1, 7, 3, 7, 'Freestyle', 1),
  (1, 7, 3, 7, 'In The Groove', 1),
  (1, 7, 3, 7, 'Bicycle Kick', 1), -- Summer Games Lúcio Highlight Intros
  (1, 7, 3, 8, 'Rolling Into Action', 1), -- Normal McCree Highlight Intros
  (1, 7, 3, 8, 'The Duel', 1),
  (1, 7, 3, 8, 'The Name''s McCree', 1),
  (1, 7, 3, 9, 'Frosty :)', 1), -- Normal Mei Highlight Intros
  (1, 7, 3, 9, 'Going Up!', 1),
  (1, 7, 3, 9, 'Skating Around', 1),
  (7, 7, 3, 9, 'Ice Scream', 7), -- Halloween Terror Mei Highlight Intros
  (1, 7, 3, 10, 'Battle Angel', 1), -- Normal Mercy Highlight Intros
  (1, 7, 3, 10, 'Guardian Angel', 1),
  (1, 7, 3, 10, 'Heroes Never Die', 1),
  (1, 7, 3, 11, 'Barrage', 1), -- Normal Pharah Highlight Intros
  (1, 7, 3, 11, 'Mission Complete', 1),
  (1, 7, 3, 11, 'Touchdown', 1),
  (1, 7, 3, 12, 'Death Blossom', 1), -- Normal Reaper Highlight Intros
  (1, 7, 3, 12, 'Executioner', 1),
  (1, 7, 3, 12, 'Shadow Step', 1),
  (7, 7, 3, 12, 'Eternal Rest', 7), -- Halloween Terror Reaper Highlight Intros
  (1, 7, 3, 13, 'Charge', 1), -- Normal Reinhardt Highlight Intros
  (1, 7, 3, 13, 'Hammer Down', 1),
  (1, 7, 3, 13, 'More Stretching Required', 1),
  (1, 7, 3, 14, 'Little Piggy', 1), -- Normal Roadhog Highlight Intros
  (1, 7, 3, 14, 'Say "Cheese"', 1),
  (1, 7, 3, 14, 'Whole Hog', 1),
  (1, 7, 3, 15, 'Helix', 1), -- Normal Soldier: 76 Highlight Intros
  (1, 7, 3, 15, 'Looking At You', 1),
  (1, 7, 3, 15, 'Target Rich Environment', 1),
  (1, 7, 3, 16, 'Askew', 1), -- Normal Symmetra Highlight Intros
  (1, 7, 3, 16, 'Dance', 1),
  (1, 7, 3, 16, 'My Reality', 1),
  (1, 7, 3, 17, 'In Your Face', 1), -- Normal Torbjörn Highlight Intros
  (1, 7, 3, 17, 'Refreshing', 1),
  (1, 7, 3, 17, 'Ride ''Em', 1),
  (1, 7, 3, 18, 'Backflip', 1), -- Normal Tracer Highlight Intros
  (1, 7, 3, 18, 'Just In Time', 1),
  (1, 7, 3, 18, 'Serious Business', 1),
  (6, 7, 3, 18, 'Hurdle', 4), -- Summer Games Tracer Highlight Intros
  (1, 7, 3, 19, 'Hanging Around', 1), -- Normal Widowmaker Highlight Intros
  (1, 7, 3, 19, 'I See You...', 1),
  (1, 7, 3, 19, 'Swinging Into Action', 1),
  (1, 7, 3, 20, 'Excuse Me', 1), -- Normal Winston Highlight Intros
  (1, 7, 3, 20, 'Glasses', 1),
  (1, 7, 3, 20, 'Primal Rage', 1),
  (1, 7, 3, 21, 'Deadlift', 1), -- Normal Zarya Highlight Intros
  (1, 7, 3, 21, 'Maximum Charge', 1),
  (1, 7, 3, 21, 'This Is Strength', 1),
  (1, 7, 3, 22, 'Focused', 1), -- Normal Zenyatta Highlight Intros
  (1, 7, 3, 22, 'Harmony And Discord', 1),
  (1, 7, 3, 22, 'Transcendence', 1),
  (1, 7, 3, 23, 'Hacking', 9), -- Normal Sombra Highlight Intros
  (1, 7, 3, 23, 'Pulse', 9),
  (1, 7, 3, 23, 'Undetected', 9),
  -- Weapons
  (5, 8, 5, 1, 'Golden', 3), -- Golden Ana Weapons
  (5, 8, 5, 2, 'Golden', 2), -- Golden Bastion Weapons
  (5, 8, 5, 3, 'Golden', 2), -- Golden D.Va Weapons
  (5, 8, 5, 4, 'Golden', 2), -- Golden Genji Weapons
  (5, 8, 5, 5, 'Golden', 2), -- Golden Hanzo Weapons
  (5, 8, 5, 6, 'Golden', 2), -- Golden Junkrat Weapons
  (5, 8, 5, 7, 'Golden', 2), -- Golden Lúcio Weapons
  (5, 8, 5, 8, 'Golden', 2), -- Golden McCree Weapons
  (5, 8, 5, 9, 'Golden', 2), -- Golden Mei Weapons
  (5, 8, 5, 10, 'Golden', 2), -- Golden Mercy Weapons
  (5, 8, 5, 11, 'Golden', 2), -- Golden Pharah Weapons
  (5, 8, 5, 12, 'Golden', 2), -- Golden Reaper Weapons
  (5, 8, 5, 13, 'Golden', 2), -- Golden Reinhardt Weapons
  (5, 8, 5, 14, 'Golden', 2), -- Golden Roadhog Weapons
  (5, 8, 5, 15, 'Golden', 2), -- Golden Soldier: 76 Weapons
  (5, 8, 5, 16, 'Golden', 2), -- Golden Symmetra Weapons
  (5, 8, 5, 17, 'Golden', 2), -- Golden Torbjörn Weapons
  (5, 8, 5, 18, 'Golden', 2), -- Golden Tracer Weapons
  (5, 8, 5, 19, 'Golden', 2), -- Golden Widowmaker Weapons
  (5, 8, 5, 20, 'Golden', 2), -- Golden Winston Weapons
  (5, 8, 5, 21, 'Golden', 2), -- Golden Zarya Weapons
  (5, 8, 5, 22, 'Golden', 2), -- Golden Zenyatta Weapons
  (5, 8, 5, 23, 'Golden', 9); -- Golden Sombra Weapons

--TODO double check season 2 competitive start date
-- Double check defaults


CREATE TABLE users (
  id       SERIAL,
  username TEXT NOT NULL,
  CONSTRAINT pk_users PRIMARY KEY (id)
);
GRANT SELECT ON TABLE users TO overwatch;

INSERT INTO users (username)
VALUES
  ('Tititesouris'),
  ('Bob'),
  ('Bill');


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
  (1, 11),
  (1, 22),
  (2, 99),
  (2, 22),
  (3, 88),
  (3, 22);


CREATE TABLE settings (
  id          SERIAL,
  name        TEXT UNIQUE NOT NULL,
  description TEXT        NOT NULL,
  "default"   TEXT,
  CONSTRAINT pk_settings PRIMARY KEY (id)
);
GRANT SELECT ON TABLE settings TO overwatch;

INSERT INTO settings (name, description, "default")
VALUES
  ('collection-show-images', 'Show images in the collection', 'true'),
  ('collection-show-colors', 'Show the completion progress with colors in the collection', 'true'),
  ('collection-cosmetics-per-row', 'Number of cosmetics to display per row in the collection', '3'),
  ('collection-show-owned-cosmetics', 'Show owned cosmetics in the collection', 'true'),
  ('collection-show-categories', 'Show cosmetics for every category in the collection', 'true'),
  ('collection-show-category-default', 'Show Default cosmetics in the collection', 'true'),
  ('collection-show-category-normal', 'Show Normal cosmetics in the collection', 'true'),
  ('collection-show-category-achievements', 'Show Achievements cosmetics in the collection', 'true'),
  ('collection-show-category-competitive', 'Show Competitive cosmetics in the collection', 'true'),
  ('collection-show-category-summergames', 'Show Summer Games cosmetics in the collection', 'true'),
  ('collection-show-category-halloweenterror', 'Show Halloween Terror cosmetics in the collection', 'true'),
  ('collection-show-category-blizzard', 'Show Blizzard cosmetics in the collection', 'true'),
  ('collection-show-category-originsedition', 'Show Origins Edition cosmetics in the collection', 'true'),
  ('collection-show-category-preorder', 'Show Preorder cosmetics in the collection', 'true'),
  ('collection-show-category-blizzcon', 'Show BlizzCon cosmetics in the collection', 'true'),
  ('collection-show-heroes', 'Show cosmetics for every hero and All Heroes in the collection', 'true'),
  ('collection-show-hero-allheroes', 'Show cosmetics for All Heroes in the collection', 'true'),
  ('collection-show-hero-ana', 'Show cosmetics for Ana in the collection', 'true'),
  ('collection-show-hero-bastion', 'Show cosmetics for Bastion in the collection', 'true'),
  ('collection-show-hero-dva', 'Show cosmetics for D.Va in the collection', 'true'),
  ('collection-show-hero-genji', 'Show cosmetics for Genji in the collection', 'true'),
  ('collection-show-hero-hanzo', 'Show cosmetics for Hanzo in the collection', 'true'),
  ('collection-show-hero-junkrat', 'Show cosmetics for Junkrat in the collection', 'true'),
  ('collection-show-hero-lucio', 'Show cosmetics for Lúcio in the collection', 'true'),
  ('collection-show-hero-mccree', 'Show cosmetics for McCree in the collection', 'true'),
  ('collection-show-hero-mei', 'Show cosmetics for Mei in the collection', 'true'),
  ('collection-show-hero-mercy', 'Show cosmetics for Mercy in the collection', 'true'),
  ('collection-show-hero-pharah', 'Show cosmetics for Pharah in the collection', 'true'),
  ('collection-show-hero-reaper', 'Show cosmetics for Reaper in the collection', 'true'),
  ('collection-show-hero-reinhardt', 'Show cosmetics for Reinhardt in the collection', 'true'),
  ('collection-show-hero-roadhog', 'Show cosmetics for Roadhog in the collection', 'true'),
  ('collection-show-hero-soldier76', 'Show cosmetics for Soldier: 76 in the collection', 'true'),
  ('collection-show-hero-sombra', 'Show cosmetics for Sombra in the collection', 'true'),
  ('collection-show-hero-symmetra', 'Show cosmetics for Symmetra in the collection', 'true'),
  ('collection-show-hero-torbjorn', 'Show cosmetics for Torbjörn in the collection', 'true'),
  ('collection-show-hero-tracer', 'Show cosmetics for Tracer in the collection', 'true'),
  ('collection-show-hero-widowmaker', 'Show cosmetics for Widowmaker in the collection', 'true'),
  ('collection-show-hero-winston', 'Show cosmetics for Winston in the collection', 'true'),
  ('collection-show-hero-zarya', 'Show cosmetics for Zarya in the collection', 'true'),
  ('collection-show-hero-zenyatta', 'Show cosmetics for Zenyatta in the collection', 'true');

CREATE TABLE user_settings (
  user_id    INTEGER NOT NULL,
  setting_id INTEGER NOT NULL,
  value      TEXT    NOT NULL,
  CONSTRAINT pk_user_settings PRIMARY KEY (user_id, setting_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_setting FOREIGN KEY (setting_id) REFERENCES settings (id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);
GRANT SELECT, INSERT, UPDATE ON TABLE user_settings TO overwatch;