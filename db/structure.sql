CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "products" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "selling_price" integer, "original_price" integer, "is_disable" boolean DEFAULT 0 NOT NULL, "product_type" varchar, "game_name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "customers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "game_id" varchar, "game_server" varchar, "whatsapp_number" varchar, "email" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "payments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "image_url" varchar, "is_disable" boolean DEFAULT 0 NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "orders" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "nickname" varchar, "server_game_id" integer, "payment_method" varchar, "product_type" varchar, "game_name" varchar, "total_price" integer, "order_status" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20240607122618'),
('20240617101100'),
('20240618081854'),
('20240723071735');


