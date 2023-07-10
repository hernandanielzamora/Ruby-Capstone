class Main
  def initialize
    display_options
    chosen = get_input('Select an option:').to_i
    selected_option(chosen)
  end

  def display_options
    array_options = ['List all books', 'List all music albums', 'List of games', 'List all genres', 'List all labels', 'List all authors', 'Add a book', 'Add a music album', 'Add a game']
    puts 'Be welcomed to cathalog all my things'
    puts 'Please select a valid option'
    puts '-------------------------------'
    array_options.each_with_index do |option, index|
      puts "#{index + 1}| #{option}"
    end
  end

  def get_input(user_input)
    print user_input
    gets.chomp
  end
  
  def selected_option(chosen)
    options = {
      1 => 'Chosen: 1',
      2 => 'Chosen: 2',
      3 => 'Chosen: 3',
      4 => 'Chosen: 4',
      5 => 'Chosen: 5',
      6 => 'Chosen: 6',
      7 => 'Chosen: 7',
      8 => 'Chosen: 8',
      9 => 'Chosen: 9',
      10 => 'Thank you. Exiting program',
    }

    if options.key?(chosen)
      puts options[chosen]
    else
      puts 'Invalid option. Please select a number from the menu'
    end
  end
end

Main.new