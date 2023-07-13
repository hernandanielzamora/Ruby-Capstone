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