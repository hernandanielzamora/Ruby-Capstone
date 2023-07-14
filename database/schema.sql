CREATE TABLE music_album (
  id INT not null generated always as identity,
  title VARCHAR(255),
  published_date DATE
  on_spotify BOOLEAN,
  archived BOOLEAN,
  primary key (id)
);

CREATE TABLE genre (
  id INT not null generated always as identity,
  genre_name VARCHAR(255),
  music_album_id INT,
  foreign key (music_album_id) references music_album(id)

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
)

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(255),
  cover_state VARCHAR(255)
)

CREATE TABLE games(
  id INT, 
  name VARCHAR(255), 
  published_date DATE, 
  last_played_date DATE, 
  multiplayer BOOLEAN, 
  archived BOOLEAN, 
  PRIMARY KEY(id)
);

CREATE TABLE authors(
  id INT, 
  first_name VARCHAR(255), 
  last_name VARCHAR(255), 
  PRIMARY KEY(id)
);
