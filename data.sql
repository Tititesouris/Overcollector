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

INSERT INTO categories (id, name, description, price_multiplier, slug)
VALUES
  (1, 'Normal', 'Obtainable by opening normal Loot Boxes or by spending the normal amount of credits.', 1, 'normal'),
  (2, 'Achievements', 'Obtainable by completing achievements.', 0, 'achievements'),
  (3, 'Origins Edition', 'Obtainable by buying the Origins Edition of Overwatch.', 0, 'originsedition'),
  (4, 'Preorder', 'Obtainable by preodering Overwatch.', 0, 'preorder'),
  (5, 'Competitive', 'Obtainable by spending competitive points.', 0, 'competitive'),
  (6, 'Summer Games', 'Obtainable by opening Summer Games Loot Boxes.', 3, 'summergames'),
  (7, 'Halloween Terror',
   'Obtainable by opening Halloween Loot Boxes or by spending 3 times the normal amount of credits during the Halloween Terror event.',
   3, 'halloweenterror'),
  (8, 'BlizzCon', 'Obtainable by purchasing a BlizzCon ticket.', 0, 'blizzcon'),
  (9, 'Blizzard', 'Obtainable by playing other Blizzard games.', 0, 'blizzard');

INSERT INTO types (id, name, slug)
VALUES
  (1, 'Player Icon', 'playericon'),
  (2, 'Skin', 'skin'),
  (3, 'Emote', 'emote'),
  (4, 'Victory Pose', 'victorypose'),
  (5, 'Voice Line', 'voiceline'),
  (6, 'Spray', 'spray'),
  (7, 'Highlight Intro', 'highlightintro'),
  (8, 'Weapon', 'weapon');

INSERT INTO rarities (id, name, base_price)
VALUES
  (1, 'Common', 25),
  (2, 'Rare', 75),
  (3, 'Epic', 250),
  (4, 'Legendary', 1000),
  (5, 'Weapon', 3000);

INSERT INTO events (id, name, start, "end")
VALUES
  (1, 'Overwatch Release', '2016-05-24', NULL),
  (2, 'Competitive Season 1', '2016-06-28', '2016-08-18'),
  (3, 'Ana Patch', '2016-07-19', NULL),
  (4, 'Summer Games 2016', '2016-08-02', '2016-08-23'),
  (5, 'Eichenwalde Patch', '2016-08-23', NULL),
  (6, 'Competitive Season 2', '2016-07-06', '2016-11-22'),
  (7, 'Halloween Terror 2016', '2016-10-11', '2016-11-01'),
  (8, 'Día De Los Muertos 2016', '2016-11-01', NULL),
  (9, 'Sombra Patch', '2016-11-15', NULL),
  (10, 'Competitive Season 3', '2016-12-01', NULL); -- TODO end

INSERT INTO settings (name, description, "default", min, max)
VALUES
  ('collection-show-images', 'Show images in the collection', 'true', NULL, NULL),
  ('collection-show-colors', 'Show the completion progress with colors in the collection', 'true', NULL, NULL),
  ('collection-heroes-per-page', 'Number of heroes to display per page in the collection', '3', '1', '50'),
  ('collection-cosmetics-per-row', 'Number of cosmetics to display per row in the collection', '3', '1', '10'),
  ('collection-show-owned-cosmetics', 'Show owned cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-hero-allheroes', 'Show cosmetics for All Heroes in the collection', 'true', NULL, NULL),
  ('collection-show-hero-ana', 'Show cosmetics for Ana in the collection', 'true', NULL, NULL),
  ('collection-show-hero-bastion', 'Show cosmetics for Bastion in the collection', 'true', NULL, NULL),
  ('collection-show-hero-dva', 'Show cosmetics for D.Va in the collection', 'true', NULL, NULL),
  ('collection-show-hero-genji', 'Show cosmetics for Genji in the collection', 'true', NULL, NULL),
  ('collection-show-hero-hanzo', 'Show cosmetics for Hanzo in the collection', 'true', NULL, NULL),
  ('collection-show-hero-junkrat', 'Show cosmetics for Junkrat in the collection', 'true', NULL, NULL),
  ('collection-show-hero-lucio', 'Show cosmetics for Lúcio in the collection', 'true', NULL, NULL),
  ('collection-show-hero-mccree', 'Show cosmetics for McCree in the collection', 'true', NULL, NULL),
  ('collection-show-hero-mei', 'Show cosmetics for Mei in the collection', 'true', NULL, NULL),
  ('collection-show-hero-mercy', 'Show cosmetics for Mercy in the collection', 'true', NULL, NULL),
  ('collection-show-hero-pharah', 'Show cosmetics for Pharah in the collection', 'true', NULL, NULL),
  ('collection-show-hero-reaper', 'Show cosmetics for Reaper in the collection', 'true', NULL, NULL),
  ('collection-show-hero-reinhardt', 'Show cosmetics for Reinhardt in the collection', 'true', NULL, NULL),
  ('collection-show-hero-roadhog', 'Show cosmetics for Roadhog in the collection', 'true', NULL, NULL),
  ('collection-show-hero-soldier76', 'Show cosmetics for Soldier: 76 in the collection', 'true', NULL, NULL),
  ('collection-show-hero-sombra', 'Show cosmetics for Sombra in the collection', 'true', NULL, NULL),
  ('collection-show-hero-symmetra', 'Show cosmetics for Symmetra in the collection', 'true', NULL, NULL),
  ('collection-show-hero-torbjorn', 'Show cosmetics for Torbjörn in the collection', 'true', NULL, NULL),
  ('collection-show-hero-tracer', 'Show cosmetics for Tracer in the collection', 'true', NULL, NULL),
  ('collection-show-hero-widowmaker', 'Show cosmetics for Widowmaker in the collection', 'true', NULL, NULL),
  ('collection-show-hero-winston', 'Show cosmetics for Winston in the collection', 'true', NULL, NULL),
  ('collection-show-hero-zarya', 'Show cosmetics for Zarya in the collection', 'true', NULL, NULL),
  ('collection-show-hero-zenyatta', 'Show cosmetics for Zenyatta in the collection', 'true', NULL, NULL),
  ('collection-show-category-default', 'Show Default cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-normal', 'Show Normal cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-achievements', 'Show Achievements cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-competitive', 'Show Competitive cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-summergames', 'Show Summer Games cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-halloweenterror', 'Show Halloween Terror cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-blizzard', 'Show Blizzard cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-originsedition', 'Show Origins Edition cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-preorder', 'Show Preorder cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-category-blizzcon', 'Show BlizzCon cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-playericon', 'Show Player Icon cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-skin', 'Show Skin cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-emote', 'Show Emote cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-victorypose', 'Show Victory Pose cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-voiceline', 'Show Voice Line cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-spray', 'Show Spray cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-highlightintro', 'Show Highlight Intro cosmetics in the collection', 'true', NULL, NULL),
  ('collection-show-type-weapon', 'Show Weapon cosmetics in the collection', 'true', NULL, NULL);

INSERT INTO cosmetics (id, category_id, type_id, rarity_id, hero_id, name, event_id)
VALUES
  -- Player Icons
  (1, NULL, 1, NULL, NULL, 'Overwatch Dark', 1), -- Default All Heroes Player Icons
  (2, NULL, 1, NULL, NULL, 'Overwatch Light', 1),
  (3, NULL, 1, NULL, NULL, 'You Are Not Prepared', 3),
  (4, 1, 1, 2, NULL, '16-Bit Hero', 1), -- Normal All Heroes Player Icons
  (5, 1, 1, 2, NULL, 'Anubis', 1),
  (6, 1, 1, 2, NULL, 'Bao', 1),
  (7, 1, 1, 2, NULL, 'Barbarian', 1),
  (8, 1, 1, 2, NULL, 'Capsule', 1),
  (9, 1, 1, 2, NULL, 'Cheers', 1),
  (10, 1, 1, 2, NULL, 'Colossus', 1),
  (11, 1, 1, 2, NULL, 'Credit', 1),
  (12, 1, 1, 2, NULL, 'Crusader', 1),
  (13, 1, 1, 2, NULL, 'Dark Lady', 1),
  (14, 1, 1, 2, NULL, 'Demolition', 1),
  (15, 1, 1, 2, NULL, 'Demon Hunter', 1),
  (16, 1, 1, 2, NULL, 'Dominion', 1),
  (17, 1, 1, 2, NULL, 'Elephant', 1),
  (18, 1, 1, 2, NULL, 'For The Alliance', 1),
  (19, 1, 1, 2, NULL, 'For The Horde', 1),
  (20, 1, 1, 2, NULL, 'From Beyond The Moon', 1),
  (21, 1, 1, 2, NULL, 'Garrosh', 1),
  (22, 1, 1, 2, NULL, 'Happy Squid', 1),
  (23, 1, 1, 2, NULL, 'Hearthstone', 1),
  (24, 1, 1, 2, NULL, 'Hierarch', 1),
  (25, 1, 1, 2, NULL, 'Jaina', 1),
  (26, 1, 1, 2, NULL, 'Jim', 1),
  (27, 1, 1, 2, NULL, 'Kofi Aromo', 1),
  (28, 1, 1, 2, NULL, 'Lich King', 1),
  (29, 1, 1, 2, NULL, 'Loot Box', 1),
  (30, 1, 1, 2, NULL, 'Lord Of Candy', 1),
  (31, 1, 1, 2, NULL, 'Lord Of Terror', 1),
  (32, 1, 1, 2, NULL, 'Los Muertos', 1),
  (33, 1, 1, 2, NULL, 'Mama Pig''s', 1),
  (34, 1, 1, 2, NULL, 'Mariachi', 1),
  (35, 1, 1, 2, NULL, 'Mech', 1),
  (36, 1, 1, 2, NULL, 'Monk', 1),
  (37, 1, 1, 2, NULL, 'Nexus', 1),
  (38, 1, 1, 2, NULL, 'Pachimari', 1),
  (39, 1, 1, 2, NULL, 'Pharaoh', 1),
  (40, 1, 1, 2, NULL, 'Protoss', 1),
  (41, 1, 1, 2, NULL, 'Queen Of Blades', 1),
  (42, 1, 1, 2, NULL, 'Ramen', 1),
  (43, 1, 1, 2, NULL, 'Rhino', 1),
  (44, 1, 1, 2, NULL, 'Rikimaru', 1),
  (45, 1, 1, 2, NULL, 'Route 66', 1),
  (46, 1, 1, 2, NULL, 'Sakura', 1),
  (47, 1, 1, 2, NULL, 'Scooter', 1),
  (48, 1, 1, 2, NULL, 'Siege Mode', 1),
  (49, 1, 1, 2, NULL, 'Six-Gun Killer', 1),
  (50, 1, 1, 2, NULL, 'Svyatogor', 1),
  (51, 1, 1, 2, NULL, 'Terran', 1),
  (52, 1, 1, 2, NULL, 'Totem', 1),
  (53, 1, 1, 2, NULL, 'Training Bot', 1),
  (54, 1, 1, 2, NULL, 'Varian', 1),
  (55, 1, 1, 2, NULL, 'Vivi', 1),
  (56, 1, 1, 2, NULL, 'Witch Doctor', 1),
  (57, 1, 1, 2, NULL, 'Wizard', 1),
  (58, 1, 1, 2, NULL, 'Zerg', 1),
  (59, 5, 1, 2, NULL, 'Season 1 Competitor', 2), -- Competitive All Heroes Player Icons
  (60, 5, 1, 2, NULL, 'Season 1 Hero', 2),
  (61, 5, 1, 2, NULL, 'Season 2 Competitor', 6),
  (62, 5, 1, 2, NULL, 'Season 2 Hero', 6),
  (63, 5, 1, 2, NULL, 'Season 3 Competitor', 10),
  (64, 5, 1, 2, NULL, 'Season 3 Hero', 10),
  (65, 5, 1, 2, NULL, 'Top 500', 2),
  (66, 6, 1, 2, NULL, 'Australia', 4), -- Summer Games All Heroes Player Icons
  (67, 6, 1, 2, NULL, 'Brazil', 4),
  (68, 6, 1, 2, NULL, 'China', 4),
  (69, 6, 1, 2, NULL, 'Egypt', 4),
  (70, 6, 1, 2, NULL, 'France', 4),
  (71, 6, 1, 2, NULL, 'Germany', 4),
  (72, 6, 1, 2, NULL, 'Greece', 4),
  (73, 6, 1, 2, NULL, 'Japan', 4),
  (74, 6, 1, 2, NULL, 'Mexico', 4),
  (75, 6, 1, 2, NULL, 'Nepal', 4),
  (76, 6, 1, 2, NULL, 'Numbani', 4),
  (77, 6, 1, 2, NULL, 'Russia', 4),
  (78, 6, 1, 2, NULL, 'South Korea', 4),
  (79, 6, 1, 2, NULL, 'Summer Games 2016', 4),
  (80, 6, 1, 2, NULL, 'Sweden', 4),
  (81, 6, 1, 2, NULL, 'Switzerland', 4),
  (82, 6, 1, 2, NULL, 'United Kingdom', 4),
  (83, 6, 1, 2, NULL, 'United States Of America', 4),
  (84, 7, 1, 2, NULL, '...Never Die', 7), -- Halloween Terror All Heroes Player Icons
  (85, 7, 1, 2, NULL, 'Bewitching', 7),
  (86, 7, 1, 2, NULL, 'Calavera', 7),
  (87, 7, 1, 2, NULL, 'Candle', 7),
  (88, 7, 1, 2, NULL, 'Eyeball', 7),
  (89, 7, 1, 2, NULL, 'Ghostymari', 7),
  (90, 7, 1, 2, NULL, 'Halloween Terror 2016', 7),
  (91, 7, 1, 2, NULL, 'Spider', 7),
  (92, 7, 1, 2, NULL, 'Superstition', 7),
  (93, 7, 1, 2, NULL, 'Tombstone', 7),
  (94, 7, 1, 2, NULL, 'Vampachimari', 7),
  (95, 7, 1, 2, NULL, 'Witch''s Brew', 7),
  (96, 7, 1, 2, NULL, 'Witch''s Hat', 7),
  (97, 7, 1, 2, NULL, 'Wolf', 7),
  (98, 1, 1, 2, 1, 'Ana', 3), -- Normal Ana Player Icons
  (99, 1, 1, 2, 1, 'Watcher', 3),
  (100, 1, 1, 2, 1, 'Wedjat', 3),
  (101, 6, 1, 2, 1, 'Shooting', 4), -- Summer Games Ana Player Icons
  (102, 1, 1, 2, 2, 'Bastion', 1), -- Normal Bastion Player Icons
  (103, 1, 1, 2, 2, 'Ganymede', 1),
  (104, 1, 1, 2, 2, 'Tank Crossing', 1),
  (105, 6, 1, 2, 2, 'Boxing', 4), -- Summer Games Bastion Player Icons
  (106, 1, 1, 2, 3, 'D.Va', 1), -- Normal D.Va Player Icons
  (107, 1, 1, 2, 3, 'Bunny', 1),
  (108, 1, 1, 2, 3, 'Charm', 1),
  (109, 6, 1, 2, 3, 'Cycling', 4), -- Summer Games D.Va Player Icons
  (110, 1, 1, 2, 4, 'Genji', 1), -- Normal Genji Player Icons
  (111, 1, 1, 2, 4, 'God Of War', 1),
  (112, 1, 1, 2, 4, 'Nin', 1),
  (113, 6, 1, 2, 4, 'Fencing', 4), -- Summer Games Genji Player Icons
  (114, 9, 1, 2, 4, 'Oni', 9), -- Blizzard Genji Player Icons
  (115, 1, 1, 2, 5, 'Hanzo', 1), -- Normal Hanzo Player Icons
  (116, 1, 1, 2, 5, 'Shimada', 1),
  (117, 1, 1, 2, 5, 'Storm', 1),
  (118, 6, 1, 2, 5, 'Archery', 4), -- Summer Games Hanzo Player Icons
  (119, 1, 1, 2, 6, 'Ahhhh!', 1), -- Normal Junkrat Player Icons
  (120, 1, 1, 2, 6, 'Have A Nice Day!', 1),
  (121, 1, 1, 2, 6, 'Junkrat', 1),
  (122, 6, 1, 2, 6, 'Tennis', 4), -- Summer Games Junkrat Player Icons
  (123, 7, 1, 2, 6, 'The Doctor', 7), -- Halloween Terror Junkrat Player Icons
  (124, 1, 1, 2, 7, 'Frog', 1), -- Normal Lúcio Player Icons
  (125, 1, 1, 2, 7, 'Kambô', 1),
  (126, 1, 1, 2, 7, 'Lúcio', 1),
  (127, 6, 1, 2, 7, 'Football', 4), -- Summer Games Lúcio Player Icons
  (128, 1, 1, 2, 8, 'Badge', 1), -- Normal McCree Player Icons
  (129, 1, 1, 2, 8, 'Deadeye', 1),
  (130, 1, 1, 2, 8, 'McCree', 1),
  (131, 6, 1, 2, 8, 'Equestrian', 4), -- Summer Games McCree Player Icons
  (132, 1, 1, 2, 9, 'Hairpin', 1), -- Normal Mei Player Icons
  (133, 1, 1, 2, 9, 'Mei', 1),
  (134, 1, 1, 2, 9, 'Snowball', 1),
  (135, 6, 1, 2, 9, 'Table Tennis', 4), -- Summer Games Mei Player Icons
  (136, 1, 1, 2, 10, 'Guardian Angel', 1), -- Normal Mercy Player Icons
  (137, 1, 1, 2, 10, 'Mercy', 1),
  (138, 1, 1, 2, 10, 'Valkyrie', 1),
  (139, 6, 1, 2, 10, 'Badminton', 4), -- Summer Games Mercy Player Icons
  (140, 7, 1, 2, 10, 'The Witch', 7), -- Halloween Terror Mercy Player Icons
  (141, 1, 1, 2, 11, 'Pharah', 1), -- Normal Pharah Player Icons
  (142, 1, 1, 2, 11, 'Raptora', 1),
  (143, 1, 1, 2, 11, 'Wadjet', 1),
  (144, 6, 1, 2, 11, 'Basketball', 4), -- Summer Games Pharah Player Icons
  (145, 1, 1, 2, 12, 'Emblem', 1), -- Normal Reaper Player Icons
  (146, 1, 1, 2, 12, 'Reaper', 1),
  (147, 1, 1, 2, 12, 'Soul Globe', 1),
  (148, 6, 1, 2, 12, 'BMX', 4), -- Summer Games Reaper Player Icons
  (149, 7, 1, 2, 12, 'The Reaper', 7), -- Halloween Terror Reaper Player Icons
  (150, 1, 1, 2, 13, 'Lionhardt', 1), -- Normal Reinhardt Player Icons
  (151, 1, 1, 2, 13, 'Reinhardt', 1),
  (152, 1, 1, 2, 13, 'Scar', 1),
  (153, 6, 1, 2, 13, 'Wrestling', 4), -- Summer Games Reinhardt Player Icons
  (154, 1, 1, 2, 14, 'Hook', 1), -- Normal Roadhog Player Icons
  (155, 1, 1, 2, 14, 'Piggy', 1),
  (156, 1, 1, 2, 14, 'Roadhog', 1),
  (157, 6, 1, 2, 14, 'Diving', 4), -- Summer Games Roadhog Player Icons
  (158, 7, 1, 2, 14, 'The Monster', 7), -- Halloween Terror Roadhog Player Icons
  (159, 1, 1, 2, 15, '76', 1), -- Normal Soldier: 76 Player Icons
  (160, 1, 1, 2, 15, 'Soldier: 76', 1),
  (161, 1, 1, 2, 15, 'Strike-Commander', 1),
  (162, 6, 1, 2, 15, 'Golf', 4), -- Summer Games Soldier: 76 Player Icons
  (163, 1, 1, 2, 16, 'Sentry', 1), -- Normal Symmetra Player Icons
  (164, 1, 1, 2, 16, 'Symmetra', 1),
  (165, 1, 1, 2, 16, 'Vishkar', 1),
  (166, 6, 1, 2, 16, 'Rythmic Gymnastics', 4), -- Summer Games Symmetra Player Icons
  (167, 1, 1, 2, 17, 'Forge', 1), -- Normal Torbjörn Player Icons
  (168, 1, 1, 2, 17, 'Gears', 1),
  (169, 1, 1, 2, 17, 'Torbjörn', 1),
  (170, 6, 1, 2, 17, 'Water Polo', 4), -- Summer Games Torbjörn Player Icons
  (171, 1, 1, 2, 18, 'Patch', 1), -- Normal Tracer Player Icons
  (172, 1, 1, 2, 18, 'Pulse Bomb', 1),
  (173, 1, 1, 2, 18, 'Tracer', 1),
  (174, 6, 1, 2, 18, 'Track', 4), -- Summer Games Tracer Player Icons
  (175, 1, 1, 2, 19, 'Baiser', 1), -- Normal Widowmaker Player Icons
  (176, 1, 1, 2, 19, 'Grappling Hook', 1),
  (177, 1, 1, 2, 19, 'Widowmaker', 1),
  (178, 6, 1, 2, 19, 'Gymnastics', 4), -- Summer Games Widowmaker Player Icons
  (179, 1, 1, 2, 20, 'Lunar Ops', 1), -- Normal Winston Player Icons
  (180, 1, 1, 2, 20, 'Peanut Butter', 1),
  (181, 1, 1, 2, 20, 'Winston', 1),
  (182, 6, 1, 2, 20, 'Volleyball', 4), -- Summer Games Winston Player Icons
  (183, 1, 1, 2, 21, '512', 1), -- Normal Zarya Player Icons
  (184, 1, 1, 2, 21, 'Particle Barrier', 1),
  (185, 1, 1, 2, 21, 'Zarya', 1),
  (186, 6, 1, 2, 21, 'Weightlifting', 4), -- Summer Games Zarya Player Icons
  (187, 1, 1, 2, 22, 'Harmony', 1), -- Normal Zenyatta Player Icons
  (188, 1, 1, 2, 22, 'Meditation', 1),
  (189, 1, 1, 2, 22, 'Zenyatta', 1),
  (190, 6, 1, 2, 22, 'Taekwondo', 4), -- Summer Games Zenyatta Player Icons
  (191, 1, 1, 2, 23, 'Hacker', 9), -- Normal Sombra Player Icons
  (192, 1, 1, 2, 23, 'Skull', 9),
  (193, 1, 1, 2, 23, 'Sombra', 9),
  (194, NULL, 2, NULL, 1, 'Classic', 3), -- Default Ana Skins
  (195, 1, 2, 2, 1, 'Citrine', 3), -- Normal Ana Skins
  (196, 1, 2, 2, 1, 'Garnet', 3),
  (197, 1, 2, 2, 1, 'Peridot', 3),
  (198, 1, 2, 2, 1, 'Turquoise', 3),
  (199, 1, 2, 3, 1, 'Merciful', 3),
  (200, 1, 2, 3, 1, 'Shrike', 3),
  (201, 1, 2, 4, 1, 'Wadjet', 3),
  (202, 1, 2, 4, 1, 'Wasteland', 3),
  (203, 1, 2, 4, 1, 'Captain Amari', 3),
  (204, 1, 2, 4, 1, 'Horus', 3),
  (205, 7, 2, 3, 1, 'Ghoul', 7), -- Halloween Terror Ana Skins
  (206, NULL, 2, NULL, 2, 'Classic', 1), -- Default Bastion Skins
  (207, 1, 2, 2, 2, 'Dawn', 1), -- Normal Bastion Skins
  (208, 1, 2, 2, 2, 'Meadow', 1),
  (209, 1, 2, 2, 2, 'Sky', 1),
  (210, 1, 2, 2, 2, 'Soot', 1),
  (211, 1, 2, 3, 2, 'Defense Matrix', 1),
  (212, 1, 2, 3, 2, 'Omnic Crisis', 1),
  (213, 1, 2, 4, 2, 'Antique', 1),
  (214, 1, 2, 4, 2, 'Gearbot', 1),
  (215, 1, 2, 4, 2, 'Steambot', 1),
  (216, 1, 2, 4, 2, 'Woodbot', 1),
  (217, 3, 2, 4, 2, 'Overgrown', 1), -- Origins Edition Bastion Skins
  (218, 7, 2, 3, 2, 'Tombstone', 7), -- Halloween Terror Bastion Skins
  (219, 8, 2, 3, 2, 'BlizzCon 2016', 7), -- BlizzCon Bastion Skins
  (220, NULL, 2, NULL, 3, 'Classic', 1), -- Default D.Va Skins
  (221, 1, 2, 2, 3, 'Blueberry', 1), -- Normal D.Va Skins
  (222, 1, 2, 2, 3, 'Lemon-Lime', 1),
  (223, 1, 2, 2, 3, 'Tangerine', 1),
  (224, 1, 2, 2, 3, 'Watermelon', 1),
  (225, 1, 2, 3, 3, 'Carbon Fiber', 1),
  (226, 1, 2, 3, 3, 'White Rabbit', 1),
  (227, 1, 2, 4, 3, 'B.Va', 1),
  (228, 1, 2, 4, 3, 'Junebug', 1),
  (229, 1, 2, 4, 3, 'Junker', 1),
  (230, 1, 2, 4, 3, 'Scavenger', 1),
  (231, 6, 2, 3, 3, 'Taegeukgi', 4), -- Summer Games D.Va Skins
  (232, NULL, 2, NULL, 4, 'Classic', 1), -- Default Genji Skins
  (233, 1, 2, 2, 4, 'Azurite', 1), -- Normal Genji Skins
  (234, 1, 2, 2, 4, 'Cinnabar', 1),
  (235, 1, 2, 2, 4, 'Malachite', 1),
  (236, 1, 2, 2, 4, 'Ochre', 1),
  (237, 1, 2, 3, 4, 'Carbon Fiber', 1),
  (238, 1, 2, 3, 4, 'Chrome', 1),
  (239, 1, 2, 4, 4, 'Bedouin', 1),
  (240, 1, 2, 4, 4, 'Nomad', 1),
  (241, 1, 2, 4, 4, 'Sparrow', 1),
  (242, 1, 2, 4, 4, 'Young Genji', 1),
  (243, 6, 2, 3, 4, 'Nihon', 4), -- Summer Games Genji Skins
  (244, 9, 2, 4, 4, 'Oni', 9), -- Blizzard Genji Skins
  (245, NULL, 2, NULL, 5, 'Classic', 1), -- Default Hanzo Skins
  (246, 1, 2, 2, 5, 'Azuki', 1), -- Normal Hanzo Skins
  (247, 1, 2, 2, 5, 'Kinoko', 1),
  (248, 1, 2, 2, 5, 'Midori', 1),
  (249, 1, 2, 2, 5, 'Sora', 1),
  (250, 1, 2, 3, 5, 'Cloud', 1),
  (251, 1, 2, 3, 5, 'Dragon', 1),
  (252, 1, 2, 4, 5, 'Lone Wolf', 1),
  (253, 1, 2, 4, 5, 'Okami', 1),
  (254, 1, 2, 4, 5, 'Young Hanzo', 1),
  (255, 1, 2, 4, 5, 'Young Master', 1),
  (256, 6, 2, 3, 5, 'Demon', 4), -- Summer Games Hanzo Skins
  (257, NULL, 2, NULL, 6, 'Classic', 1), -- Default Junkrat Skins
  (258, 1, 2, 2, 6, 'Bleached', 1), -- Normal Junkrat Skins
  (259, 1, 2, 2, 6, 'Drowned', 1),
  (260, 1, 2, 2, 6, 'Irradiated', 1),
  (261, 1, 2, 2, 6, 'Rusted', 1),
  (262, 1, 2, 3, 6, 'Jailbird', 1),
  (263, 1, 2, 3, 6, 'Toasted', 1),
  (264, 1, 2, 4, 6, 'Fool', 1),
  (265, 1, 2, 4, 6, 'Hayseed', 1),
  (266, 1, 2, 4, 6, 'Jester', 1),
  (267, 1, 2, 4, 6, 'Scarecrow', 1),
  (268, 7, 2, 4, 6, 'Dr. Junkenstein', 7), -- Halloween Terror Junkrat Skins
  (269, NULL, 2, NULL, 7, 'Classic', 1), -- Default Lúcio Skins
  (270, 1, 2, 2, 7, 'Azul', 1), -- Normal Lúcio Skins
  (271, 1, 2, 2, 7, 'Laranja', 1),
  (272, 1, 2, 2, 7, 'Roxo', 1),
  (273, 1, 2, 2, 7, 'Vermelho', 1),
  (274, 1, 2, 3, 7, 'Auditiva', 1),
  (275, 1, 2, 3, 7, 'Synaesthesia', 1),
  (276, 1, 2, 4, 7, 'Breakaway', 1),
  (277, 1, 2, 4, 7, 'Hippityhop', 1),
  (278, 1, 2, 4, 7, 'Ribbit', 1),
  (279, 1, 2, 4, 7, 'Slapshot', 1),
  (280, 6, 2, 4, 7, 'Seleção', 4), -- Summer Games Lúcio Skins
  (281, 6, 2, 4, 7, 'Striker', 4),
  (282, NULL, 2, NULL, 8, 'Classic', 1), -- Default McCree Skins
  (283, 1, 2, 2, 8, 'Ebony', 1), -- Normal McCree Skins
  (284, 1, 2, 2, 8, 'Lake', 1),
  (285, 1, 2, 2, 8, 'Sage', 1),
  (286, 1, 2, 2, 8, 'Wheat', 1),
  (287, 1, 2, 3, 8, 'On The Range', 1),
  (288, 1, 2, 3, 8, 'White Hat', 1),
  (289, 1, 2, 4, 8, 'Gambler', 1),
  (290, 1, 2, 4, 8, 'Mystery Man', 1),
  (291, 1, 2, 4, 8, 'Riverboat', 1),
  (292, 1, 2, 4, 8, 'Vigilante', 1),
  (293, 6, 2, 3, 8, 'American', 4), -- Summer Games McCree Skins
  (294, NULL, 2, NULL, 9, 'Classic', 1), -- Default Mei Skins
  (295, 1, 2, 2, 9, 'Chrysanthemum', 1), -- Normal Mei Skins
  (296, 1, 2, 2, 9, 'Heliotrope', 1),
  (297, 1, 2, 2, 9, 'Jade', 1),
  (298, 1, 2, 2, 9, 'Persimmon', 1),
  (299, 1, 2, 3, 9, 'Earthen', 1),
  (300, 1, 2, 3, 9, 'Snow Plum', 1),
  (301, 1, 2, 4, 9, 'Abominable', 1),
  (302, 1, 2, 4, 9, 'Firefighter', 1),
  (303, 1, 2, 4, 9, 'Rescue Mei', 1),
  (304, 1, 2, 4, 9, 'Yeti Hunter', 1),
  (305, NULL, 2, NULL, 10, 'Classic', 1), -- Default Mercy Skins
  (306, 1, 2, 2, 10, 'Celestial', 1), -- Normal Mercy Skins
  (307, 1, 2, 2, 10, 'Mist', 1),
  (308, 1, 2, 2, 10, 'Orchid', 1),
  (309, 1, 2, 2, 10, 'Verdant', 1),
  (310, 1, 2, 3, 10, 'Amber', 1),
  (311, 1, 2, 3, 10, 'Cobalt', 1),
  (312, 1, 2, 4, 10, 'Devil', 1),
  (313, 1, 2, 4, 10, 'Imp', 1),
  (314, 1, 2, 4, 10, 'Sigrún', 1),
  (315, 1, 2, 4, 10, 'Valkyrie', 1),
  (316, 6, 2, 3, 10, 'Eidgenossin', 4), -- Summer Games Mercy Skins
  (317, 7, 2, 4, 10, 'Witch', 7), -- Halloween Terror Mercy Skins
  (318, NULL, 2, NULL, 11, 'Classic', 1), -- Default Pharah Skins
  (319, 1, 2, 2, 11, 'Amethyst', 1), -- Normal Pharah Skins
  (320, 1, 2, 2, 11, 'Copper', 1),
  (321, 1, 2, 2, 11, 'Emerald', 1),
  (322, 1, 2, 2, 11, 'Titanium', 1),
  (323, 1, 2, 3, 11, 'Anubis', 1),
  (324, 1, 2, 3, 11, 'Jackal', 1),
  (325, 1, 2, 4, 11, 'Mechaqueen', 1),
  (326, 1, 2, 4, 11, 'Raindancer', 1),
  (327, 1, 2, 4, 11, 'Raptorion', 1),
  (328, 1, 2, 4, 11, 'Thunderbird', 1),
  (329, 3, 2, 4, 11, 'Security Chief', 1), -- Origins Edition Pharah Skins
  (330, 6, 2, 3, 11, 'Possessed', 7), -- Halloween Terror Pharah Skins
  (331, NULL, 2, NULL, 12, 'Classic', 1), -- Default Reaper Skins
  (332, 1, 2, 2, 12, 'Blood', 1), -- Normal Reaper Skins
  (333, 1, 2, 2, 12, 'Midnight', 1),
  (334, 1, 2, 2, 12, 'Moss', 1),
  (335, 1, 2, 2, 12, 'Royal', 1),
  (336, 1, 2, 3, 12, 'Desert', 1),
  (337, 1, 2, 3, 12, 'Wight', 1),
  (338, 1, 2, 4, 12, 'El Blanco', 1),
  (339, 1, 2, 4, 12, 'Mariachi', 1),
  (340, 1, 2, 4, 12, 'Nevermore', 1),
  (341, 1, 2, 4, 12, 'Plague Doctor', 1),
  (342, 3, 2, 4, 12, 'Blackwatch Reyes', 1), -- Origins Edition Reaper Skins
  (343, 7, 2, 4, 12, 'Pumpkin', 7), -- Halloween Terror Reaper Skins
  (344, NULL, 2, NULL, 13, 'Classic', 1), -- Default Reinhardt Skins
  (345, 1, 2, 2, 13, 'Brass', 1), -- Normal Reinhardt Skins
  (346, 1, 2, 2, 13, 'Cobalt', 1),
  (347, 1, 2, 2, 13, 'Copper', 1),
  (348, 1, 2, 2, 13, 'Viridian', 1),
  (349, 1, 2, 3, 13, 'Bundeswehr', 1),
  (350, 1, 2, 3, 13, 'Paragon', 1),
  (351, 1, 2, 4, 13, 'Balderich', 5),
  (352, 1, 2, 4, 13, 'Blackhardt', 1),
  (353, 1, 2, 4, 13, 'Bloodhardt', 1),
  (354, 1, 2, 4, 13, 'Griefhardt', 5),
  (355, 1, 2, 4, 13, 'Lionhardt', 1),
  (356, 1, 2, 4, 13, 'Stonehardt', 1),
  (357, 7, 2, 3, 13, 'Coldhardt', 7), -- Halloween Terror Reinhardt Skins
  (358, NULL, 2, NULL, 14, 'Classic', 1), -- Default Roadhog Skins
  (359, 1, 2, 2, 14, 'Kiwi', 1), -- Normal Roadhog Skins
  (360, 1, 2, 2, 14, 'Mud', 1),
  (361, 1, 2, 2, 14, 'Sand', 1),
  (362, 1, 2, 2, 14, 'Thistle', 1),
  (363, 1, 2, 3, 14, 'Pigpen', 1),
  (364, 1, 2, 3, 14, 'Stitched', 1),
  (365, 1, 2, 4, 14, 'Islander', 1),
  (366, 1, 2, 4, 14, 'Mako', 1),
  (367, 1, 2, 4, 14, 'Sharkbait', 1),
  (368, 1, 2, 4, 14, 'Toa', 1),
  (369, 7, 2, 4, 14, 'Junkenstein''s Monster', 7), -- Halloween Terror Roadhog Skins
  (370, NULL, 2, NULL, 15, 'Classic', 1), -- Default Soldier: 76 Skins
  (371, 1, 2, 2, 15, 'Jet', 1), -- Normal Soldier: 76 Skins
  (372, 1, 2, 2, 15, 'Olive', 1),
  (373, 1, 2, 2, 15, 'Russet', 1),
  (374, 1, 2, 2, 15, 'Smoke', 1),
  (375, 1, 2, 3, 15, 'Bone', 1),
  (376, 1, 2, 3, 15, 'Golden', 1),
  (377, 1, 2, 4, 15, 'Commando: 76', 1),
  (378, 1, 2, 4, 15, 'Daredevil: 76', 1),
  (379, 1, 2, 4, 15, 'Night Ops: 76', 1),
  (380, 1, 2, 4, 15, 'Stunt Rider: 76', 1),
  (381, 3, 2, 4, 15, 'Strike-Commander Morrison', 1), -- Origins Edition Soldier: 76 Skins
  (382, 7, 2, 3, 15, 'Immortal', 7), -- Halloween Terror Soldier: 76 Skins
  (383, NULL, 2, NULL, 16, 'Classic', 1), -- Default Symmetra Skins
  (384, 1, 2, 2, 16, 'Cardamom', 1), -- Normal Symmetra Skins
  (385, 1, 2, 2, 16, 'Hyacinth', 1),
  (386, 1, 2, 2, 16, 'Saffron', 1),
  (387, 1, 2, 2, 16, 'Technomancer', 1),
  (388, 1, 2, 3, 16, 'Regal', 1),
  (389, 1, 2, 3, 16, 'Utopaea', 1),
  (390, 1, 2, 4, 16, 'Architech', 1),
  (391, 1, 2, 4, 16, 'Devi', 1),
  (392, 1, 2, 4, 16, 'Goddess', 1),
  (393, 1, 2, 4, 16, 'Vishkar', 1),
  (394, 7, 2, 3, 16, 'Vampire', 7), -- Halloween Terror Symmetra Skins
  (395, NULL, 2, NULL, 17, 'Classic', 1), -- Default Torbjörn Skins
  (396, 1, 2, 2, 17, 'Blå', 1), -- Normal Torbjörn Skins
  (397, 1, 2, 2, 17, 'Citron', 1),
  (398, 1, 2, 2, 17, 'Grön', 1),
  (399, 1, 2, 2, 17, 'Plommon', 1),
  (400, 1, 2, 3, 17, 'Cathode', 1),
  (401, 1, 2, 3, 17, 'Woodclad', 1),
  (402, 1, 2, 4, 17, 'Barbarossa', 1),
  (403, 1, 2, 4, 17, 'Blackbeard', 1),
  (404, 1, 2, 4, 17, 'Chopper', 1),
  (405, 1, 2, 4, 17, 'Deadlock', 1),
  (406, 6, 2, 3, 17, 'Tre Kronor', 4), -- Summer Games Torbjörn Skins
  (407, NULL, 2, NULL, 18, 'Classic', 1), -- Default Tracer Skins
  (408, 1, 2, 2, 18, 'Electric Purple', 1), -- Normal Tracer Skins
  (409, 1, 2, 2, 18, 'Hot Pink', 1),
  (410, 1, 2, 2, 18, 'Neon Green', 1),
  (411, 1, 2, 2, 18, 'Royal Blue', 1),
  (412, 1, 2, 3, 18, 'Posh', 1),
  (413, 1, 2, 3, 18, 'Sporty', 1),
  (414, 1, 2, 4, 18, 'Mach T', 1),
  (415, 1, 2, 4, 18, 'Punk', 1),
  (416, 1, 2, 4, 18, 'T. Racer', 1),
  (417, 1, 2, 4, 18, 'Ultraviolet', 1),
  (418, 3, 2, 4, 18, 'Slipstream', 1), -- Origins Edition Tracer Skins
  (419, 6, 2, 4, 18, 'Sprinter', 4), -- Summer Games Tracer Skins
  (420, 6, 2, 4, 18, 'Track And Field', 4),
  (421, NULL, 2, NULL, 19, 'Classic', 1), -- Default Widowmaker Skins
  (422, 1, 2, 2, 19, 'Ciel', 1), -- Normal Widowmaker Skins
  (423, 1, 2, 2, 19, 'Nuit', 1),
  (424, 1, 2, 2, 19, 'Rose', 1),
  (425, 1, 2, 2, 19, 'Vert', 1),
  (426, 1, 2, 3, 19, 'Patina', 1),
  (427, 1, 2, 3, 19, 'Winter', 1),
  (428, 1, 2, 4, 19, 'Comptesse', 1),
  (429, 1, 2, 4, 19, 'Huntress', 1),
  (430, 1, 2, 4, 19, 'Odette', 1),
  (431, 1, 2, 4, 19, 'Odile', 1),
  (432, 4, 2, 4, 19, 'Noire', 1), -- Preorder Widowmaker Skins
  (433, 6, 2, 3, 19, 'Tricolore', 4), -- Summer Games Widowmaker Skins
  (434, NULL, 2, NULL, 20, 'Classic', 1), -- Default Winston Skins
  (435, 1, 2, 2, 20, 'Atmosphere', 1), -- Normal Winston Skins
  (436, 1, 2, 2, 20, 'Banana', 1),
  (437, 1, 2, 2, 20, 'Forest', 1),
  (438, 1, 2, 2, 20, 'Red Planet', 1),
  (439, 1, 2, 3, 20, 'Desert', 1),
  (440, 1, 2, 3, 20, 'Horizon', 1),
  (441, 1, 2, 4, 20, 'Explorer', 1),
  (442, 1, 2, 4, 20, 'Frogston', 1),
  (443, 1, 2, 4, 20, 'Safari', 1),
  (444, 1, 2, 4, 20, 'Undersea', 1),
  (445, NULL, 2, NULL, 21, 'Classic', 1), -- Default Zarya Skins
  (446, 1, 2, 2, 21, 'Brick', 1), -- Normal Zarya Skins
  (447, 1, 2, 2, 21, 'Goldenrod', 1),
  (448, 1, 2, 2, 21, 'Taiga', 1),
  (449, 1, 2, 2, 21, 'Violet', 1),
  (450, 1, 2, 3, 21, 'Dawn', 1),
  (451, 1, 2, 3, 21, 'Midnight', 1),
  (452, 1, 2, 4, 21, 'Arctic', 1),
  (453, 1, 2, 4, 21, 'Cybergoth', 1),
  (454, 1, 2, 4, 21, 'Industrial', 1),
  (455, 1, 2, 4, 21, 'Siberian Front', 1),
  (456, 6, 2, 4, 21, 'Champion', 4), -- Summer Games Zarya Skins
  (457, 6, 2, 4, 21, 'Weightlifter', 4),
  (458, NULL, 2, NULL, 22, 'Classic', 1), -- Default Zenyatta Skins
  (459, 1, 2, 2, 22, 'Air', 1), -- Normal Zenyatta Skins
  (460, 1, 2, 2, 22, 'Earth', 1),
  (461, 1, 2, 2, 22, 'Leaf', 1),
  (462, 1, 2, 2, 22, 'Water', 1),
  (463, 1, 2, 3, 22, 'Ascendant', 1),
  (464, 1, 2, 3, 22, 'Harmonious', 1),
  (465, 1, 2, 4, 22, 'Djinnyatta', 1),
  (466, 1, 2, 4, 22, 'Ifrit', 1),
  (467, 1, 2, 4, 22, 'Ra', 1),
  (468, 1, 2, 4, 22, 'Sunyatta', 1),
  (469, 7, 2, 3, 22, 'Skullyatta', 7), -- Halloween Terror Zenyatta Skins
  (470, NULL, 2, NULL, 23, 'Classic', 9), -- Default Sombra Skins
  (471, 1, 2, 2, 23, 'Cidro', 9), -- Normal Sombra Skins
  (472, 1, 2, 2, 23, 'Incendio', 9),
  (473, 1, 2, 2, 23, 'Mar', 9),
  (474, 1, 2, 2, 23, 'Noche', 9),
  (475, 1, 2, 3, 23, 'Azúcar', 9),
  (476, 1, 2, 3, 23, 'Glitch', 9),
  (477, 1, 2, 4, 23, 'Virus', 9),
  (478, 1, 2, 4, 23, 'Augmented', 9),
  (479, 1, 2, 4, 23, 'Cyberspace', 9),
  (480, 1, 2, 4, 23, 'Los Muertos', 9),
  (481, NULL, 3, NULL, 1, 'Heroic', 3), -- Default Ana Emotes
  (482, 1, 3, 3, 1, 'Disapproving', 3), -- Normal Ana Emotes
  (483, 1, 3, 3, 1, 'Not Impressed', 5),
  (484, 1, 3, 3, 1, 'Protector', 3),
  (485, 1, 3, 3, 1, 'Take A Knee', 5),
  (486, 1, 3, 3, 1, 'Tea Time', 3),
  (487, 7, 3, 3, 1, 'Candy', 7), -- Halloween Terror Ana Emotes
  (488, NULL, 3, NULL, 2, 'Heroic', 1), -- Default Bastion Emotes
  (489, 1, 3, 3, 2, 'Alert! Alert!', 1), -- Normal Bastion Emotes
  (490, 1, 3, 3, 2, 'Chortle', 5),
  (491, 1, 3, 3, 2, 'Dizzy', 1),
  (492, 1, 3, 3, 2, 'Robot', 1),
  (493, 1, 3, 3, 2, 'Rest Mode', 5),
  (494, 6, 3, 3, 2, 'Boxing', 4), -- Summer Games Bastion Emotes
  (495, NULL, 3, NULL, 3, 'Heroic', 1), -- Default D.Va Emotes
  (496, 1, 3, 3, 3, '^O^', 5), -- Normal D.Va Emotes
  (497, 1, 3, 3, 3, 'Bunny Hop', 1),
  (498, 1, 3, 3, 3, 'Heartbreaker', 1),
  (499, 1, 3, 3, 3, 'Party Time', 1),
  (500, 1, 3, 4, 3, 'Game On', 5),
  (501, NULL, 3, NULL, 4, 'Heroic', 1), -- Default Genji Emotes
  (502, 1, 3, 3, 4, 'Amusing', 5), -- Normal Genji Emotes
  (503, 1, 3, 3, 4, 'Challenge', 1),
  (504, 1, 3, 3, 4, 'Cutting Edge', 1),
  (505, 1, 3, 3, 4, 'Meditate', 5),
  (506, 1, 3, 3, 4, 'Salute', 1),
  (507, NULL, 3, NULL, 5, 'Heroic', 1), -- Default Hanzo Emotes
  (508, 1, 3, 3, 5, 'Beckon', 1), -- Normal Hanzo Emotes
  (509, 1, 3, 3, 5, 'Brush Shoulder', 1),
  (510, 1, 3, 3, 5, 'Chuckle', 5),
  (511, 1, 3, 3, 5, 'Meditate', 5),
  (512, 1, 3, 3, 5, 'Victory', 1),
  (513, NULL, 3, NULL, 6, 'Heroic', 1), -- Default Junkrat Emotes
  (514, 1, 3, 3, 6, 'Can''t Deal', 5), -- Normal Junkrat Emotes
  (515, 1, 3, 3, 6, 'Juggling', 1),
  (516, 1, 3, 3, 6, 'Lounging', 5),
  (517, 1, 3, 3, 6, 'Puppet', 1),
  (518, 1, 3, 3, 6, 'Vaudeville', 1),
  (519, NULL, 3, NULL, 7, 'Heroic', 1), -- Default Lúcio Emotes
  (520, 1, 3, 3, 7, 'Capoeira', 1), -- Normal Lúcio Emotes
  (521, 1, 3, 3, 7, 'Chilling', 5),
  (522, 1, 3, 3, 7, 'In The Groove', 1),
  (523, 1, 3, 3, 7, 'Knee Slapper', 5),
  (524, 1, 3, 3, 7, 'Nah!', 1),
  (525, 6, 3, 3, 7, 'Juggle', 4), -- Summer Games Lúcio Emotes
  (526, NULL, 3, NULL, 8, 'Heroic', 1), -- Default McCree Emotes
  (527, 1, 3, 3, 8, 'Gunspinning', 1), -- Normal McCree Emotes
  (528, 1, 3, 3, 8, 'Hat Tip', 1),
  (529, 1, 3, 3, 8, 'Joker', 5),
  (530, 1, 3, 3, 8, 'Spit', 1),
  (531, 1, 3, 3, 8, 'Take A Load Off', 5),
  (532, NULL, 3, NULL, 9, 'Heroic', 1), -- Default Mei Emotes
  (533, 1, 3, 3, 9, 'Companion', 1), -- Normal Mei Emotes
  (534, 1, 3, 3, 9, 'Giggle', 5),
  (535, 1, 3, 3, 9, 'Kneel', 5),
  (536, 1, 3, 3, 9, 'Spray', 1),
  (537, 1, 3, 3, 9, 'Yaaaaaaaaay!', 1),
  (538, NULL, 3, NULL, 10, 'Heroic', 1), -- Default Mercy Emotes
  (539, 1, 3, 3, 10, 'Applause', 1), -- Normal Mercy Emotes
  (540, 1, 3, 3, 10, 'Caduceus', 1),
  (541, 1, 3, 3, 10, 'No Pulse', 1),
  (542, 1, 3, 3, 10, 'Relax', 5),
  (543, 1, 3, 3, 10, 'The Best Medicine', 5),
  (544, NULL, 3, NULL, 11, 'Heroic', 1), -- Default Pharah Emotes
  (545, 1, 3, 3, 11, 'Cheer', 1), -- Normal Pharah Emotes
  (546, 1, 3, 3, 11, 'Chuckle', 5),
  (547, 1, 3, 3, 11, 'Flourish', 1),
  (548, 1, 3, 3, 11, 'Knuckles', 1),
  (549, 1, 3, 3, 11, 'Take A Knee', 5),
  (550, NULL, 3, NULL, 12, 'Heroic', 1), -- Default Reaper Emotes
  (551, 1, 3, 3, 12, 'Cackle', 5), -- Normal Reaper Emotes
  (552, 1, 3, 3, 12, 'Not Impressed', 1),
  (553, 1, 3, 3, 12, 'Slice', 1),
  (554, 1, 3, 3, 12, 'Slow Clap', 1),
  (555, 1, 3, 3, 12, 'Take A Knee', 5),
  (556, NULL, 3, NULL, 13, 'Heroic', 1), -- Default Reinhardt Emotes
  (557, 1, 3, 3, 13, 'Flex', 1), -- Normal Reinhardt Emotes
  (558, 1, 3, 3, 13, 'Kneel', 5),
  (559, 1, 3, 3, 13, 'Taunt', 1),
  (560, 1, 3, 3, 13, 'Uproarious', 5),
  (561, 1, 3, 3, 13, 'Warrior''s Salute', 1),
  (562, 7, 3, 3, 13, 'Pumpkin Smash', 7), -- Halloween Terror Reinhardt Emotes
  (563, NULL, 3, NULL, 14, 'Heroic', 1), -- Default Roadhog Emotes
  (564, 1, 3, 3, 14, 'Belly Laugh', 5), -- Normal Roadhog Emotes
  (565, 1, 3, 3, 14, 'Boo!', 1),
  (566, 1, 3, 3, 14, 'Can Crusher', 1),
  (567, 1, 3, 3, 14, 'Headbanging', 1),
  (568, 1, 3, 3, 14, 'Tuckered Out', 5),
  (569, NULL, 3, NULL, 15, 'Heroic', 1), -- Default Soldier: 76 Emotes
  (570, 1, 3, 3, 15, 'Amused', 5), -- Normal Soldier: 76 Emotes
  (571, 1, 3, 3, 15, 'Fist', 1),
  (572, 1, 3, 3, 15, 'I See You', 1),
  (573, 1, 3, 3, 15, 'Locked And Loaded', 1),
  (574, 1, 3, 3, 15, 'Take A Knee', 5),
  (575, NULL, 3, NULL, 16, 'Heroic', 1), -- Default Symmetra Emotes
  (576, 1, 3, 3, 16, 'Clap', 1), -- Normal Symmetra Emotes
  (577, 1, 3, 3, 16, 'Flow', 1),
  (578, 1, 3, 3, 16, 'Have A Seat', 5),
  (579, 1, 3, 3, 16, 'Insignificant', 1),
  (580, 1, 3, 3, 16, 'Snicker', 5),
  (581, 6, 3, 3, 16, 'Ribbon', 4), -- Summer Games Symmetra Emotes
  (582, NULL, 3, NULL, 17, 'Heroic', 1), -- Default Torbjörn Emotes
  (583, 1, 3, 3, 17, 'Clicking Heels', 1), -- Normal Torbjörn Emotes
  (584, 1, 3, 3, 17, 'Fisticuffs', 1),
  (585, 1, 3, 3, 17, 'Guffaw', 5),
  (586, 1, 3, 3, 17, 'Overload', 1),
  (587, 1, 3, 3, 17, 'Taking A Break', 5),
  (588, NULL, 3, NULL, 18, 'Heroic', 1), -- Default Tracer Emotes
  (589, 1, 3, 3, 18, 'Cheer', 1), -- Normal Tracer Emotes
  (590, 1, 3, 3, 18, 'Having A Laugh', 1),
  (591, 1, 3, 3, 18, 'Sitting Around...', 5),
  (592, 1, 3, 3, 18, 'Spin', 1),
  (593, NULL, 3, NULL, 19, 'Heroic', 1), -- Default Widowmaker Emotes
  (594, 1, 3, 3, 19, 'At Rest', 5), -- Normal Widowmaker Emotes
  (595, 1, 3, 3, 19, 'Curtain Call', 1),
  (596, 1, 3, 3, 19, 'Delighted', 5),
  (597, 1, 3, 3, 19, 'Shot Dead', 1),
  (598, 1, 3, 3, 19, 'Widow''s Kiss', 1),
  (599, NULL, 3, NULL, 20, 'Heroic', 1), -- Default Winston Emotes
  (600, 1, 3, 3, 20, 'Laughing Matter', 5), -- Normal Winston Emotes
  (601, 1, 3, 3, 20, 'Monkey Business', 1),
  (602, 1, 3, 3, 20, 'Peanut Butter?', 1),
  (603, 1, 3, 3, 20, 'Roar', 1),
  (604, 1, 3, 3, 20, 'Sitting Around', 5),
  (605, 7, 3, 3, 20, 'Shadow Puppets', 7), -- Halloween Terror Winston Emotes
  (606, NULL, 3, NULL, 21, 'Heroic', 1), -- Default Zarya Emotes
  (607, 1, 3, 3, 21, 'Bring It On', 1), -- Normal Zarya Emotes
  (608, 1, 3, 3, 21, 'Comedy Gold', 5),
  (609, 1, 3, 3, 21, 'Crush You', 1),
  (610, 1, 3, 3, 21, 'Pumping Iron', 1),
  (611, 1, 3, 3, 21, 'Take A Knee', 5),
  (612, NULL, 3, NULL, 22, 'Heroic', 1), -- Default Zenyatta Emotes
  (613, 1, 3, 3, 22, 'Focusing', 1), -- Normal Zenyatta Emotes
  (614, 1, 3, 3, 22, 'Meditate', 1),
  (615, 1, 3, 3, 22, 'Round Of Applause', 1),
  (616, 1, 3, 3, 22, 'Taunt', 5),
  (617, 1, 3, 3, 22, 'Tickled', 5),
  (618, NULL, 3, NULL, 23, 'Heroic', 9), -- Default Sombra Emotes
  (619, 1, 3, 3, 23, 'Amused', 9), -- Normal Sombra Emotes
  (620, 1, 3, 3, 23, 'Hold On', 9),
  (621, 1, 3, 3, 23, 'Masterpiece', 9),
  -- Victory Poses
  (622, NULL, 4, NULL, 1, 'Heroic', 3), -- Default Ana Victory Poses
  (623, 1, 4, 2, 1, 'Mission Complete', 3), -- Normal Ana Victory Poses
  (624, 1, 4, 2, 1, 'Protector', 3),
  (625, 1, 4, 2, 1, 'Seated', 3),
  (626, 7, 4, 2, 1, 'R.I.P.', 7), -- Halloween Terror Ana Victory Poses
  (627, NULL, 4, NULL, 2, 'Heroic', 1), -- Default Bastion Victory Poses
  (628, 1, 4, 2, 2, 'Birdwatching', 1), -- Normal Bastion Victory Poses
  (629, 1, 4, 2, 2, 'Pop Up', 1),
  (630, 1, 4, 2, 2, 'Tank', 1),
  (631, 7, 4, 2, 2, 'R.I.P.', 7), -- Halloween Terror Bastion Victory Poses
  (632, NULL, 4, NULL, 3, 'Heroic', 1), -- Default D.Va Victory Poses
  (633, 1, 4, 2, 3, 'I Heart You', 1), -- Normal D.Va Victory Poses
  (634, 1, 4, 2, 3, 'Peace', 1),
  (635, 1, 4, 2, 3, 'Sitting', 1),
  (636, 7, 4, 2, 3, 'R.I.P.', 7), -- Halloween Terror D.Va Victory Poses
  (637, NULL, 4, NULL, 4, 'Heroic', 1), -- Default Genji Victory Poses
  (638, 1, 4, 2, 4, 'Kneeling', 1), -- Normal Genji Victory Poses
  (639, 1, 4, 2, 4, 'Shuriken', 1),
  (640, 1, 4, 2, 4, 'Sword Stance', 1),
  (641, 7, 4, 2, 4, 'R.I.P.', 7), -- Halloween Terror Genji Victory Poses
  (642, NULL, 4, NULL, 5, 'Heroic', 1), -- Default Hanzo Victory Poses
  (643, 1, 4, 2, 5, 'Confident', 1), -- Normal Hanzo Victory Poses
  (644, 1, 4, 2, 5, 'Kneeling', 1),
  (645, 1, 4, 2, 5, 'Over The Shoulder', 1),
  (646, 7, 4, 2, 5, 'R.I.P.', 7), -- Halloween Terror Hanzo Victory Poses
  (647, NULL, 4, NULL, 6, 'Heroic', 1), -- Default Junkrat Victory Poses
  (648, 1, 4, 2, 6, 'It''ll Freeze That Way', 1), -- Normal Junkrat Victory Poses
  (649, 1, 4, 2, 6, 'Kneeling', 1),
  (650, 1, 4, 2, 6, 'Nyah Nyah', 1),
  (651, 7, 4, 2, 6, 'R.I.P.', 7), -- Halloween Terror Junkrat Victory Poses
  (652, NULL, 4, NULL, 7, 'Heroic', 1), -- Default Lúcio Victory Poses
  (653, 1, 4, 2, 7, 'Confident', 1), -- Normal Lúcio Victory Poses
  (654, 1, 4, 2, 7, 'Grooving', 1),
  (655, 1, 4, 2, 7, 'Ready For Action', 1),
  (656, 7, 4, 2, 7, 'R.I.P.', 7), -- Halloween Terror Lúcio Victory Poses
  (657, NULL, 4, NULL, 8, 'Heroic', 1), -- Default McCree Victory Poses
  (658, 1, 4, 2, 8, 'Contemplative', 1), -- Normal McCree Victory Poses
  (659, 1, 4, 2, 8, 'Over The Shoulder', 1),
  (660, 1, 4, 2, 8, 'Take It Easy', 1),
  (661, 7, 4, 2, 8, 'R.I.P.', 7), -- Halloween Terror McCree Victory Poses
  (662, NULL, 4, NULL, 9, 'Heroic', 1), -- Default Mei Victory Poses
  (663, 1, 4, 2, 9, 'Casual', 1), -- Normal Mei Victory Poses
  (664, 1, 4, 2, 9, 'Hands On Hips', 1),
  (665, 1, 4, 2, 9, 'Kneeling', 1),
  (666, 6, 4, 2, 9, 'Medal', 4), -- Summer Games Mei Victory Poses
  (667, 7, 4, 2, 9, 'R.I.P.', 7), -- Halloween Terror Mei Victory Poses
  (668, NULL, 4, NULL, 10, 'Heroic', 1), -- Default Mercy Victory Poses
  (669, 1, 4, 2, 10, 'Angelic', 1), -- Normal Mercy Victory Poses
  (670, 1, 4, 2, 10, 'Carefree', 1),
  (671, 1, 4, 2, 10, 'Ready For Battle', 1),
  (672, 7, 4, 2, 10, 'R.I.P.', 7), -- Halloween Terror Mercy Victory Poses
  (673, NULL, 4, NULL, 11, 'Heroic', 1), -- Default Pharah Victory Poses
  (674, 1, 4, 2, 11, 'Guardian', 1), -- Normal Pharah Victory Poses
  (675, 1, 4, 2, 11, 'Jump Jet', 1),
  (676, 1, 4, 2, 11, 'Kneeling', 1),
  (677, 6, 4, 2, 11, 'Medal', 4), -- Summer Games Pharah Victory Poses
  (678, 7, 4, 2, 11, 'R.I.P.', 7), -- Halloween Terror Pharah Victory Poses
  (679, NULL, 4, NULL, 12, 'Heroic', 1), -- Default Reaper Victory Poses
  (680, 1, 4, 2, 12, 'Casual', 1), -- Normal Reaper Victory Poses
  (681, 1, 4, 2, 12, 'Enigmatic', 1),
  (682, 1, 4, 2, 12, 'Menacing', 1),
  (683, 1, 4, 2, 12, 'Medal', 1), -- Summer Games Reaper Victory Poses
  (684, 7, 4, 2, 12, 'R.I.P.', 7), -- Halloween Terror Reaper Victory Poses
  (685, NULL, 4, NULL, 13, 'Heroic', 1), -- Default Reinhardt Victory Poses
  (686, 1, 4, 2, 13, 'Confident', 1), -- Normal Reinhardt Victory Poses
  (687, 1, 4, 2, 13, 'Flex', 1),
  (688, 1, 4, 2, 13, 'Legendary', 1),
  (689, 7, 4, 2, 13, 'R.I.P.', 7), -- Halloween Terror Reinhardt Victory Poses
  (690, NULL, 4, NULL, 14, 'Heroic', 1), -- Default Roadhog Victory Poses
  (691, 1, 4, 2, 14, 'Pointing To The Sky', 1), -- Normal Roadhog Victory Poses
  (692, 1, 4, 2, 14, 'Thumbs Up', 1),
  (693, 1, 4, 2, 14, 'Tuckered Out', 1),
  (694, 6, 4, 2, 14, 'Medal', 4), -- Summer Games Roadhog Victory Poses
  (695, 7, 4, 2, 14, 'R.I.P.', 7), -- Halloween Terror Roadhog Victory Poses
  (696, NULL, 4, NULL, 15, 'Heroic', 1), -- Default Soldier: 76 Victory Poses
  (697, 1, 4, 2, 15, 'Fist Pump', 1), -- Normal Soldier: 76 Victory Poses
  (698, 1, 4, 2, 15, 'Locked And Loaded', 1),
  (699, 1, 4, 2, 15, 'Soldier', 1),
  (700, 6, 4, 2, 15, 'Golf Swing', 4), -- Summer Games Soldier: 76 Victory Poses
  (701, 7, 4, 2, 15, 'R.I.P.', 7), -- Halloween Terror Soldier: 76 Victory Poses
  (702, NULL, 4, NULL, 16, 'Heroic', 1), -- Default Symmetra Victory Poses
  (703, 1, 4, 2, 16, 'Balance', 1), -- Normal Symmetra Victory Poses
  (704, 1, 4, 2, 16, 'Creation', 1),
  (705, 1, 4, 2, 16, 'Dance', 1),
  (706, 7, 4, 2, 16, 'R.I.P.', 7), -- Halloween Terror Symmetra Victory Poses
  (707, NULL, 4, NULL, 17, 'Heroic', 1), -- Default Torbjörn Victory Poses
  (708, 1, 4, 2, 17, 'Hammer', 1), -- Normal Torbjörn Victory Poses
  (709, 1, 4, 2, 17, 'Sitting Pretty', 1),
  (710, 1, 4, 2, 17, 'Take Five', 1),
  (711, 6, 4, 2, 17, 'Medal', 4), -- Summer Games Torbjörn Victory Poses
  (712, 7, 4, 2, 17, 'R.I.P.', 7), -- Halloween Terror Torbjörn Victory Poses
  (713, NULL, 4, NULL, 18, 'Heroic', 1), -- Default Tracer Victory Poses
  (714, 1, 4, 2, 18, 'Over The Shoulder', 1), -- Normal Tracer Victory Poses
  (715, 1, 4, 2, 18, 'Salute', 1),
  (716, 1, 4, 2, 18, 'Sitting', 1),
  (717, 7, 4, 2, 18, 'R.I.P.', 7), -- Halloween Terror Tracer Victory Poses
  (718, NULL, 4, NULL, 19, 'Heroic', 1), -- Default Widowmaker Victory Poses
  (719, 1, 4, 2, 19, 'Activating Visor', 1), -- Normal Widowmaker Victory Poses
  (720, 1, 4, 2, 19, 'Gaze', 1),
  (721, 1, 4, 2, 19, 'Over The Shoulder', 1),
  (722, 6, 4, 2, 19, 'Medal', 4), -- Summer Games Widowmaker Victory Poses
  (723, 7, 4, 2, 19, 'R.I.P.', 7), -- Halloween Terror Widowmaker Victory Poses
  (724, NULL, 4, NULL, 20, 'Heroic', 1), -- Default Winston Victory Poses
  (725, 1, 4, 2, 20, 'Beast', 1), -- Normal Winston Victory Poses
  (726, 1, 4, 2, 20, 'Glasses', 1),
  (727, 1, 4, 2, 20, 'The Thinker', 1),
  (728, 6, 4, 2, 20, 'Medal', 4), -- Summer Games Winston Victory Poses
  (729, 7, 4, 2, 20, 'R.I.P.', 7), -- Halloween Terror Winston Victory Poses
  (730, NULL, 4, NULL, 21, 'Heroic', 1), -- Default Zarya Victory Poses
  (731, 1, 4, 2, 21, 'Casual', 1), -- Normal Zarya Victory Poses
  (732, 1, 4, 2, 21, 'Check Out This Gun', 1),
  (733, 1, 4, 2, 21, 'Flexing', 1),
  (734, 7, 4, 2, 21, 'R.I.P.', 7), -- Halloween Terror Zarya Victory Poses
  (735, NULL, 4, NULL, 22, 'Heroic', 1), -- Default Zenyatta Victory Poses
  (736, 1, 4, 2, 22, 'Balance', 1), -- Normal Zenyatta Victory Poses
  (737, 1, 4, 2, 22, 'Harmony', 1),
  (738, 1, 4, 2, 22, 'Peace', 1),
  (739, 6, 4, 2, 22, 'Medals', 4), -- Summer Games Zenyatta Victory Poses
  (740, 7, 4, 2, 22, 'R.I.P.', 7), -- Halloween Terror Zenyatta Victory Poses
  (741, NULL, 4, NULL, 23, 'Heroic', 9), -- Default Sombra Victory Poses
  (742, 1, 4, 2, 23, 'Hacked', 9), -- Normal Sombra Victory Poses
  (743, 1, 4, 2, 23, 'Kneeling', 9),
  (744, 1, 4, 2, 23, 'Rising', 9),
  -- Voice Lines
  (745, NULL, 5, NULL, 1, 'Justice Delivered', 3), -- Default Ana Voice Lines
  (746, 1, 5, 1, 1, 'Children, Behave', 3), -- Normal Ana Voice Lines
  (747, 1, 5, 1, 1, 'Everyone Dies', 3),
  (748, 1, 5, 1, 1, 'It Takes A Woman To Know It', 3),
  (749, 1, 5, 1, 1, 'Justice Rains From Above', 3),
  (750, 1, 5, 1, 1, 'Mother Knows Best', 3),
  (751, 1, 5, 1, 1, 'No Scope Needed', 3),
  (752, 1, 5, 1, 1, 'Someone To Tuck You In?', 3),
  (753, 1, 5, 1, 1, 'What Are You Thinking?', 3),
  (754, 1, 5, 1, 1, 'Witness Me', 3),
  (755, 1, 5, 1, 1, 'You Know Nothing', 3),
  (756, 6, 5, 1, 1, 'Learn From The Pain', 4), -- Summer Games Ana Voice Lines
  (757, 7, 5, 1, 1, 'Are You Scared?', 7), -- Halloween Terror Ana Voice Lines
  (758, NULL, 5, NULL, 2, 'Doo-Woo', 1), -- Default Bastion Voice Lines
  (759, 1, 5, 1, 2, 'Beeple', 1), -- Normal Bastion Voice Lines
  (760, 1, 5, 1, 2, 'Boo Boo Doo De Doo', 1),
  (761, 1, 5, 1, 2, 'Bweeeeeeeeeee', 1),
  (762, 1, 5, 1, 2, 'Chirr Chirr Chirr', 1),
  (763, 1, 5, 1, 2, 'Dah-Dah Weeeee!', 1),
  (764, 1, 5, 1, 2, 'Dun Dun Boop Boop', 1),
  (765, 1, 5, 1, 2, 'Dweet Dweet Dweet!', 1),
  (766, 1, 5, 1, 2, 'Hee Hoo Hoo', 1),
  (767, 1, 5, 1, 2, 'Sh-Sh-Sh', 1),
  (768, 1, 5, 1, 2, 'Zwee?', 1),
  (769, 6, 5, 1, 2, 'Whoo-Vweeeeee', 4), -- Summer Games Bastion Voice Lines
  (770, 7, 5, 1, 2, 'W-w-wooooo...?', 7), -- Halloween Terror Bastion Voice Lines
  (771, NULL, 5, NULL, 3, 'Love, D.Va', 1), -- Default D.Va Voice Lines
  (772, 1, 5, 1, 3, ';)', 1), -- Normal D.Va Voice Lines
  (773, 1, 5, 1, 3, 'A New Challenger!', 1),
  (774, 1, 5, 1, 3, 'AFK', 1),
  (775, 1, 5, 1, 3, 'Aw, Yeah!', 1),
  (776, 1, 5, 1, 3, 'D.Va: 1, Bad Guys: 0', 1),
  (777, 1, 5, 1, 3, 'GG!', 1),
  (778, 1, 5, 1, 3, 'I Play To Win', 1),
  (779, 1, 5, 1, 3, 'Is This Easy Mode?', 1),
  (780, 1, 5, 1, 3, 'LOL', 1),
  (781, 1, 5, 1, 3, 'No Hacks Required', 1),
  (782, 6, 5, 1, 3, 'I''m #1', 4), -- Summer Games D.Va Voice Lines
  (783, 7, 5, 1, 3, 'Happy Halloween', 7), -- Halloween Terror D.Va Voice Lines
  (784, NULL, 5, NULL, 4, 'A Steady Blade', 1), -- Default Genji Voice Lines
  (785, 1, 5, 1, 4, 'Come on!', 1), -- Normal Genji Voice Lines
  (786, 1, 5, 1, 4, 'Damn!', 1),
  (787, 1, 5, 1, 4, 'I Am Prepared!', 1),
  (788, 1, 5, 1, 4, 'Let''s Fight!', 1),
  (789, 1, 5, 1, 4, 'Measure Twice, Cut Once', 1),
  (790, 1, 5, 1, 4, 'My Soul Seeks Balance', 1),
  (791, 1, 5, 1, 4, 'Not Good Enough', 1),
  (792, 1, 5, 1, 4, 'Simple', 1),
  (793, 1, 5, 1, 4, 'Yeah!', 1),
  (794, 1, 5, 1, 4, 'You Are Only Human', 1),
  (795, 6, 5, 1, 4, 'I Was Hoping For A Challenge', 4), -- Summer Games Genji Voice Lines
  (796, 7, 5, 1, 4, 'My Halloween Costume?', 7), -- Halloween Terror Genji Voice Lines
  (797, NULL, 5, NULL, 5, 'Expect Nothing Less', 1), -- Default Hanzo Voice Lines
  (798, 1, 5, 1, 5, 'Flow Like Water', 1), -- Normal Hanzo Voice Lines
  (799, 1, 5, 1, 5, 'From One Thing...', 1),
  (800, 1, 5, 1, 5, 'Hm...', 1),
  (801, 1, 5, 1, 5, 'I Do What I Must', 1),
  (802, 1, 5, 1, 5, 'Never In Doubt', 1),
  (803, 1, 5, 1, 5, 'Never Second Best', 1),
  (804, 1, 5, 1, 5, 'Remember This Moment', 1),
  (805, 1, 5, 1, 5, 'Sake!', 1),
  (806, 1, 5, 1, 5, 'Spirit Dragon', 1),
  (807, 1, 5, 1, 5, 'Step Into The Dojo', 1),
  (808, 6, 5, 1, 5, 'Ignore All Distractions', 4), -- Summer Games Hanzo Voice Lines
  (809, 7, 5, 1, 5, 'You Are Already Dead', 7), -- Halloween Terror Hanzo Voice Lines
  (810, NULL, 5, NULL, 6, 'Tick-Tock-Tick-Tock', 1), -- Default Junkrat Voice Lines
  (811, 1, 5, 1, 6, '...Blow It Up Again', 1), -- Normal Junkrat Voice Lines
  (812, 1, 5, 1, 6, 'Anyone Want Some BBQ?', 1),
  (813, 1, 5, 1, 6, 'Brrring!', 1),
  (814, 1, 5, 1, 6, 'Coming Up Explodey!', 1),
  (815, 1, 5, 1, 6, 'Happy Birthday', 1),
  (816, 1, 5, 1, 6, 'Have A Nice Day!', 1),
  (817, 1, 5, 1, 6, 'It''s The Little Things', 1),
  (818, 1, 5, 1, 6, 'Kaboom', 1),
  (819, 1, 5, 1, 6, 'Ohh, Shiny', 1),
  (820, 1, 5, 1, 6, 'Smile!', 1),
  (821, 6, 5, 1, 6, 'I Give It A 10!', 4), -- Summer Games Junkrat Voice Lines
  (822, 7, 5, 1, 6, 'Happy Halloween', 7), -- Halloween Terror Junkrat Voice Lines
  (823, NULL, 5, NULL, 7, 'To The Rhythm', 1), -- Default Lúcio Voice Lines
  (824, 1, 5, 1, 7, 'Can''t Stop, Won''t Stop', 1), -- Normal Lúcio Voice Lines
  (825, 1, 5, 1, 7, 'Hit Me!', 1),
  (826, 1, 5, 1, 7, 'I Could Do This All Day', 1),
  (827, 1, 5, 1, 7, 'I''m On Top Of The World', 1),
  (828, 1, 5, 1, 7, 'Jackpot!', 1),
  (829, 1, 5, 1, 7, 'Not Hearing That Noise', 1),
  (830, 1, 5, 1, 7, 'Oh, Yeah!', 1),
  (831, 1, 5, 1, 7, 'Tinnitus', 1),
  (832, 1, 5, 1, 7, 'Why Are You So Angry?', 1),
  (833, 1, 5, 1, 7, 'You Gotta Believe!', 1),
  (834, 6, 5, 1, 7, 'Be Champions', 4), -- Summer Games Lúcio Voice Lines
  (835, 7, 5, 1, 7, 'Killed It!', 7), -- Halloween Terror Lúcio Voice Lines
  (836, NULL, 5, NULL, 8, 'Watch And Learn', 1), -- Default McCree Voice Lines
  (837, 1, 5, 1, 8, 'Ain''t I Killed You Before', 1), -- Normal McCree Voice Lines
  (838, 1, 5, 1, 8, 'Happens To The Best Of Us', 1),
  (839, 1, 5, 1, 8, 'I Tried Being Reasonable', 1),
  (840, 1, 5, 1, 8, 'I''m In The Quick...', 1),
  (841, 1, 5, 1, 8, 'I''m Your Huckleberry', 1),
  (842, 1, 5, 1, 8, 'I''ve Got A Bullet...', 1),
  (843, 1, 5, 1, 8, 'Reach For The Sky', 1),
  (844, 1, 5, 1, 8, 'Sure As Hell Ain''t Ugly', 1),
  (845, 1, 5, 1, 8, 'Wanted: Dead Or Alive', 1),
  (846, 1, 5, 1, 8, 'You Done?', 1),
  (847, 6, 5, 1, 8, 'I Don''t Much Like Losing', 4), -- Summer Games McCree Voice Lines
  (848, 7, 5, 1, 8, 'It''s Your Funeral', 7), -- Halloween Terror McCree Voice Lines
  (849, NULL, 5, NULL, 9, 'Hang In There', 1), -- Default Mei Voice Lines
  (850, 1, 5, 1, 9, 'A-Mei-Zing!', 1), -- Normal Mei Voice Lines
  (851, 1, 5, 1, 9, 'Chill Out!', 1),
  (852, 1, 5, 1, 9, 'Fight For Our World', 1),
  (853, 1, 5, 1, 9, 'Learned Your Lesson', 1),
  (854, 1, 5, 1, 9, 'Okay!', 1),
  (855, 1, 5, 1, 9, 'Ouch, Are You Okay?', 1),
  (856, 1, 5, 1, 9, 'Sorry Sorry Sorry Sorry', 1),
  (857, 1, 5, 1, 9, 'That Was Great', 1),
  (858, 1, 5, 1, 9, 'Yay!', 1),
  (859, 1, 5, 1, 9, 'You Have To Let It Go', 1),
  (860, 6, 5, 1, 9, 'Overcome All Obstacles', 4), -- Summer Games Mei Voice Lines
  (861, 7, 5, 1, 9, 'Scary!', 7), -- Halloween Terror Mei Voice Lines
  (862, NULL, 5, NULL, 10, 'I Have My Eye On You', 1), -- Default Mercy Voice Lines
  (863, 1, 5, 1, 10, 'Consultation Fee', 1), -- Normal Mercy Voice Lines
  (864, 1, 5, 1, 10, 'Doctor''s Orders', 1),
  (865, 1, 5, 1, 10, 'How Barbaric', 1),
  (866, 1, 5, 1, 10, 'Miracle Worker', 1),
  (867, 1, 5, 1, 10, 'Need A Second Opinion?', 1),
  (868, 1, 5, 1, 10, 'On A Scale Of 1-10', 1),
  (869, 1, 5, 1, 10, 'Super!', 1),
  (870, 1, 5, 1, 10, 'Take Two', 1),
  (871, 1, 5, 1, 10, 'The Doctor Is In', 1),
  (872, 1, 5, 1, 10, 'The Doctor Will See You', 1),
  (873, 6, 5, 1, 10, 'Piece Of Cake', 4), -- Summer Games Mercy Voice Lines
  (874, 7, 5, 1, 10, 'Superstition', 7), -- Halloween Terror Mercy Voice Lines
  (875, NULL, 5, NULL, 11, 'Security In My Hands', 1), -- Default Pharah Voice Lines
  (876, 1, 5, 1, 11, 'Aerial Superiority Achieved', 1), -- Normal Pharah Voice Lines
  (877, 1, 5, 1, 11, 'Fly Like An Egyptian', 1),
  (878, 1, 5, 1, 11, 'Flying The Friendly Skies', 1),
  (879, 1, 5, 1, 11, 'Got You On My Radar', 1),
  (880, 1, 5, 1, 11, 'Leave This To A Professional', 1),
  (881, 1, 5, 1, 11, 'Not A Chance', 1),
  (882, 1, 5, 1, 11, 'Play Nice, Play Pharah', 1),
  (883, 1, 5, 1, 11, 'Rocket Jump?', 1),
  (884, 1, 5, 1, 11, 'Shot Down', 1),
  (885, 1, 5, 1, 11, 'Sorry, But I Need To Jet', 1),
  (886, 6, 5, 1, 11, 'We Are In This Together', 4), -- Summer Games Pharah Voice Lines
  (887, 7, 5, 1, 11, 'Dead Or Alive', 7), -- Halloween Terror Pharah Voice Lines
  (888, NULL, 5, NULL, 12, 'What Are You Looking At', 1), -- Default Reaper Voice Lines
  (889, 1, 5, 1, 12, 'Dead Man Walking', 1), -- Normal Reaper Voice Lines
  (890, 1, 5, 1, 12, 'Give Me A Break', 1),
  (891, 1, 5, 1, 12, 'Haven''t I Killed You', 1),
  (892, 1, 5, 1, 12, 'I''m Back In Black', 1),
  (893, 1, 5, 1, 12, 'If It Lives, I Can Kill It', 1),
  (894, 1, 5, 1, 12, 'Next', 1),
  (895, 1, 5, 1, 12, 'Psychopath', 1),
  (896, 1, 5, 1, 12, 'Seen A Ghost?', 1),
  (897, 1, 5, 1, 12, 'Too Easy', 1),
  (898, 1, 5, 1, 12, 'Was That All?', 1),
  (899, 6, 5, 1, 12, 'It''s In The Refrigerator', 4), -- Summer Games Reaper Voice Lines
  (900, 7, 5, 1, 12, 'I Work The Graveyard Shift', 7), -- Halloween Terror Reaper Voice Lines
  (901, NULL, 5, NULL, 13, 'I Salute You', 1), -- Default Reinhardt Voice Lines
  (902, 1, 5, 1, 13, 'Are You Afraid?', 1), -- Normal Reinhardt Voice Lines
  (903, 1, 5, 1, 13, 'Bring Me Another', 1),
  (904, 1, 5, 1, 13, 'Catch Phrase!', 1),
  (905, 1, 5, 1, 13, 'Crusader Online', 1),
  (906, 1, 5, 1, 13, 'Crushing Machine', 1),
  (907, 1, 5, 1, 13, 'German Engineering', 1),
  (908, 1, 5, 1, 13, 'Honor And Glory', 1),
  (909, 1, 5, 1, 13, 'Respect Your Elders', 1),
  (910, 1, 5, 1, 13, 'Show You How It''s Done', 1),
  (911, 1, 5, 1, 13, 'This Old Dog', 1),
  (912, 1, 5, 1, 13, '100% German Power', 1), -- Summer Games Reinhardt Voice Lines
  (913, 1, 5, 1, 13, 'Smashing', 1), -- Halloween Terror Reinhardt Voice Lines
  (914, NULL, 5, NULL, 14, 'The Apocalypse', 1), -- Default Roadhog Voice Lines
  (915, 1, 5, 1, 14, 'Candy From A Baby', 1), -- Normal Roadhog Voice Lines
  (916, 1, 5, 1, 14, 'Got Something To Say?', 1),
  (917, 1, 5, 1, 14, 'Hahaha!', 1),
  (918, 1, 5, 1, 14, 'Hook, Line, And Sinker', 1),
  (919, 1, 5, 1, 14, 'Life Is Pain, So Is Death', 1),
  (920, 1, 5, 1, 14, 'Piece Of Cake', 1),
  (921, 1, 5, 1, 14, 'Push Off', 1),
  (922, 1, 5, 1, 14, 'Say "Bacon..."', 1),
  (923, 1, 5, 1, 14, 'Violence Is The Answer', 1),
  (924, 1, 5, 1, 14, 'We''re All Animals', 1),
  (925, 1, 5, 1, 14, 'What''s Mine Is Mine', 1), -- Summer Games Roadhog Voice Lines
  (926, 1, 5, 1, 14, 'Want Some Candy?', 1), -- Halloween Terror Roadhog Voice Lines
  (927, NULL, 5, NULL, 15, 'I''ve Still Got It', 1), -- Default Soldier: 76 Voice Lines
  (928, 1, 5, 1, 15, 'Get Off My Lawn', 1), -- Normal Soldier: 76 Voice Lines
  (929, 1, 5, 1, 15, 'I Didn''t Start This War...', 1),
  (930, 1, 5, 1, 15, 'I''m An Army Of One', 1),
  (931, 1, 5, 1, 15, 'Not On My Watch', 1),
  (932, 1, 5, 1, 15, 'Old Soldiers', 1),
  (933, 1, 5, 1, 15, 'Smells Like Victory', 1),
  (934, 1, 5, 1, 15, 'That''s "Sir" To You', 1),
  (935, 1, 5, 1, 15, 'What Are You Lookin'' At?', 1),
  (936, 1, 5, 1, 15, 'You Didn''t Make The Cut', 1),
  (937, 1, 5, 1, 15, 'You''re The Other One', 1),
  (938, 1, 5, 1, 15, 'You Want A Medal?', 1), -- Summer Games Soldier: 76 Voice Lines
  (939, 1, 5, 1, 15, 'Knock Knock', 1), -- Halloween Terror Soldier: 76 Voice Lines
  (940, NULL, 5, NULL, 16, 'Such A Lack Of Imagination', 1), -- Default Symmetra Voice Lines
  (941, 1, 5, 1, 16, 'Everything By Design', 1), -- Normal Symmetra Voice Lines
  (942, 1, 5, 1, 16, 'Exquisite', 1),
  (943, 1, 5, 1, 16, 'How Unsightly', 1),
  (944, 1, 5, 1, 16, 'I Don''t Think So', 1),
  (945, 1, 5, 1, 16, 'Impressive', 1),
  (946, 1, 5, 1, 16, 'Perfect Harmony', 1),
  (947, 1, 5, 1, 16, 'Precisely', 1),
  (948, 1, 5, 1, 16, 'Put You In Your Place', 1),
  (949, 1, 5, 1, 16, 'Welcome To My Reality', 1),
  (950, 1, 5, 1, 16, 'Why Do You Struggle?', 1),
  (951, 1, 5, 1, 16, 'Hard Work And Dedication', 1), -- Summer Games Symmetra Voice Lines
  (952, 1, 5, 1, 16, 'A Frightening Thought', 1), -- Halloween Terror Symmetra Voice Lines
  (953, NULL, 5, NULL, 17, 'Hard Work Pays Off', 1), -- Default Torbjörn Voice Lines
  (954, 1, 5, 1, 17, 'A Chicken Out Of A Feather', 1), -- Normal Torbjörn Voice Lines
  (955, 1, 5, 1, 17, 'Completion Date?', 1),
  (956, 1, 5, 1, 17, 'Don''t Get Caught', 1),
  (957, 1, 5, 1, 17, 'Engineers', 1),
  (958, 1, 5, 1, 17, 'I''m Givng It All I''ve Got!', 1),
  (959, 1, 5, 1, 17, 'I''m Swedish!', 1),
  (960, 1, 5, 1, 17, 'Leave This To An Expert', 1),
  (961, 1, 5, 1, 17, 'Let''s Not Buy The Pig', 1),
  (962, 1, 5, 1, 17, 'Some Assembly Required', 1),
  (963, 1, 5, 1, 17, 'Working As Intended', 1),
  (964, 1, 5, 1, 17, 'More Where That Came From', 1), -- Summer Games Torbjörn Voice Lines
  (965, 1, 5, 1, 17, 'If You Build It', 1), -- Halloween Terror Torbjörn Voice Lines
  (966, NULL, 5, NULL, 18, 'You Got It', 1), -- Default Tracer Voice Lines
  (967, 1, 5, 1, 18, 'Aw, Rubbish', 1), -- Normal Tracer Voice Lines
  (968, 1, 5, 1, 18, 'Be Right Back!', 1),
  (969, 1, 5, 1, 18, 'Check Me Out', 1),
  (970, 1, 5, 1, 18, 'Cheers, Love!', 1),
  (971, 1, 5, 1, 18, 'Déjà Vu', 1),
  (972, 1, 5, 1, 18, 'Keep Calm', 1),
  (973, 1, 5, 1, 18, 'She Shoots, She Scores', 1),
  (974, 1, 5, 1, 18, 'The World Needs Heroes', 1),
  (975, 1, 5, 1, 18, 'Under Control', 1),
  (976, 1, 5, 1, 18, 'You Need A Time Out', 1),
  (977, 1, 5, 1, 18, 'Eat My Dust', 1), -- Summer Games Tracer Voice Lines
  (978, 1, 5, 1, 18, 'Ooh, Scary!', 1), -- Halloween Terror Tracer Voice Lines
  (979, NULL, 5, NULL, 19, 'A Single Death', 1), -- Default Widowmaker Voice Lines
  (980, 1, 5, 1, 19, 'Encore?', 1), -- Normal Widowmaker Voice Lines
  (981, 1, 5, 1, 19, 'Let Them Eat The Cake', 1),
  (982, 1, 5, 1, 19, 'Look For The Woman', 1),
  (983, 1, 5, 1, 19, 'Magnifique', 1),
  (984, 1, 5, 1, 19, 'One Shot, One Kill', 1),
  (985, 1, 5, 1, 19, 'Ouh Là Là', 1),
  (986, 1, 5, 1, 19, 'Step Into My Parlor...', 1),
  (987, 1, 5, 1, 19, 'That''s How It Is', 1),
  (988, 1, 5, 1, 19, 'To Life, To Death', 1),
  (989, 1, 5, 1, 19, 'What''s An Aimbot?', 1),
  (990, 1, 5, 1, 19, 'I Don''t Miss', 1), -- Summer Games Widowmaker Voice Lines
  (991, 1, 5, 1, 19, 'The Party Is Over', 1), -- Halloween Terror Widowmaker Voice Lines
  (992, NULL, 5, NULL, 20, 'Curious', 1), -- Default Winston Voice Linest
  (993, 1, 5, 1, 20, '...Excuse Me', 1), -- Normal Winston Voice Lines
  (994, 1, 5, 1, 20, 'Don''t Get Me Angry', 1),
  (995, 1, 5, 1, 20, 'How Embarrassing!', 1),
  (996, 1, 5, 1, 20, 'I Do Not Want A Banana', 1),
  (997, 1, 5, 1, 20, 'Natural Selection', 1),
  (998, 1, 5, 1, 20, 'No Monkey Business', 1),
  (999, 1, 5, 1, 20, 'Peanut Butter?', 1),
  (1000, 1, 5, 1, 20, 'Sorry About That!', 1),
  (1001, 1, 5, 1, 20, 'The Power Of Science!', 1),
  (1002, 1, 5, 1, 20, 'We Have A Problem', 1),
  (1003, 1, 5, 1, 20, 'Playtime''s Over', 1), -- Summer Games Winston Voice Lines
  (1004, 1, 5, 1, 20, 'This Is Not A Costume', 1), -- Halloween Terror Winston Voice Lines
  (1005, NULL, 5, NULL, 21, 'Strong As The Mountain', 1), -- Default Zarya Voice Lines
  (1006, 1, 5, 1, 21, 'Get Down, Give Me 20', 1), -- Normal Zarya Voice Lines
  (1007, 1, 5, 1, 21, 'I Am Mother Russia', 1),
  (1008, 1, 5, 1, 21, 'I Can Bench More Than You', 1),
  (1009, 1, 5, 1, 21, 'I Will Break You', 1),
  (1010, 1, 5, 1, 21, 'In Russia, Game Plays You', 1),
  (1011, 1, 5, 1, 21, 'Need Personal Training?', 1),
  (1012, 1, 5, 1, 21, 'No Mercy', 1),
  (1013, 1, 5, 1, 21, 'Siberian Bear', 1),
  (1014, 1, 5, 1, 21, 'Together We Are Strong', 1),
  (1015, 1, 5, 1, 21, 'Welcome To The Gun Show', 1),
  (1016, 1, 5, 1, 21, 'No Pain, No Gain', 1), -- Summer Games Zarya Voice Lines
  (1017, 1, 5, 1, 21, 'Never Forget The Fallen', 1), -- Halloween Terror Zarya Voice Lines
  (1018, NULL, 5, NULL, 22, 'We Are In Harmony', 1), -- Default Zenyatta Voice Lines
  (1019, 1, 5, 1, 22, 'Death Is Whimsical Today', 1), -- Normal Zenyatta Voice Lines
  (1020, 1, 5, 1, 22, 'Do I Think?', 1),
  (1021, 1, 5, 1, 22, 'Free Your Mind', 1),
  (1022, 1, 5, 1, 22, 'Hello, World!', 1),
  (1023, 1, 5, 1, 22, 'I Dreamt I Was A Butterfly', 1),
  (1024, 1, 5, 1, 22, 'I Think, Therefore I Am', 1),
  (1025, 1, 5, 1, 22, 'I Will Not Juggle', 1),
  (1026, 1, 5, 1, 22, 'Ones And Zeroes', 1),
  (1027, 1, 5, 1, 22, 'Peace And Blessings', 1),
  (1028, 1, 5, 1, 22, 'The Iris Embraces You', 1),
  (1029, 1, 5, 1, 22, 'Strive For Improvement', 1), -- Summer Games Zenyatta Voice Lines
  (1030, 1, 5, 1, 22, 'Trick Or Treat?', 1), -- Halloween Terror Zenyatta Voice Lines
  (1031, NULL, 5, NULL, 23, 'Playing Fair', 9), -- Default Sombra Voice Lines
  (1032, 1, 5, 1, 23, 'Cool', 9), -- Normal Sombra Voice Lines
  (1033, 1, 5, 1, 23, 'Did You Mean To Do That?', 9),
  (1034, 1, 5, 1, 23, 'Glitch In The System', 9),
  (1035, 1, 5, 1, 23, 'Good One', 9),
  (1036, 1, 5, 1, 23, 'Hack The Planet', 9),
  (1037, 1, 5, 1, 23, 'In Over Your Head', 9),
  (1038, 1, 5, 1, 23, 'Just Squishing A Bug', 9),
  (1039, 1, 5, 1, 23, 'Mess With The Best...', 9),
  (1040, 1, 5, 1, 23, 'Show Me What You Got', 9),
  (1041, 1, 5, 1, 23, 'Taking This Very Seriously', 9),
  -- Sprays
  (1042, NULL, 6, NULL, NULL, 'Logo', 1), -- Default All Heroes Sprays
  (1043, NULL, 6, NULL, NULL, 'You Are Not Prepared', 3),
  (1044, NULL, 6, NULL, NULL, 'Día De Los Muertos', 8),
  (1045, 1, 6, 1, NULL, '...Punch', 1), -- Normal All Heroes Sprays
  (1046, 1, 6, 1, NULL, 'Catcher', 1),
  (1047, 1, 6, 1, NULL, 'Caution', 1),
  (1048, 1, 6, 1, NULL, 'Dance', 1),
  (1049, 1, 6, 1, NULL, 'Dark Logo', 1),
  (1050, 1, 6, 1, NULL, 'Dark Overwatch', 1),
  (1051, 1, 6, 1, NULL, 'Dark Title', 1),
  (1052, 1, 6, 1, NULL, 'FotS2', 1),
  (1053, 1, 6, 1, NULL, 'Fuji', 1),
  (1054, 1, 6, 1, NULL, 'Goldshire Pictures', 1),
  (1055, 1, 6, 1, NULL, 'Leek', 1),
  (1056, 1, 6, 1, NULL, 'Lumérico', 1),
  (1057, 1, 6, 1, NULL, 'Numbani Statue', 1),
  (1058, 1, 6, 1, NULL, 'Omnic Rights', 1),
  (1059, 1, 6, 1, NULL, 'Overwatch', 1),
  (1060, 1, 6, 1, NULL, 'Overwatch Title', 1),
  (1061, 1, 6, 1, NULL, 'Pachimari', 1),
  (1062, 1, 6, 1, NULL, 'Rhino', 1),
  (1063, 1, 6, 1, NULL, 'Rikimaru', 1),
  (1064, 1, 6, 1, NULL, 'Sarcophagus', 1),
  (1065, 1, 6, 1, NULL, 'Scooter', 1),
  (1066, 1, 6, 1, NULL, 'Scroll', 1),
  (1067, 1, 6, 1, NULL, 'Siege Mode', 1),
  (1068, 1, 6, 1, NULL, 'Six Gun Killer', 1),
  (1069, 1, 6, 1, NULL, 'Sol', 1),
  (1070, 1, 6, 1, NULL, 'Soulstone', 1),
  (1071, 1, 6, 1, NULL, 'Vivi''s Adventure', 1),
  (1072, 2, 6, 1, NULL, 'Beyond The Moon', 1), -- Achievements All Heroes Sprays
  (1073, 2, 6, 1, NULL, 'Forge Onward', 1),
  (1074, 2, 6, 1, NULL, 'GL HF', 1),
  (1075, 2, 6, 1, NULL, 'Halloween Special', 7),
  (1076, 2, 6, 1, NULL, 'Jail', 1),
  (1077, 2, 6, 1, NULL, 'Junkenstein''s Revenge', 7),
  (1078, 2, 6, 1, NULL, 'Man And Omnic', 1),
  (1079, 2, 6, 1, NULL, 'Oops', 1),
  (1080, 2, 6, 1, NULL, 'Out Of My Way', 1),
  (1081, 2, 6, 1, NULL, 'Piñata', 1),
  (1082, 2, 6, 1, NULL, 'Red O', 1),
  (1083, 2, 6, 1, NULL, 'Red X', 1),
  (1084, 2, 6, 1, NULL, 'Respect', 1),
  (1085, 2, 6, 1, NULL, 'Rise', 1),
  (1086, 2, 6, 1, NULL, 'Rise Of The Zomnics', 7),
  (1087, 2, 6, 1, NULL, 'Sorry', 1),
  (1088, 2, 6, 1, NULL, 'Tea Time', 1),
  (1089, 2, 6, 1, NULL, 'Thanks', 1),
  (1090, 2, 6, 1, NULL, 'The Reapening', 7),
  (1091, 2, 6, 1, NULL, 'Victory', 1),
  (1092, 2, 6, 1, NULL, 'Well Played', 1),
  (1093, 5, 6, 1, NULL, 'Season 1 Competitor', 2), -- Competitive All Heroes Sprays
  (1094, 5, 6, 1, NULL, 'Season 1 Hero', 2),
  (1095, 5, 6, 1, NULL, 'Season 2 Competitor', 6),
  (1096, 5, 6, 1, NULL, 'Season 2 Hero', 6),
  (1097, 5, 6, 1, NULL, 'Season 3 Competitor', 10),
  (1098, 5, 6, 1, NULL, 'Season 3 Hero', 10),
  (1099, 7, 6, 1, NULL, '...Never Die', 7), -- Halloween Terror All Heroes Sprays
  (1100, 7, 6, 1, NULL, 'Bats', 7),
  (1101, 7, 6, 1, NULL, 'Boo!', 7),
  (1102, 7, 6, 1, NULL, 'Boop!', 7),
  (1103, 7, 6, 1, NULL, 'Candyball', 7),
  (1104, 7, 6, 1, NULL, 'Fangs', 7),
  (1105, 7, 6, 1, NULL, 'Gummy Hog', 7),
  (1106, 7, 6, 1, NULL, 'Halloween Special', 7),
  (1107, 7, 6, 1, NULL, 'Halloween Terror', 7),
  (1108, 7, 6, 1, NULL, 'Junkenstein''s Revenge', 7),
  (1109, 7, 6, 1, NULL, 'Pumpkins', 7),
  (1110, 7, 6, 1, NULL, 'Rise Of The Zomnics', 7),
  (1111, 7, 6, 1, NULL, 'The Reapening', 7),
  (1112, 7, 6, 1, NULL, 'Witch''s Brew', 7),
  (1113, 1, 6, 1, 1, 'Action', 3), -- Normal Ana Sprays
  (1114, 1, 6, 1, 1, 'Ana', 3),
  (1115, 1, 6, 1, 1, 'Bearer', 3),
  (1116, 1, 6, 1, 1, 'Cheer', 3),
  (1117, 1, 6, 1, 1, 'Cracked', 3),
  (1118, 1, 6, 1, 1, 'Eyepatch', 3),
  (1119, 1, 6, 1, 1, 'Fareeha', 3),
  (1120, 1, 6, 1, 1, 'Gaze', 3),
  (1121, 1, 6, 1, 1, 'Grenade', 3),
  (1122, 1, 6, 1, 1, 'Guardian', 3),
  (1123, 1, 6, 1, 1, 'Hesitation', 3),
  (1124, 1, 6, 1, 1, 'Icon', 3),
  (1125, 1, 6, 1, 1, 'Letter', 3),
  (1126, 1, 6, 1, 1, 'Old Soldier', 3),
  (1127, 1, 6, 1, 1, 'Overhead', 3),
  (1128, 1, 6, 1, 1, 'Photograph', 3),
  (1129, 1, 6, 1, 1, 'Rifle', 3),
  (1130, 1, 6, 1, 1, 'Shadow', 3),
  (1131, 1, 6, 1, 1, 'Shhh', 3),
  (1132, 1, 6, 1, 1, 'Sidearm', 3),
  (1133, 1, 6, 1, 1, 'Wedjat', 3),
  (1134, 1, 6, 1, 1, 'Wrist Launcher', 3),
  (1135, 1, 6, 1, 1, 'Zzz', 3),
  (1136, 2, 6, 1, 1, 'Cute', 3), -- Achievements Ana Sprays
  (1137, 2, 6, 1, 1, 'Pixel', 3),
  (1138, 6, 6, 1, 1, 'Shooting', 4), -- Summer Games Ana Sprays
  (1139, 7, 6, 1, 1, 'Trick Or Treat', 7), -- Halloween Terror Ana Sprays
  (1140, 1, 6, 1, 2, 'Action', 1), -- Normal Bastion Sprays
  (1141, 1, 6, 1, 2, 'Bird', 1),
  (1142, 1, 6, 1, 2, 'Birdwatchers', 1),
  (1143, 1, 6, 1, 2, 'Black', 1),
  (1144, 1, 6, 1, 2, 'Blocks', 1),
  (1145, 1, 6, 1, 2, 'Cannon', 1),
  (1146, 1, 6, 1, 2, 'Crisis', 1),
  (1147, 1, 6, 1, 2, 'Curious', 1),
  (1148, 1, 6, 1, 2, 'E54', 1),
  (1149, 1, 6, 1, 2, 'Fire At Will', 1),
  (1150, 1, 6, 1, 2, 'Flight', 1),
  (1151, 1, 6, 1, 2, 'Flower Power', 1),
  (1152, 1, 6, 1, 2, 'Ganymede', 1),
  (1153, 1, 6, 1, 2, 'Giant', 1),
  (1154, 1, 6, 1, 2, 'Icon', 1),
  (1155, 1, 6, 1, 2, 'In Repair', 1),
  (1156, 1, 6, 1, 2, 'Nest', 1),
  (1157, 1, 6, 1, 2, 'Omnic', 1),
  (1158, 1, 6, 1, 2, 'Overgrown', 1),
  (1159, 1, 6, 1, 2, 'Recovery', 1),
  (1160, 1, 6, 1, 2, 'Retro', 1),
  (1161, 1, 6, 1, 2, 'Sprout', 1),
  (1162, 1, 6, 1, 2, 'Wood And Stone', 1),
  (1163, 2, 6, 1, 2, 'Cute', 1), -- Achievements Bastion Sprays
  (1164, 2, 6, 1, 2, 'Pixel', 1),
  (1165, 6, 6, 1, 2, 'Boxing', 4), -- Summer Games Bastion Sprays
  (1166, 7, 6, 1, 2, 'Trick Or Treat', 7), -- Halloween Terror Bastion Sprays
  (1167, 1, 6, 1, 3, 'B.ny', 1), -- Normal D.Va Sprays
  (1168, 1, 6, 1, 3, 'Bang', 1),
  (1169, 1, 6, 1, 3, 'Bubble', 1),
  (1170, 1, 6, 1, 3, 'Bubble Gum', 1),
  (1171, 1, 6, 1, 3, 'Bunny Hop', 1),
  (1172, 1, 6, 1, 3, 'Diva', 1),
  (1173, 1, 6, 1, 3, 'GG', 1),
  (1174, 1, 6, 1, 3, 'Hana', 1),
  (1175, 1, 6, 1, 3, 'Headset', 1),
  (1176, 1, 6, 1, 3, 'Heart', 1),
  (1177, 1, 6, 1, 3, 'Icon', 1),
  (1178, 1, 6, 1, 3, 'Light Gun', 1),
  (1179, 1, 6, 1, 3, 'Love D.Va', 1),
  (1180, 1, 6, 1, 3, 'MEKA', 1),
  (1181, 1, 6, 1, 3, 'Nano Cola', 1),
  (1182, 1, 6, 1, 3, 'Photo', 1),
  (1183, 1, 6, 1, 3, 'Pixel Bunny', 1),
  (1184, 1, 6, 1, 3, 'Power Up!', 1),
  (1185, 1, 6, 1, 3, 'Salt', 1),
  (1186, 1, 6, 1, 3, 'Star', 1),
  (1187, 1, 6, 1, 3, 'Unload', 1),
  (1188, 1, 6, 1, 3, 'Walk Of Fame', 1),
  (1189, 1, 6, 1, 3, 'Watching', 1),
  (1190, 2, 6, 1, 3, 'Cute', 1), -- Achievements D.Va Sprays
  (1191, 2, 6, 1, 3, 'Pixel', 1),
  (1192, 6, 6, 1, 3, 'Cycling', 4), -- Summer Games D.Va Sprays
  (1193, 7, 6, 1, 3, 'Trick Or Treat', 7), -- Halloween Terror D.Va Sprays
  (1194, 1, 6, 1, 4, 'Assassin', 1), -- Normal Genji Sprays
  (1195, 1, 6, 1, 4, 'Dragon', 1),
  (1196, 1, 6, 1, 4, 'Dragonblade', 1),
  (1197, 1, 6, 1, 4, 'Draw', 1),
  (1198, 1, 6, 1, 4, 'Fully Loaded', 1),
  (1199, 1, 6, 1, 4, 'God Of War', 1),
  (1200, 1, 6, 1, 4, 'Green Ninja', 1),
  (1201, 1, 6, 1, 4, 'Icon', 1),
  (1202, 1, 6, 1, 4, 'Kaze No Gotoku', 1),
  (1203, 1, 6, 1, 4, 'Lunge', 1),
  (1204, 1, 6, 1, 4, 'Nin', 1),
  (1205, 1, 6, 1, 4, 'Onmyodo', 1),
  (1206, 1, 6, 1, 4, 'Prepared', 1),
  (1207, 1, 6, 1, 4, 'Ryugekiken', 1),
  (1208, 1, 6, 1, 4, 'Shimada', 1),
  (1209, 1, 6, 1, 4, 'Shuriken', 1),
  (1210, 1, 6, 1, 4, 'Signature', 1),
  (1211, 1, 6, 1, 4, 'Soul', 1),
  (1212, 1, 6, 1, 4, 'Stance', 1),
  (1213, 1, 6, 1, 4, 'Stoic', 1),
  (1214, 1, 6, 1, 4, 'Swords', 1),
  (1215, 1, 6, 1, 4, 'Target Practice', 1),
  (1216, 1, 6, 1, 4, 'Warrior', 1),
  (1217, 2, 6, 1, 4, 'Cute', 1), -- Achievements Genji Sprays
  (1218, 2, 6, 1, 4, 'Pixel', 1),
  (1219, 6, 6, 1, 4, 'Fencing', 4), -- Summer Games Genji Sprays
  (1220, 9, 6, 1, 4, 'Oni', 9), -- Blizzard Genji Sprays
  (1221, 7, 6, 1, 4, 'Trick Or Treat', 7), -- Halloween Terror Genji Sprays
  (1222, 1, 6, 1, 5, 'Archer', 1), -- Normal Hanzo Sprays
  (1223, 1, 6, 1, 5, 'Challenge', 1),
  (1224, 1, 6, 1, 5, 'Cloud', 1),
  (1225, 1, 6, 1, 5, 'Dragon', 1),
  (1226, 1, 6, 1, 5, 'Dragons', 1),
  (1227, 1, 6, 1, 5, 'Dragonstrike', 1),
  (1228, 1, 6, 1, 5, 'Drawn', 1),
  (1229, 1, 6, 1, 5, 'Duty', 1),
  (1230, 1, 6, 1, 5, 'Haori', 1),
  (1231, 1, 6, 1, 5, 'Icon', 1),
  (1232, 1, 6, 1, 5, 'Kneeling', 1),
  (1233, 1, 6, 1, 5, 'Kumo', 1),
  (1234, 1, 6, 1, 5, 'Moon', 1),
  (1235, 1, 6, 1, 5, 'Nin', 1),
  (1236, 1, 6, 1, 5, 'Sake', 1),
  (1237, 1, 6, 1, 5, 'Scarf', 1),
  (1238, 1, 6, 1, 5, 'Seal', 1),
  (1239, 1, 6, 1, 5, 'Spray', 1),
  (1240, 1, 6, 1, 5, 'Stoic', 1),
  (1241, 1, 6, 1, 5, 'Successor', 1),
  (1242, 1, 6, 1, 5, 'Tea', 1),
  (1243, 1, 6, 1, 5, 'Wanderer', 1),
  (1244, 1, 6, 1, 5, 'Yellow', 1),
  (1245, 2, 6, 1, 5, 'Cute', 1), -- Achievements Hanzo Sprays
  (1246, 2, 6, 1, 5, 'Pixel', 1),
  (1247, 6, 6, 1, 5, 'Archery', 4), -- Summer Games Hanzo Sprays
  (1248, 7, 6, 1, 5, 'Trick Or Treat', 7), -- Halloween Terror Hanzo Sprays
  (1249, 1, 6, 1, 6, 'Ahhhh!', 1), -- Normal Junkrat Sprays
  (1250, 1, 6, 1, 6, 'Bang Bang', 1),
  (1251, 1, 6, 1, 6, 'Crazy', 1),
  (1252, 1, 6, 1, 6, 'Fireball', 1),
  (1253, 1, 6, 1, 6, 'Firework', 1),
  (1254, 1, 6, 1, 6, 'For You', 1),
  (1255, 1, 6, 1, 6, 'Frag', 1),
  (1256, 1, 6, 1, 6, 'Fuse', 1),
  (1257, 1, 6, 1, 6, 'Grin', 1),
  (1258, 1, 6, 1, 6, 'Icon', 1),
  (1259, 1, 6, 1, 6, 'Junk', 1),
  (1260, 1, 6, 1, 6, 'Kaboom!', 1),
  (1261, 1, 6, 1, 6, 'Mad', 1),
  (1262, 1, 6, 1, 6, 'Mayhem', 1),
  (1263, 1, 6, 1, 6, 'Mine', 1),
  (1264, 1, 6, 1, 6, 'Minefield', 1),
  (1265, 1, 6, 1, 6, 'Rolling', 1),
  (1266, 1, 6, 1, 6, 'Smile', 1),
  (1267, 1, 6, 1, 6, 'Smoke', 1),
  (1268, 1, 6, 1, 6, 'Spin', 1),
  (1269, 1, 6, 1, 6, 'Trapper', 1),
  (1270, 1, 6, 1, 6, 'Vroom!!', 1),
  (1271, 1, 6, 1, 6, 'Wanted', 1),
  (1272, 2, 6, 1, 6, 'Cute', 1), -- Achievements Junkrat Sprays
  (1273, 2, 6, 1, 6, 'Pixel', 1),
  (1274, 6, 6, 1, 6, 'Tennis', 4), -- Summer Games Junkrat Sprays
  (1275, 7, 6, 1, 6, 'Trick Or Treat', 7), -- Halloween Terror Junkrat Sprays
  (1276, 1, 6, 1, 7, 'Acelerar', 1), -- Normal Lúcio Sprays
  (1277, 1, 6, 1, 7, 'Baixo', 1),
  (1278, 1, 6, 1, 7, 'Bass', 1),
  (1279, 1, 6, 1, 7, 'Break It Down', 1),
  (1280, 1, 6, 1, 7, 'Cereal', 1),
  (1281, 1, 6, 1, 7, 'Confident', 1),
  (1282, 1, 6, 1, 7, 'Deck', 1),
  (1283, 1, 6, 1, 7, 'Frog', 1),
  (1284, 1, 6, 1, 7, 'Grin', 1),
  (1285, 1, 6, 1, 7, 'Hero', 1),
  (1286, 1, 6, 1, 7, 'Icon', 1),
  (1287, 1, 6, 1, 7, 'In Concert', 1),
  (1288, 1, 6, 1, 7, 'Kambô', 1),
  (1289, 1, 6, 1, 7, 'Mural', 1),
  (1290, 1, 6, 1, 7, 'Scratch', 1),
  (1291, 1, 6, 1, 7, 'Signature', 1),
  (1292, 1, 6, 1, 7, 'Spin', 1),
  (1293, 1, 6, 1, 7, 'Tag', 1),
  (1294, 1, 6, 1, 7, 'Triplo', 1),
  (1295, 1, 6, 1, 7, 'Under Control', 1),
  (1296, 1, 6, 1, 7, 'Vinyl', 1),
  (1297, 1, 6, 1, 7, 'Walk Of Fame', 1),
  (1298, 1, 6, 1, 7, 'Wave', 1),
  (1299, 2, 6, 1, 7, 'Cute', 1), -- Achievements Lúcio Sprays
  (1300, 2, 6, 1, 7, 'Pixel', 1),
  (1301, 6, 6, 1, 7, 'Football', 4), -- Summer Games Lúcio Sprays
  (1302, 7, 6, 1, 7, 'Trick Or Treat', 7), -- Halloween Terror Lúcio Sprays
  (1303, 1, 6, 1, 8, 'Badge', 1), -- Normal McCree Sprays
  (1304, 1, 6, 1, 8, 'BAMF', 1),
  (1305, 1, 6, 1, 8, 'Bang!', 1),
  (1306, 1, 6, 1, 8, 'Buckle', 1),
  (1307, 1, 6, 1, 8, 'Bullet', 1),
  (1308, 1, 6, 1, 8, 'Deadeye', 1),
  (1309, 1, 6, 1, 8, 'Draw', 1),
  (1310, 1, 6, 1, 8, 'Enigma', 1),
  (1311, 1, 6, 1, 8, 'Gunslinger', 1),
  (1312, 1, 6, 1, 8, 'High Noon', 1),
  (1313, 1, 6, 1, 8, 'Icon', 1),
  (1314, 1, 6, 1, 8, 'Jesse', 1),
  (1315, 1, 6, 1, 8, 'Noose', 1),
  (1316, 1, 6, 1, 8, 'Outlaw', 1),
  (1317, 1, 6, 1, 8, 'Skull', 1),
  (1318, 1, 6, 1, 8, 'Spin', 1),
  (1319, 1, 6, 1, 8, 'Take It Easy', 1),
  (1320, 1, 6, 1, 8, 'Target', 1),
  (1321, 1, 6, 1, 8, 'The Name''s', 1),
  (1322, 1, 6, 1, 8, 'Thumbs Up', 1),
  (1323, 1, 6, 1, 8, 'Tumbleweed', 1),
  (1324, 1, 6, 1, 8, 'Wanted', 1),
  (1325, 1, 6, 1, 8, 'Your Face Here', 1),
  (1326, 2, 6, 1, 8, 'Cute', 1), -- Achievements McCree Sprays
  (1327, 2, 6, 1, 8, 'Pixel', 1),
  (1328, 6, 6, 1, 8, 'Equestrian', 4), -- Summer Games McCree Sprays
  (1329, 7, 6, 1, 8, 'Trick Or Treat', 7), -- Halloween Terror McCree Sprays
  (1330, 1, 6, 1, 9, '^_^', 1), -- Normal Mei Sprays
  (1331, 1, 6, 1, 9, '>_<', 1),
  (1332, 1, 6, 1, 9, 'Beat The Heat', 1),
  (1333, 1, 6, 1, 9, 'Blaster', 1),
  (1334, 1, 6, 1, 9, 'Carefree', 1),
  (1335, 1, 6, 1, 9, 'Casual', 1),
  (1336, 1, 6, 1, 9, 'Confident', 1),
  (1337, 1, 6, 1, 9, 'Dizzy', 1),
  (1338, 1, 6, 1, 9, 'Explorer', 1),
  (1339, 1, 6, 1, 9, 'Eyes', 1),
  (1340, 1, 6, 1, 9, 'Hairpin', 1),
  (1341, 1, 6, 1, 9, 'Icon', 1),
  (1342, 1, 6, 1, 9, 'Mei''s Journal', 1),
  (1343, 1, 6, 1, 9, 'Popsicle', 1),
  (1344, 1, 6, 1, 9, 'Print', 1),
  (1345, 1, 6, 1, 9, 'Reading', 1),
  (1346, 1, 6, 1, 9, 'Sketch', 1),
  (1347, 1, 6, 1, 9, 'Smile', 1),
  (1348, 1, 6, 1, 9, 'Snow Art', 1),
  (1349, 1, 6, 1, 9, 'Snowball', 1),
  (1350, 1, 6, 1, 9, 'Snowman', 1),
  (1351, 1, 6, 1, 9, 'Soft Serve', 1),
  (1352, 1, 6, 1, 9, 'Walled', 1),
  (1353, 2, 6, 1, 9, 'Cute', 1), -- Achievements Mei Sprays
  (1354, 2, 6, 1, 9, 'Pixel', 1),
  (1355, 6, 6, 1, 9, 'Table Tennis', 4), -- Summer Games Mei Sprays
  (1356, 7, 6, 1, 9, 'Trick Or Treat', 7), -- Halloween Terror Mei Sprays
  (1357, 1, 6, 1, 10, 'Arrow', 1), -- Normal Mercy Sprays
  (1358, 1, 6, 1, 10, 'Bandage', 1),
  (1359, 1, 6, 1, 10, 'Battle Ready', 1),
  (1360, 1, 6, 1, 10, 'Blaster', 1),
  (1361, 1, 6, 1, 10, 'Emblem', 1),
  (1362, 1, 6, 1, 10, 'Gauze', 1),
  (1363, 1, 6, 1, 10, 'Halo', 1),
  (1364, 1, 6, 1, 10, 'Heroes Never Die', 1),
  (1365, 1, 6, 1, 10, 'Huge Rez!!', 1),
  (1366, 1, 6, 1, 10, 'Icon', 1),
  (1367, 1, 6, 1, 10, 'Light', 1),
  (1368, 1, 6, 1, 10, 'Medic', 1),
  (1369, 1, 6, 1, 10, 'On Call', 1),
  (1370, 1, 6, 1, 10, 'Patched Up', 1),
  (1371, 1, 6, 1, 10, 'Resurrect', 1),
  (1372, 1, 6, 1, 10, 'Smile', 1),
  (1373, 1, 6, 1, 10, 'Stethoscope', 1),
  (1374, 1, 6, 1, 10, 'Sting', 1),
  (1375, 1, 6, 1, 10, 'Support', 1),
  (1376, 1, 6, 1, 10, 'Swiss', 1),
  (1377, 1, 6, 1, 10, 'Valkyrie', 1),
  (1378, 1, 6, 1, 10, 'Wings', 1),
  (1379, 1, 6, 1, 10, 'Ziegler', 1),
  (1380, 2, 6, 1, 10, 'Cute', 1), -- Achievements Mercy Sprays
  (1381, 2, 6, 1, 10, 'Pixel', 1),
  (1382, 6, 6, 1, 10, 'Badminton', 4), -- Summer Games Mercy Sprays
  (1383, 7, 6, 1, 10, 'Trick Or Treat', 7), -- Halloween Terror Mercy Sprays
  (1384, 1, 6, 1, 11, 'Aerial Superiority', 1), -- Normal Pharah Sprays
  (1385, 1, 6, 1, 11, 'Amari', 1),
  (1386, 1, 6, 1, 11, 'Ana', 1),
  (1387, 1, 6, 1, 11, 'Cobra', 1),
  (1388, 1, 6, 1, 11, 'Concussive Blast', 1),
  (1389, 1, 6, 1, 11, 'Guardian', 1),
  (1390, 1, 6, 1, 11, 'Hieroglyph', 1),
  (1391, 1, 6, 1, 11, 'Icon', 1),
  (1392, 1, 6, 1, 11, 'Incoming', 1),
  (1393, 1, 6, 1, 11, 'Justice...', 1),
  (1394, 1, 6, 1, 11, 'On Guard', 1),
  (1395, 1, 6, 1, 11, 'Play Pharah', 1),
  (1396, 1, 6, 1, 11, 'Raptora', 1),
  (1397, 1, 6, 1, 11, 'Rocket Jump', 1),
  (1398, 1, 6, 1, 11, 'Rocket Launcher', 1),
  (1399, 1, 6, 1, 11, 'Salute', 1),
  (1400, 1, 6, 1, 11, 'Scarab', 1),
  (1401, 1, 6, 1, 11, 'Statue', 1),
  (1402, 1, 6, 1, 11, 'Stone', 1),
  (1403, 1, 6, 1, 11, 'Tattoo', 1),
  (1404, 1, 6, 1, 11, 'Wedjat', 1),
  (1405, 1, 6, 1, 11, 'Wings', 1),
  (1406, 1, 6, 1, 11, 'Wrist Launcher', 1),
  (1407, 2, 6, 1, 11, 'Cute', 1), -- Achievements Pharah Sprays
  (1408, 2, 6, 1, 11, 'Pixel', 1),
  (1409, 6, 6, 1, 11, 'Basketball', 4), -- Summer Games Pharah Sprays
  (1410, 7, 6, 1, 11, 'Trick Or Treat', 7), -- Halloween Terror Pharah Sprays
  (1411, 1, 6, 1, 12, 'Blackwatch', 1), -- Normal Reaper Sprays
  (1412, 1, 6, 1, 12, 'Blossom', 1),
  (1413, 1, 6, 1, 12, 'Cloaked', 1),
  (1414, 1, 6, 1, 12, 'Death Blossom', 1),
  (1415, 1, 6, 1, 12, 'Death Comes', 1),
  (1416, 1, 6, 1, 12, 'Die Die Die', 1),
  (1417, 1, 6, 1, 12, 'Everywhere', 1),
  (1418, 1, 6, 1, 12, 'Grave', 1),
  (1419, 1, 6, 1, 12, 'Hellfire', 1),
  (1420, 1, 6, 1, 12, 'Hooded', 1),
  (1421, 1, 6, 1, 12, 'Horns', 1),
  (1422, 1, 6, 1, 12, 'Icon', 1),
  (1423, 1, 6, 1, 12, 'Oops', 1),
  (1424, 1, 6, 1, 12, 'Psst', 1),
  (1425, 1, 6, 1, 12, 'Reap On', 1),
  (1426, 1, 6, 1, 12, 'Reaping', 1),
  (1427, 1, 6, 1, 12, 'Revenge', 1),
  (1428, 1, 6, 1, 12, 'Scythes', 1),
  (1429, 1, 6, 1, 12, 'Shadow', 1),
  (1430, 1, 6, 1, 12, 'Shadow Step', 1),
  (1431, 1, 6, 1, 12, 'Silent', 1),
  (1432, 1, 6, 1, 12, 'Soul Globe', 1),
  (1433, 1, 6, 1, 12, 'Time To Kill', 1),
  (1434, 2, 6, 1, 12, 'Cute', 1), -- Achievements Reaper Sprays
  (1435, 2, 6, 1, 12, 'Pixel', 1),
  (1436, 6, 6, 1, 12, 'BMX', 4), -- Summer Games Reaper Sprays
  (1437, 7, 6, 1, 12, 'Trick Or Treat', 7), -- Halloween Terror Reaper Sprays
  (1438, 1, 6, 1, 13, 'Barrier', 1), -- Normal Reinhardt Sprays
  (1439, 1, 6, 1, 13, 'Charge', 1),
  (1440, 1, 6, 1, 13, 'Cracks', 1),
  (1441, 1, 6, 1, 13, 'Crusader', 1),
  (1442, 1, 6, 1, 13, 'Earthshatter', 1),
  (1443, 1, 6, 1, 13, 'Emblem', 1),
  (1444, 1, 6, 1, 13, 'Fire Strike', 1),
  (1445, 1, 6, 1, 13, 'Glorious', 1),
  (1446, 1, 6, 1, 13, 'Hammer Down', 1),
  (1447, 1, 6, 1, 13, 'Helm', 1),
  (1448, 1, 6, 1, 13, 'Honor', 1),
  (1449, 1, 6, 1, 13, 'Icon', 1),
  (1450, 1, 6, 1, 13, 'Knight', 1),
  (1451, 1, 6, 1, 13, 'Lion', 1),
  (1452, 1, 6, 1, 13, 'Roar', 1),
  (1453, 1, 6, 1, 13, 'Royal', 1),
  (1454, 1, 6, 1, 13, 'Shield Up', 1),
  (1455, 1, 6, 1, 13, 'Stein', 1),
  (1456, 1, 6, 1, 13, 'Swing', 1),
  (1457, 1, 6, 1, 13, 'Vigilant', 1),
  (1458, 1, 6, 1, 13, 'White', 1),
  (1459, 1, 6, 1, 13, 'Wilhelm', 1),
  (1460, 1, 6, 1, 13, 'Wrestle', 1),
  (1461, 2, 6, 1, 13, 'Cute', 1), -- Achievements Reinhardt Sprays
  (1462, 2, 6, 1, 13, 'Pixel', 1),
  (1463, 6, 6, 1, 13, 'Wrestling', 4), -- Summer Games Reinhardt Sprays
  (1464, 7, 6, 1, 13, 'Trick Or Treat', 7), -- Halloween Terror Reinhardt Sprays
  (1465, 1, 6, 1, 14, 'Breathin''', 1), -- Normal Roadhog Sprays
  (1466, 1, 6, 1, 14, 'Deep Thoughts', 1),
  (1467, 1, 6, 1, 14, 'Emblem', 1),
  (1468, 1, 6, 1, 14, 'Eyes', 1),
  (1469, 1, 6, 1, 14, 'Free Pig', 1),
  (1470, 1, 6, 1, 14, 'Fresh Meat', 1),
  (1471, 1, 6, 1, 14, 'Gotcha', 1),
  (1472, 1, 6, 1, 14, 'Grand Theft', 1),
  (1473, 1, 6, 1, 14, 'Helmet', 1),
  (1474, 1, 6, 1, 14, 'Here Piggy', 1),
  (1475, 1, 6, 1, 14, 'Hogpower', 1),
  (1476, 1, 6, 1, 14, 'Hooked', 1),
  (1477, 1, 6, 1, 14, 'Icon', 1),
  (1478, 1, 6, 1, 14, 'Left', 1),
  (1479, 1, 6, 1, 14, 'License', 1),
  (1480, 1, 6, 1, 14, 'Mako', 1),
  (1481, 1, 6, 1, 14, 'No Pork', 1),
  (1482, 1, 6, 1, 14, 'Piggy', 1),
  (1483, 1, 6, 1, 14, 'Popper', 1),
  (1484, 1, 6, 1, 14, 'Tails', 1),
  (1485, 1, 6, 1, 14, 'Toxic', 1),
  (1486, 1, 6, 1, 14, 'Wanted', 1),
  (1487, 1, 6, 1, 14, 'Wild Hog', 1),
  (1488, 2, 6, 1, 14, 'Cute', 1), -- Achievements Roadhog Sprays
  (1489, 2, 6, 1, 14, 'Pixel', 1),
  (1490, 6, 6, 1, 14, 'Diving', 4), -- Summer Games Roadhog Sprays
  (1491, 7, 6, 1, 14, 'Trick Or Treat', 7), -- Halloween Terror Roadhog Sprays
  (1492, 1, 6, 1, 15, '76', 1), -- Normal Soldier: 76 Sprays
  (1493, 1, 6, 1, 15, 'All Soldiers', 1),
  (1494, 1, 6, 1, 15, 'American Hero', 1),
  (1495, 1, 6, 1, 15, 'Coin', 1),
  (1496, 1, 6, 1, 15, 'Grave', 1),
  (1497, 1, 6, 1, 15, 'Grizzled', 1),
  (1498, 1, 6, 1, 15, 'Heal Up', 1),
  (1499, 1, 6, 1, 15, 'Helix', 1),
  (1500, 1, 6, 1, 15, 'Hooah', 1),
  (1501, 1, 6, 1, 15, 'Icon', 1),
  (1502, 1, 6, 1, 15, 'Jacket: 76', 1),
  (1503, 1, 6, 1, 15, 'Move!', 1),
  (1504, 1, 6, 1, 15, 'Muzzle', 1),
  (1505, 1, 6, 1, 15, 'Old Soldier', 1),
  (1506, 1, 6, 1, 15, 'Pulse Rifle', 1),
  (1507, 1, 6, 1, 15, 'Resolute', 1),
  (1508, 1, 6, 1, 15, 'Rifle: 76', 1),
  (1509, 1, 6, 1, 15, 'Rockets', 1),
  (1510, 1, 6, 1, 15, 'Salute', 1),
  (1511, 1, 6, 1, 15, 'Strike Commander', 1),
  (1512, 1, 6, 1, 15, 'Vigilante', 1),
  (1513, 1, 6, 1, 15, 'Visor', 1),
  (1514, 1, 6, 1, 15, 'Wanted', 1),
  (1515, 2, 6, 1, 15, 'Cute', 1), -- Achievements Soldier: 76 Sprays
  (1516, 2, 6, 1, 15, 'Pixel', 1),
  (1517, 6, 6, 1, 15, 'Golf', 4), -- Summer Games Soldier: 76 Sprays
  (1518, 7, 6, 1, 15, 'Trick Or Treat', 7), -- Halloween Terror Soldier: 76 Sprays
  (1519, 1, 6, 1, 16, 'Agent', 1), -- Normal Symmetra Sprays
  (1520, 1, 6, 1, 16, 'Architect', 1),
  (1521, 1, 6, 1, 16, 'Behold', 1),
  (1522, 1, 6, 1, 16, 'Blueprint', 1),
  (1523, 1, 6, 1, 16, 'Builder', 1),
  (1524, 1, 6, 1, 16, 'Car Wash', 1),
  (1525, 1, 6, 1, 16, 'Caution', 1),
  (1526, 1, 6, 1, 16, 'Design', 1),
  (1527, 1, 6, 1, 16, 'Glove', 1),
  (1528, 1, 6, 1, 16, 'Icon', 1),
  (1529, 1, 6, 1, 16, 'Light', 1),
  (1530, 1, 6, 1, 16, 'Lines', 1),
  (1531, 1, 6, 1, 16, 'Lotus', 1),
  (1532, 1, 6, 1, 16, 'Pose', 1),
  (1533, 1, 6, 1, 16, 'Projector', 1),
  (1534, 1, 6, 1, 16, 'Satya', 1),
  (1535, 1, 6, 1, 16, 'Superior', 1),
  (1536, 1, 6, 1, 16, 'The Path', 1),
  (1537, 1, 6, 1, 16, 'Vaswani', 1),
  (1538, 1, 6, 1, 16, 'Vishkar', 1),
  (1539, 1, 6, 1, 16, 'Visor', 1),
  (1540, 1, 6, 1, 16, 'Weaver', 1),
  (1541, 1, 6, 1, 16, 'Will', 1),
  (1542, 2, 6, 1, 16, 'Cute', 1), -- Achievements Symmetra Sprays
  (1543, 2, 6, 1, 16, 'Pixel', 1),
  (1544, 6, 6, 1, 16, 'Rythmic', 4), -- Summer Games Symmetra Sprays
  (1545, 7, 6, 1, 16, 'Trick Or Treat', 7), -- Halloween Terror Symmetra Sprays
  (1546, 1, 6, 1, 17, 'Armor', 1), -- Normal Torbjörn Sprays
  (1547, 1, 6, 1, 17, 'Beard', 1),
  (1548, 1, 6, 1, 17, 'Catch A Ride', 1),
  (1549, 1, 6, 1, 17, 'Chef', 1),
  (1550, 1, 6, 1, 17, 'Claw', 1),
  (1551, 1, 6, 1, 17, 'Fix It Up', 1),
  (1552, 1, 6, 1, 17, 'Forged', 1),
  (1553, 1, 6, 1, 17, 'Gears', 1),
  (1554, 1, 6, 1, 17, 'Get Ready', 1),
  (1555, 1, 6, 1, 17, 'Hammer', 1),
  (1556, 1, 6, 1, 17, 'Hot', 1),
  (1557, 1, 6, 1, 17, 'Icon', 1),
  (1558, 1, 6, 1, 17, 'Ironclad', 1),
  (1559, 1, 6, 1, 17, 'Kanon', 1),
  (1560, 1, 6, 1, 17, 'Mask', 1),
  (1561, 1, 6, 1, 17, 'Molten Core', 1),
  (1562, 1, 6, 1, 17, 'Ready To Work', 1),
  (1563, 1, 6, 1, 17, 'Run!', 1),
  (1564, 1, 6, 1, 17, 'Smält', 1),
  (1565, 1, 6, 1, 17, 'Stoic', 1),
  (1566, 1, 6, 1, 17, 'Turret', 1),
  (1567, 1, 6, 1, 17, 'Turrets', 1),
  (1568, 1, 6, 1, 17, 'Uppgradera', 1),
  (1569, 2, 6, 1, 17, 'Cute', 1), -- Achievements Torbjörn Sprays
  (1570, 2, 6, 1, 17, 'Pixel', 1),
  (1571, 6, 6, 1, 17, 'Water Polo', 4), -- Summer Games Torbjörn Sprays
  (1572, 7, 6, 1, 17, 'Trick Or Treat', 7), -- Halloween Terror Torbjörn Sprays
  (1573, 1, 6, 1, 18, 'Blink', 1), -- Normal Tracer Sprays
  (1574, 1, 6, 1, 18, 'Bomb''s Away!', 1),
  (1575, 1, 6, 1, 18, 'Cavalry''s Here', 1),
  (1576, 1, 6, 1, 18, 'Cheers', 1),
  (1577, 1, 6, 1, 18, 'Cheers, Love', 1),
  (1578, 1, 6, 1, 18, 'Clock''s Tickin''', 1),
  (1579, 1, 6, 1, 18, 'Confident', 1),
  (1580, 1, 6, 1, 18, 'Fighter', 1),
  (1581, 1, 6, 1, 18, 'Icon', 1),
  (1582, 1, 6, 1, 18, 'Kneeling', 1),
  (1583, 1, 6, 1, 18, 'Lena', 1),
  (1584, 1, 6, 1, 18, 'Orange', 1),
  (1585, 1, 6, 1, 18, 'Pew! Pew! Pew!', 1),
  (1586, 1, 6, 1, 18, 'Pistols', 1),
  (1587, 1, 6, 1, 18, 'Portrait', 1),
  (1588, 1, 6, 1, 18, 'Poster', 1),
  (1589, 1, 6, 1, 18, 'Pulse Bomb', 1),
  (1590, 1, 6, 1, 18, 'Ready For Action', 1),
  (1591, 1, 6, 1, 18, 'Salute', 1),
  (1592, 1, 6, 1, 18, 'Shaded', 1),
  (1593, 1, 6, 1, 18, 'Tagged', 1),
  (1594, 1, 6, 1, 18, 'Watcha'' Lookin'' At?', 1),
  (1595, 1, 6, 1, 18, 'Wings', 1),
  (1596, 2, 6, 1, 18, 'Cute', 1), -- Achievements Tracer Sprays
  (1597, 2, 6, 1, 18, 'Pixel', 1),
  (1598, 6, 6, 1, 18, 'Track', 4), -- Summer Games Tracer Sprays
  (1599, 7, 6, 1, 18, 'Trick Or Treat', 7), -- Halloween Terror Tracer Sprays
  (1600, 1, 6, 1, 19, 'Baiser', 1), -- Normal Widowmaker Sprays
  (1601, 1, 6, 1, 19, 'Black Widow', 1),
  (1602, 1, 6, 1, 19, 'Blood', 1),
  (1603, 1, 6, 1, 19, 'Crouch', 1),
  (1604, 1, 6, 1, 19, 'Detected', 1),
  (1605, 1, 6, 1, 19, 'Emblem', 1),
  (1606, 1, 6, 1, 19, 'Gaze', 1),
  (1607, 1, 6, 1, 19, 'Hourglass', 1),
  (1608, 1, 6, 1, 19, 'Icon', 1),
  (1609, 1, 6, 1, 19, 'In My Sights', 1),
  (1610, 1, 6, 1, 19, 'Je Te Vois', 1),
  (1611, 1, 6, 1, 19, 'Kneeling', 1),
  (1612, 1, 6, 1, 19, 'No One Escapes', 1),
  (1613, 1, 6, 1, 19, 'Noire', 1),
  (1614, 1, 6, 1, 19, 'Portrait', 1),
  (1615, 1, 6, 1, 19, 'Scope', 1),
  (1616, 1, 6, 1, 19, 'Sniper', 1),
  (1617, 1, 6, 1, 19, 'Spider', 1),
  (1618, 1, 6, 1, 19, 'Swing', 1),
  (1619, 1, 6, 1, 19, 'Une Balle', 1),
  (1620, 1, 6, 1, 19, 'Veuve', 1),
  (1621, 1, 6, 1, 19, 'Widow', 1),
  (1622, 1, 6, 1, 19, 'Widow''s Kiss', 1),
  (1623, 2, 6, 1, 19, 'Cute', 1), -- Achievements Widowmaker Sprays
  (1624, 2, 6, 1, 19, 'Pixel', 1),
  (1625, 6, 6, 1, 19, 'Gymnastics', 4), -- Summer Games Widowmaker Sprays
  (1626, 7, 6, 1, 19, 'Trick Or Treat', 7), -- Halloween Terror Widowmaker Sprays
  (1627, 1, 6, 1, 20, 'Angry', 1), -- Normal Winston Sprays
  (1628, 1, 6, 1, 20, 'Ape Crossing', 1),
  (1629, 1, 6, 1, 20, 'Baby', 1),
  (1630, 1, 6, 1, 20, 'Banana', 1),
  (1631, 1, 6, 1, 20, 'Explorer', 1),
  (1632, 1, 6, 1, 20, 'Fastball', 1),
  (1633, 1, 6, 1, 20, 'Harold', 1),
  (1634, 1, 6, 1, 20, 'Horizon', 1),
  (1635, 1, 6, 1, 20, 'Icon', 1),
  (1636, 1, 6, 1, 20, 'Lexigrams', 1),
  (1637, 1, 6, 1, 20, 'Lightning', 1),
  (1638, 1, 6, 1, 20, 'Mine!', 1),
  (1639, 1, 6, 1, 20, 'PB', 1),
  (1640, 1, 6, 1, 20, 'Primal Rage', 1),
  (1641, 1, 6, 1, 20, 'Q.E.D.', 1),
  (1642, 1, 6, 1, 20, 'Rage', 1),
  (1643, 1, 6, 1, 20, 'Research', 1),
  (1644, 1, 6, 1, 20, 'Roar', 1),
  (1645, 1, 6, 1, 20, 'Science!', 1),
  (1646, 1, 6, 1, 20, 'Serious', 1),
  (1647, 1, 6, 1, 20, 'Swing', 1),
  (1648, 1, 6, 1, 20, 'White', 1),
  (1649, 1, 6, 1, 20, 'Wow', 1),
  (1650, 2, 6, 1, 20, 'Cute', 1), -- Achievements Winston Sprays
  (1651, 2, 6, 1, 20, 'Pixel', 1),
  (1652, 6, 6, 1, 20, 'Volleyball', 4), -- Summer Games Winston Sprays
  (1653, 7, 6, 1, 20, 'Trick Or Treat', 7), -- Halloween Terror Winston Sprays
  (1654, 1, 6, 1, 21, '512', 1), -- Normal Zarya Sprays
  (1655, 1, 6, 1, 21, 'Alexandra', 1),
  (1656, 1, 6, 1, 21, 'Avenger', 1),
  (1657, 1, 6, 1, 21, 'Barrier', 1),
  (1658, 1, 6, 1, 21, 'Bear', 1),
  (1659, 1, 6, 1, 21, 'Cannon', 1),
  (1660, 1, 6, 1, 21, 'Champion', 1),
  (1661, 1, 6, 1, 21, 'Defender', 1),
  (1662, 1, 6, 1, 21, 'Focused', 1),
  (1663, 1, 6, 1, 21, 'For The People', 1),
  (1664, 1, 6, 1, 21, 'Gun Show', 1),
  (1665, 1, 6, 1, 21, 'Icon', 1),
  (1666, 1, 6, 1, 21, 'Lift', 1),
  (1667, 1, 6, 1, 21, 'Pink', 1),
  (1668, 1, 6, 1, 21, 'Pumped', 1),
  (1669, 1, 6, 1, 21, 'Shield', 1),
  (1670, 1, 6, 1, 21, 'Smile', 1),
  (1671, 1, 6, 1, 21, 'Strength', 1),
  (1672, 1, 6, 1, 21, 'Surge', 1),
  (1673, 1, 6, 1, 21, 'Tobelstein', 1),
  (1674, 1, 6, 1, 21, 'We Are Strong', 1),
  (1675, 1, 6, 1, 21, 'Weights', 1),
  (1676, 1, 6, 1, 21, 'Wrestle', 1),
  (1677, 2, 6, 1, 21, 'Cute', 1), -- Achievements Zarya Sprays
  (1678, 2, 6, 1, 21, 'Pixel', 1),
  (1679, 6, 6, 1, 21, 'Weightlifting', 4), -- Summer Games Zarya Sprays
  (1680, 7, 6, 1, 21, 'Trick Or Treat', 7), -- Halloween Terror Zarya Sprays
  (1681, 1, 6, 1, 22, 'Adorable', 1), -- Normal Zenyatta Sprays
  (1682, 1, 6, 1, 22, 'Aura', 1),
  (1683, 1, 6, 1, 22, 'Balance', 1),
  (1684, 1, 6, 1, 22, 'Contemplative', 1),
  (1685, 1, 6, 1, 22, 'Discord', 1),
  (1686, 1, 6, 1, 22, 'Enlightened', 1),
  (1687, 1, 6, 1, 22, 'Fist Bump', 1),
  (1688, 1, 6, 1, 22, 'Flow', 1),
  (1689, 1, 6, 1, 22, 'Foot', 1),
  (1690, 1, 6, 1, 22, 'Graphic', 1),
  (1691, 1, 6, 1, 22, 'Guru', 1),
  (1692, 1, 6, 1, 22, 'Hand', 1),
  (1693, 1, 6, 1, 22, 'Harmony', 1),
  (1694, 1, 6, 1, 22, 'Icon', 1),
  (1695, 1, 6, 1, 22, 'Inner Fire', 1),
  (1696, 1, 6, 1, 22, 'Nine', 1),
  (1697, 1, 6, 1, 22, 'Orb', 1),
  (1698, 1, 6, 1, 22, 'Orbs', 1),
  (1699, 1, 6, 1, 22, 'Peace', 1),
  (1700, 1, 6, 1, 22, 'Taunt', 1),
  (1701, 1, 6, 1, 22, 'Tekhartha', 1),
  (1702, 1, 6, 1, 22, 'Throw', 1),
  (1703, 1, 6, 1, 22, 'Together', 1),
  (1704, 2, 6, 1, 22, 'Cute', 1), -- Achievements Zenyatta Sprays
  (1705, 2, 6, 1, 22, 'Pixel', 1),
  (1706, 6, 6, 1, 22, 'Taekwondo', 4), -- Summer Games Zenyatta Sprays
  (1707, 7, 6, 1, 22, 'Trick Or Treat', 7), -- Halloween Terror Zenyatta Sprays
  (1708, 1, 6, 1, 23, '5kull', 9), -- Normal Sombra Sprays
  (1709, 1, 6, 1, 23, 'Agent', 9),
  (1710, 1, 6, 1, 23, 'Behind You', 9),
  (1711, 1, 6, 1, 23, 'Calavera', 9),
  (1712, 1, 6, 1, 23, 'Deaf-Mute', 9),
  (1713, 1, 6, 1, 23, 'Eyes', 9),
  (1714, 1, 6, 1, 23, 'Hacked', 9),
  (1715, 1, 6, 1, 23, 'Hacked The Moon', 9),
  (1716, 1, 6, 1, 23, 'Hacker', 9),
  (1717, 1, 6, 1, 23, 'Icon', 9),
  (1718, 1, 6, 1, 23, 'Illusive', 9),
  (1719, 1, 6, 1, 23, 'Key', 9),
  (1720, 1, 6, 1, 23, 'Machine Pistol', 9),
  (1721, 1, 6, 1, 23, 'Marionette', 9),
  (1722, 1, 6, 1, 23, 'Neural', 9),
  (1723, 1, 6, 1, 23, 'Power', 9),
  (1724, 1, 6, 1, 23, 'Puzzle', 9),
  (1725, 1, 6, 1, 23, 'Skull', 9),
  (1726, 1, 6, 1, 23, 'Skycode', 9),
  (1727, 1, 6, 1, 23, 'Superior', 9),
  (1728, 1, 6, 1, 23, 'Tagged', 9),
  (1729, 1, 6, 1, 23, 'Translocator', 9),
  (1730, 1, 6, 1, 23, 'Unlocked', 9),
  (1731, 1, 6, 1, 23, 'Virus', 9),
  (1732, 1, 6, 1, 23, 'Web', 9),
  (1733, 1, 6, 1, 23, '¿Quién?', 9),
  (1734, 2, 6, 1, 23, 'Cute', 9), -- Achievements Sombra Sprays
  (1735, 2, 6, 1, 23, 'Pixel', 9),
  -- Highlight Intros
  (1736, NULL, 7, NULL, 1, 'Heroic', 3), -- Default Ana Highlight Intros
  (1737, 1, 7, 3, 1, 'Guardian', 3), -- Normal Ana Highlight Intros
  (1738, 1, 7, 3, 1, 'Locked On', 3),
  (1739, 1, 7, 3, 1, 'Shh...', 3),
  (1740, NULL, 7, NULL, 2, 'Heroic', 1), -- Default Bastion Highlight Intros
  (1741, 1, 7, 3, 2, 'Bullet Rain', 1), -- Normal Bastion Highlight Intros
  (1742, 1, 7, 3, 2, 'Ganymede', 1),
  (1743, 1, 7, 3, 2, 'On Guard', 1),
  (1744, NULL, 7, NULL, 3, 'Heroic', 1), -- Default D.Va Highlight Intros
  (1745, 1, 7, 3, 3, 'Eject', 1), -- Normal D.Va Highlight Intros
  (1746, 1, 7, 3, 3, 'Lying Around', 1),
  (1747, 1, 7, 3, 3, 'Meka Activated', 1),
  (1748, NULL, 7, NULL, 4, 'Heroic', 1), -- Default Genji Highlight Intros
  (1749, 1, 7, 3, 4, 'Shuriken', 1), -- Normal Genji Highlight Intros
  (1750, 1, 7, 3, 4, 'Unsheathing The Sword', 1),
  (1751, 1, 7, 3, 4, 'Warrior''s Salute', 1),
  (1752, 7, 7, 3, 4, 'Pumpkin Carving', 7), -- Halloween Terror Genji Highlight Intros
  (1753, NULL, 7, NULL, 5, 'Heroic', 1), -- Default Hanzo Highlight Intros
  (1754, 1, 7, 3, 5, 'Backflip', 1), -- Normal Hanzo Highlight Intros
  (1755, 1, 7, 3, 5, 'My Aim Is True', 1),
  (1756, 1, 7, 3, 5, 'Superior', 1),
  (1757, NULL, 7, NULL, 6, 'Heroic', 1), -- Default Junkrat Highlight Intros
  (1758, 1, 7, 3, 6, 'I''m Flying', 1), -- Normal Junkrat Highlight Intros
  (1759, 1, 7, 3, 6, 'Rip-Tire', 1),
  (1760, 1, 7, 3, 6, 'Unfortunate', 1),
  (1761, 6, 7, 3, 6, 'Shotput', 4), -- Summer Games Junkrat Highlight Intros
  (1762, NULL, 7, NULL, 7, 'Heroic', 1), -- Default Lúcio Highlight Intros
  (1763, 1, 7, 3, 7, 'Drop The Beat', 1), -- Normal Lúcio Highlight Intros
  (1764, 1, 7, 3, 7, 'Freestyle', 1),
  (1765, 1, 7, 3, 7, 'In The Groove', 1),
  (1766, 1, 7, 3, 7, 'Bicycle Kick', 1), -- Summer Games Lúcio Highlight Intros
  (1767, NULL, 7, NULL, 8, 'Heroic', 1), -- Default McCree Highlight Intros
  (1768, 1, 7, 3, 8, 'Rolling Into Action', 1), -- Normal McCree Highlight Intros
  (1769, 1, 7, 3, 8, 'The Duel', 1),
  (1770, 1, 7, 3, 8, 'The Name''s McCree', 1),
  (1771, NULL, 7, NULL, 9, 'Heroic', 1), -- Default Mei Highlight Intros
  (1772, 1, 7, 3, 9, 'Frosty :)', 1), -- Normal Mei Highlight Intros
  (1773, 1, 7, 3, 9, 'Going Up!', 1),
  (1774, 1, 7, 3, 9, 'Skating Around', 1),
  (1775, 7, 7, 3, 9, 'Ice Scream', 7), -- Halloween Terror Mei Highlight Intros
  (1776, NULL, 7, NULL, 10, 'Heroic', 1), -- Default Mercy Highlight Intros
  (1777, 1, 7, 3, 10, 'Battle Angel', 1), -- Normal Mercy Highlight Intros
  (1778, 1, 7, 3, 10, 'Guardian Angel', 1),
  (1779, 1, 7, 3, 10, 'Heroes Never Die', 1),
  (1780, NULL, 7, NULL, 11, 'Heroic', 1), -- Default Pharah Highlight Intros
  (1781, 1, 7, 3, 11, 'Barrage', 1), -- Normal Pharah Highlight Intros
  (1782, 1, 7, 3, 11, 'Mission Complete', 1),
  (1783, 1, 7, 3, 11, 'Touchdown', 1),
  (1784, NULL, 7, NULL, 12, 'Heroic', 1), -- Default Reaper Highlight Intros
  (1785, 1, 7, 3, 12, 'Death Blossom', 1), -- Normal Reaper Highlight Intros
  (1786, 1, 7, 3, 12, 'Executioner', 1),
  (1787, 1, 7, 3, 12, 'Shadow Step', 1),
  (1788, 7, 7, 3, 12, 'Eternal Rest', 7), -- Halloween Terror Reaper Highlight Intros
  (1789, NULL, 7, NULL, 13, 'Heroic', 1), -- Default Reinhardt Highlight Intros
  (1790, 1, 7, 3, 13, 'Charge', 1), -- Normal Reinhardt Highlight Intros
  (1791, 1, 7, 3, 13, 'Hammer Down', 1),
  (1792, 1, 7, 3, 13, 'More Stretching Required', 1),
  (1793, NULL, 7, NULL, 14, 'Heroic', 1), -- Default Roadhog Highlight Intros
  (1794, 1, 7, 3, 14, 'Little Piggy', 1), -- Normal Roadhog Highlight Intros
  (1795, 1, 7, 3, 14, 'Say "Cheese"', 1),
  (1796, 1, 7, 3, 14, 'Whole Hog', 1),
  (1797, NULL, 7, NULL, 15, 'Heroic', 1), -- Default Soldier: 76 Highlight Intros
  (1798, 1, 7, 3, 15, 'Helix', 1), -- Normal Soldier: 76 Highlight Intros
  (1799, 1, 7, 3, 15, 'Looking At You', 1),
  (1800, 1, 7, 3, 15, 'Target Rich Environment', 1),
  (1801, NULL, 7, NULL, 16, 'Heroic', 1), -- Default Symmetra Highlight Intros
  (1802, 1, 7, 3, 16, 'Askew', 1), -- Normal Symmetra Highlight Intros
  (1803, 1, 7, 3, 16, 'Dance', 1),
  (1804, 1, 7, 3, 16, 'My Reality', 1),
  (1805, NULL, 7, NULL, 17, 'Heroic', 1), -- Default Torbjörn Highlight Intros
  (1806, 1, 7, 3, 17, 'In Your Face', 1), -- Normal Torbjörn Highlight Intros
  (1807, 1, 7, 3, 17, 'Refreshing', 1),
  (1808, 1, 7, 3, 17, 'Ride ''Em', 1),
  (1809, NULL, 7, NULL, 18, 'Heroic', 1), -- Default Tracer Highlight Intros
  (1810, 1, 7, 3, 18, 'Backflip', 1), -- Normal Tracer Highlight Intros
  (1811, 1, 7, 3, 18, 'Just In Time', 1),
  (1812, 1, 7, 3, 18, 'Serious Business', 1),
  (1813, 6, 7, 3, 18, 'Hurdle', 4), -- Summer Games Tracer Highlight Intros
  (1814, NULL, 7, NULL, 19, 'Heroic', 1), -- Default Widowmaker Highlight Intros
  (1815, 1, 7, 3, 19, 'Hanging Around', 1), -- Normal Widowmaker Highlight Intros
  (1816, 1, 7, 3, 19, 'I See You...', 1),
  (1817, 1, 7, 3, 19, 'Swinging Into Action', 1),
  (1818, NULL, 7, NULL, 20, 'Heroic', 1), -- Default Winston Highlight Intros
  (1819, 1, 7, 3, 20, 'Excuse Me', 1), -- Normal Winston Highlight Intros
  (1820, 1, 7, 3, 20, 'Glasses', 1),
  (1821, 1, 7, 3, 20, 'Primal Rage', 1),
  (1822, NULL, 7, NULL, 21, 'Heroic', 1), -- Default Zarya Highlight Intros
  (1823, 1, 7, 3, 21, 'Deadlift', 1), -- Normal Zarya Highlight Intros
  (1824, 1, 7, 3, 21, 'Maximum Charge', 1),
  (1825, 1, 7, 3, 21, 'This Is Strength', 1),
  (1826, NULL, 7, NULL, 22, 'Heroic', 1), -- Default Zenyatta Highlight Intros
  (1827, 1, 7, 3, 22, 'Focused', 1), -- Normal Zenyatta Highlight Intros
  (1828, 1, 7, 3, 22, 'Harmony And Discord', 1),
  (1829, 1, 7, 3, 22, 'Transcendence', 1),
  (1830, NULL, 7, NULL, 23, 'Heroic', 9), -- Default Sombra Highlight Intros
  (1831, 1, 7, 3, 23, 'Hacking', 9), -- Normal Sombra Highlight Intros
  (1832, 1, 7, 3, 23, 'Pulse', 9),
  (1833, 1, 7, 3, 23, 'Undetected', 9),
  -- Weapons
  (1834, NULL, 8, NULL, 1, 'Classic', 3), -- Default Ana Weapons
  (1835, 5, 8, 5, 1, 'Golden', 3), -- Golden Ana Weapons
  (1836, NULL, 8, NULL, 2, 'Classic', 1), -- Default Bastion Weapons
  (1837, 5, 8, 5, 2, 'Golden', 2), -- Golden Bastion Weapons
  (1838, NULL, 8, NULL, 3, 'Classic', 1), -- Default D.Va Weapons
  (1839, 5, 8, 5, 3, 'Golden', 2), -- Golden D.Va Weapons
  (1840, NULL, 8, NULL, 4, 'Classic', 1), -- Default Genji Weapons
  (1841, 5, 8, 5, 4, 'Golden', 2), -- Golden Genji Weapons
  (1842, NULL, 8, NULL, 5, 'Classic', 1), -- Default Hanzo Weapons
  (1843, 5, 8, 5, 5, 'Golden', 2), -- Golden Hanzo Weapons
  (1844, NULL, 8, NULL, 6, 'Classic', 1), -- Default Junkrat Weapons
  (1845, 5, 8, 5, 6, 'Golden', 2), -- Golden Junkrat Weapons
  (1846, NULL, 8, NULL, 7, 'Classic', 1), -- Default Lúcio Weapons
  (1847, 5, 8, 5, 7, 'Golden', 2), -- Golden Lúcio Weapons
  (1848, NULL, 8, NULL, 8, 'Classic', 1), -- Default McCree Weapons
  (1849, 5, 8, 5, 8, 'Golden', 2), -- Golden McCree Weapons
  (1850, NULL, 8, NULL, 9, 'Classic', 1), -- Default Mei Weapons
  (1851, 5, 8, 5, 9, 'Golden', 2), -- Golden Mei Weapons
  (1852, NULL, 8, NULL, 10, 'Classic', 1), -- Default Mercy Weapons
  (1853, 5, 8, 5, 10, 'Golden', 2), -- Golden Mercy Weapons
  (1854, NULL, 8, NULL, 11, 'Classic', 1), -- Default Pharah Weapons
  (1855, 5, 8, 5, 11, 'Golden', 2), -- Golden Pharah Weapons
  (1856, NULL, 8, NULL, 12, 'Classic', 1), -- Default Reaper Weapons
  (1857, 5, 8, 5, 12, 'Golden', 2), -- Golden Reaper Weapons
  (1858, NULL, 8, NULL, 13, 'Classic', 1), -- Default Reinhardt Weapons
  (1859, 5, 8, 5, 13, 'Golden', 2), -- Golden Reinhardt Weapons
  (1860, NULL, 8, NULL, 14, 'Classic', 1), -- Default Roadhog Weapons
  (1861, 5, 8, 5, 14, 'Golden', 2), -- Golden Roadhog Weapons
  (1862, NULL, 8, NULL, 15, 'Classic', 1), -- Default Soldier: 76 Weapons
  (1863, 5, 8, 5, 15, 'Golden', 2), -- Golden Soldier: 76 Weapons
  (1864, NULL, 8, NULL, 16, 'Classic', 1), -- Default Symmetra Weapons
  (1865, 5, 8, 5, 16, 'Golden', 2), -- Golden Symmetra Weapons
  (1866, NULL, 8, NULL, 17, 'Classic', 1), -- Default Torbjörn Weapons
  (1867, 5, 8, 5, 17, 'Golden', 2), -- Golden Torbjörn Weapons
  (1868, NULL, 8, NULL, 18, 'Classic', 1), -- Default Tracer Weapons
  (1869, 5, 8, 5, 18, 'Golden', 2), -- Golden Tracer Weapons
  (1870, NULL, 8, NULL, 19, 'Classic', 1), -- Default Widowmaker Weapons
  (1871, 5, 8, 5, 19, 'Golden', 2), -- Golden Widowmaker Weapons
  (1872, NULL, 8, NULL, 20, 'Classic', 1), -- Default Winston Weapons
  (1873, 5, 8, 5, 20, 'Golden', 2), -- Golden Winston Weapons
  (1874, NULL, 8, NULL, 21, 'Classic', 1), -- Default Zarya Weapons
  (1875, 5, 8, 5, 21, 'Golden', 2), -- Golden Zarya Weapons
  (1876, NULL, 8, NULL, 22, 'Classic', 1), -- Default Zenyatta Weapons
  (1877, 5, 8, 5, 22, 'Golden', 2), -- Golden Zenyatta Weapons
  (1878, NULL, 8, NULL, 23, 'Classic', 9), -- Default Sombra Weapons
  (1879, 5, 8, 5, 23, 'Golden', 9); -- Golden Sombra Weapons