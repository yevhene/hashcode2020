class Processing
  def initialize
    @libraries = $libraries#.sort_by(&:score)

    @picked_libraries = []
    @picked_books = []
  end

  def pick_library
    libraries.sort_by(&:score).shift
  end

  def pick_books(library, days_left)
    # library_books = library.books - @picked_books.flatten
    books = library_books.sort_by { |id| $books[id] }.reverse
    books.first([[days_left * library.can_ship_books, books.count].min, 0].max)
  end

  def run
    days = 0
    while library = pick_library do
      picked_books = pick_books(library, $days - days)
      next if picked_books.count == 0
      @picked_libraries << library
      @picked_books << picked_books
      picked_books.each { |book_id| $books[book_id] = 0 }
      days = days + library.signup_time
    end
  end

  def print
    count = @picked_libraries.count
    puts count
    count.times do |i|
      picked_books = @picked_books[i]
      puts "#{@picked_libraries[i].id} #{picked_books.count}"
      puts picked_books.join(' ')
    end
  end
end
