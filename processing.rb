class Processing
  def initialize
    @libraries = $libraries.sort_by(&:score)

    @picked_libraries = []
    @picked_books = []
  end

  def pick_library
    @libraries.shift
  end

  def pick_books(library)
    library_books = library.books - @picked_books.flatten
    library_books.sort_by { |id| $books[id] }.reverse
  end

  def run
    while library = pick_library do
      @picked_libraries << library
      @picked_books << pick_books(library)
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
