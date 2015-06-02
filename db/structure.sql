CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "biography" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "authors_books" ("author_id" integer, "book_id" integer);
CREATE INDEX "index_authors_books_on_author_id" ON "authors_books" ("author_id");
CREATE INDEX "index_authors_books_on_book_id" ON "authors_books" ("book_id");
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "genres" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "books_tags" ("book_id" integer, "tag_id" integer);
CREATE INDEX "index_books_tags_on_book_id" ON "books_tags" ("book_id");
CREATE INDEX "index_books_tags_on_tag_id" ON "books_tags" ("tag_id");
CREATE TABLE "books_genres" ("book_id" integer, "genre_id" integer);
CREATE INDEX "index_books_genres_on_book_id" ON "books_genres" ("book_id");
CREATE INDEX "index_books_genres_on_genre_id" ON "books_genres" ("genre_id");
CREATE TABLE "publishers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "password" varchar, "access" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" text, "rating" integer, "year" integer, "isbn" integer, "publisher_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_books_on_publisher_id" ON "books" ("publisher_id");
INSERT INTO schema_migrations (version) VALUES ('20150210140831');

INSERT INTO schema_migrations (version) VALUES ('20150210140840');

INSERT INTO schema_migrations (version) VALUES ('20150210140904');

INSERT INTO schema_migrations (version) VALUES ('20150210140915');

INSERT INTO schema_migrations (version) VALUES ('20150210140923');

INSERT INTO schema_migrations (version) VALUES ('20150210140936');

INSERT INTO schema_migrations (version) VALUES ('20150210140946');

INSERT INTO schema_migrations (version) VALUES ('20150210140958');

INSERT INTO schema_migrations (version) VALUES ('20150210141115');

INSERT INTO schema_migrations (version) VALUES ('20150213071311');

INSERT INTO schema_migrations (version) VALUES ('20150423123858');

