class Processing
  def initialize
    @libraries = $libraries#.sort_by(&:score)

    @picked_libraries = []
    @picked_books = []
  end

  def pick_library(days_left)
    @libraries.sort_by! { |library| library.score(days_left) }.pop
  end

  def run
    days_left = $days
    while days_left > 0 do
      library = pick_library(days_left)
      @picked_libraries << library if library
      @picked_libraries.each(&:pick_books)
      if library
        days_left -= library.signup_time
      else
        days_left -= 1
      end
    end
  end

  def print
    count = @picked_libraries.count
    puts count
    count.times do |i|
      library = @picked_libraries[i]
      puts "#{library.id} #{library.picked_books.count}"
      puts library.picked_books.join(' ')
    end
  end
end
