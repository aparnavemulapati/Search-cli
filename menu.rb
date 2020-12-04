class Menu
  def initialize
    puts "Type 'quit' to exit anytime, Press 'Enter' to continue"
  end

  def display_options
    while(1)
      puts "Select an option:"
      puts "* Press 1 to search"
      puts "* Press 2 to view a list of searchable fields"
      puts "* Type 'quit' to exit"
      op = gets.chomp

      case op
      when 'quit'
        quit
      when '1'
        search
      when '2'
        list_searchable_fields
      else
        puts "❌❌❌ Invalid Option: #{op}\n\n"
      end
    end
  end

  private

  def list_searchable_fields
    SEARCHABLE_ENTITIES.each do |entity|
      puts "-"*50
      puts "Search #{entity + 's'} with the following fields:"
      fields = case entity
      when 'User'
        User::SEARCHABLE_FIELDS
      when 'Organization'
        Organization::SEARCHABLE_FIELDS
      when 'Ticket'
        Ticket::SEARCHABLE_FIELDS
      end
      fields.each { |field| puts field }
      puts ""
    end
  end

  def search
    puts "\n\nChoose a collection to search in:"
    puts "1. Users"
    puts "2. Tickets"
    puts "3. Organizations"
    puts "Type 'quit' to exit"

    op = gets.chomp
    klass = nil
    case op
    when '1'
      klass = User
    when '2'
      klass = Ticket
    when '3'
      klass = Organization
    when 'quit'
      quit
    else
      puts "❌❌❌ Invalid Option: #{op}\n\n"
      search
    end

    puts "\n\nEnter search key"
    key = gets.chomp

    if !klass::SEARCHABLE_FIELDS.include?(key)
      puts "❌❌❌ Key not found\n\n"
      return
    end

    puts "Enter search value"
    value = gets.chomp

    results = klass.new(key, value).search
    if results.empty?
      puts "No results found"
    else
      results.each { |res| jj res }
    end
    puts "-"*50
    puts ""
  end

  def quit
    puts "\n\n👋 Exiting!"
    exit(true)
  end
end
