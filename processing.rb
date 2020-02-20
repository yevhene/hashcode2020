class Processing
  def initialize
    @libraries = $libraries.dup

    @picked_libraries = []
    @picked_books = []
    @days = 0
  end

  def pick_library
    @libraries.sort_by! { |l| l.score_by(@picked_books.flatten, days_left) }.pop
  end

  def pick_books(library)
    library.pick_books(@picked_books.flatten, days_left)
  end

  def days_left
    $days - @days
  end

  def run
    @days = 0
    while library = pick_library and days_left > 0 do
      picked_books = pick_books(library)
      next if picked_books.count == 0
      @picked_libraries << library
      @picked_books << picked_books
      @days = @days + library.signup_time
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
