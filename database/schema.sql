CREATE TABLE music_album (
  id INT,
  title VARCHAR(255),
  published_date DATE
  on_spotify BOOLEAN,
  archived BOOLEAN,
  primary key (id)
);

CREATE TABLE genre (
  id INT,
  genre_name VARCHAR(255),
  music_album_id INT,
  foreign key (music_album_id) references music_album
);
