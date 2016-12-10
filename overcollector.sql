DROP OWNED BY overcollector;
DROP TABLE IF EXISTS heroes, categories, types, rarities, events, cosmetics, users, user_cosmetics, settings, user_settings, tokens, wishlist_items;
DROP FUNCTION IF EXISTS gen_token();

-- Creates a random unique 32 char hexadecimal string for the tokens table
CREATE FUNCTION gen_token()
  RETURNS CHAR(32) AS $$
DECLARE
  t    TEXT;
  done BOOLEAN DEFAULT FALSE;
BEGIN
  WHILE NOT done LOOP
    t := md5(random() :: CHAR(32));
    done := NOT EXISTS(
        SELECT 1
        FROM tokens
        WHERE token = t
    );
  END LOOP;
  RETURN t;
END;
$$ LANGUAGE plpgsql VOLATILE;

CREATE TABLE heroes (
  id   INTEGER,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  CONSTRAINT pk_heroes PRIMARY KEY (id)
);
GRANT SELECT ON TABLE heroes TO overcollector;


CREATE TABLE categories (
  id               INTEGER,
  name             TEXT    NOT NULL,
  description      TEXT    NOT NULL,
  price_multiplier NUMERIC NOT NULL,
  slug             TEXT    NOT NULL,
  CONSTRAINT pk_categories PRIMARY KEY (id)
);
GRANT SELECT ON TABLE categories TO overcollector;


CREATE TABLE types (
  id   INTEGER,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  CONSTRAINT pk_types PRIMARY KEY (id)
);
GRANT SELECT ON TABLE types TO overcollector;


CREATE TABLE rarities (
  id         INTEGER,
  name       TEXT    NOT NULL,
  base_price INTEGER NOT NULL,
  CONSTRAINT pk_rarities PRIMARY KEY (id)
);
GRANT SELECT ON TABLE rarities TO overcollector;


CREATE TABLE events (
  id    INTEGER,
  name  TEXT NOT NULL,
  start DATE NOT NULL,
  "end" DATE,
  CONSTRAINT pk_events PRIMARY KEY (id)
);
GRANT SELECT ON TABLE events TO overcollector;


CREATE TABLE cosmetics (
  id          INTEGER,
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
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT unique_cosmetic UNIQUE (category_id, type_id, rarity_id, hero_id, name)
);
GRANT SELECT ON TABLE cosmetics TO overcollector;


CREATE TABLE users (
  id        SERIAL,
  battleid  INTEGER NOT NULL,
  battletag TEXT,
  CONSTRAINT pk_users PRIMARY KEY (id),
  CONSTRAINT unique_battleid UNIQUE (battleid)
);
GRANT SELECT, INSERT, UPDATE ON TABLE users TO overcollector;


CREATE TABLE user_cosmetics (
  user_id     INTEGER NOT NULL,
  cosmetic_id INTEGER NOT NULL,
  CONSTRAINT pk_user_cosmetics PRIMARY KEY (user_id, cosmetic_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_cosmetic FOREIGN KEY (cosmetic_id) REFERENCES cosmetics (id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);
GRANT SELECT, INSERT, DELETE ON TABLE user_cosmetics TO overcollector;


CREATE TABLE settings (
  id          INTEGER,
  name        TEXT UNIQUE NOT NULL,
  description TEXT        NOT NULL,
  type        TEXT        NOT NULL,
  "default"   TEXT        NOT NULL,
  min         TEXT,
  max         TEXT,
  CONSTRAINT pk_settings PRIMARY KEY (id)
);
GRANT SELECT ON TABLE settings TO overcollector;


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
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE user_settings TO overcollector;


CREATE TABLE tokens (
  token      TEXT      NOT NULL                 DEFAULT gen_token(),
  created_at TIMESTAMP NOT NULL                 DEFAULT (now() AT TIME ZONE 'UTC'),
  expires_at TIMESTAMP NOT NULL                 DEFAULT (now() AT TIME ZONE 'UTC') + INTERVAL '5 minutes',
  CONSTRAINT pk_tokens PRIMARY KEY (token)
);
GRANT SELECT, INSERT, DELETE ON TABLE tokens TO overcollector;


CREATE TABLE wishlist_items (
  user_id     INTEGER NOT NULL,
  cosmetic_id INTEGER NOT NULL,
  favorite    BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT pk_wishlist_items PRIMARY KEY (user_id, cosmetic_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
  ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_cosmetic FOREIGN KEY (cosmetic_id) REFERENCES cosmetics (id)
  ON UPDATE CASCADE ON DELETE RESTRICT
);
GRANT SELECT, INSERT, DELETE ON TABLE wishlist_items TO overcollector;


GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO overcollector;