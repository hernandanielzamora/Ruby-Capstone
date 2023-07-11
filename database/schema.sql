CREATE TABLE items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT REFERENCES genres(id),
  author_id INT REFERENCES authors(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE,
  archived BOOLEAN
)

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
)

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items(id),
  publisher VARCHAR(255),
  cover_state VARCHAR(255)
)

CREATE TABLE labels_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INT REFERENCES items (id),
  label_id INT REFERENCES labels (id)
)