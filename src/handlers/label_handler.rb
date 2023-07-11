require_relative '../classes/label'

class LabelHandler
  attr_accessor :label_list, :label_json

  def initialize
    @labels_list = []
    @label_json = []
  end

  def label_to_json(label)
    {
      'id' => label.id,
      'title' => label.title,
      'color' => label.color
    }
  end

  # Fills the labels array with the information hold in the json
  def init_labels_list
    return unless label_json.empty?

    @label_json.each do |label|
      label = Label.new(label[:title], label[:color])
      label_list.push(label)
    end
  end

  def list_labels
    puts ''
    puts 'Here are all your labels... '
    puts ''
    if @label_json.empty?
      puts 'No labels found'
      puts '----------------------------------------'
    else
      @label_json.each_with_index do |label, i|
        puts "#{i + 1} | #{label['title']} #{label['color']}"
      end
      puts ''
    end
    puts '----------------------------------------'
    puts ''
  end

  def add_label(item)
    puts 'Please insert the following data for creating a label: '
    print 'Label Title: '
    label_title = gets.chomp
    print 'Label Color: '
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @labels_list << label
    @label_json << label_to_json(label)
    label.add_item(item)
    puts '----------------------------------------'
  end
end
