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
    next_sinup_in = 0
    picked_library = nil
    while days_left > 0 do
      # p days_left
      # p next_sinup_in
      if next_sinup_in.zero?
        @picked_libraries << picked_library if picked_library
        picked_library = pick_library(days_left)
        if picked_library
          next_sinup_in = picked_library.signup_time
        else
          next_sinup_in = -1
        end
      end
      @picked_libraries.each(&:pick_books)
      days_left -= 1
      next_sinup_in -= 1
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
