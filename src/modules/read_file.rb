def read
  {
    books: read_json_file('database/books.json') == '404' ? [] : read_json_file('database/books.json'),
    music_albums: read_json_file('database/music_albums.json') == '404' ? [] : read_json_file('database/music_albums.json'),
    movies: read_json_file('database/movies.json') == '404' ? [] : read_json_file('database/movies.json'),
    games: read_json_file('database/games.json') == '404' ? [] : read_json_file('database/games.json'),
    genres: read_json_file('database/genres.json') == '404' ? [] : read_json_file('database/genres.json'),
    authors: read_json_file('database/authors.json') == '404' ? [] : read_json_file('database/authors.json'),
    sources: read_json_file('database/sources.json') == '404' ? [] : read_json_file('database/sources.json'),
    labels: read_json_file('database/labels.json') == '404' ? [] : read_json_file('database/labels.json')
  }
end
