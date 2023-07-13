class GetUserInput
  def genre(item)
    genre = ''
    until genre.length.positive?
      print "#{item} genre: "
      genre = gets.chomp
      puts "#{item} genre can not be empty" if genre.length <= 0
    end
    genre
  end

  def author
    puts "Author first name and last name \n"
    first_name = ''
    last_name = ''

    until first_name.length.positive? && last_name.length.positive?
      print 'first name: '
      first_name = gets.chomp
      print 'last name: '
      last_name = gets.chomp
      puts 'Author last name and first name can not be empty' if first_name.length <= 0 || last_name.length <= 0
    end
    { f_name: first_name, l_name: last_name }
  end

  def label
    puts "Label title and color \n"
    title = ''
    color = ''

    until title.length.positive? && color.length.positive?
      print 'title: '
      title = gets.chomp
      print 'color: '
      color = gets.chomp
      puts 'Label title and color can not be empty' if title.length <= 0 || color.length <= 0
    end
    { title: title, color: color }
  end

  def str(string)
    val = ''
    until val.length.positive?
      print "#{string}: "
      val = gets.chomp
      puts "#{string} can not be empty" if val.length <= 0
    end
    val
  end

  def publish_date(string)
    puts "Enter Published date in the format DD/MM/YYYY \n"
    date = ''
    boolean = false

    until date.length.positive?
      print 'Publish date: '
      yes_no = ''
      date = gets.chomp
      print "#{string}? [Y/N]: "
      yes_no = gets.chomp.upcase
      until %w[Y N].include?(yes_no)
        puts 'Please Enter [Y/N]'
        yes_no = gets.chomp.upcase
      end
      case yes_no
      when 'Y'
        boolean = true
      when 'N'
        boolean = false
      end
      puts 'publish date can not be empty' if date.length <= 0
    end
    { date: date, boolean: boolean }
  end

  def input_date(type_of_date)
    puts "Enter #{type_of_date} in the format DD/MM/YYYY \n"
    date = ''
    until date.length.positive?
      print "#{type_of_date}: "
      date = gets.chomp
    end
    date
  end

  def parse_data(data)
    json_data = JSON.pretty_generate(data)
    JSON.parse(json_data)
  end
end
