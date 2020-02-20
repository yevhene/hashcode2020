class Library
  attr_reader :id, :signup_time, :can_ship_books, :books

  def initialize(id, signup_time, can_ship_books, books)
    @id = id
    @signup_time = signup_time
    @can_ship_books = can_ship_books
    @books = books
  end

  def pick_books(picked_books, days_left)
    library_books = @books - picked_books
    books = library_books.sort_by { |id| $books[id] }.reverse
    busy_days = days_left - signup_time
    total_books = can_ship_books * busy_days
    return [] if total_books <= 0
    books.first([[total_books, books.count].min, 0].max)
  end

  def score_by(picked_books, days_left)
    pick_books(picked_books, days_left).inject(0) { |sum, book_id| sum + $books[book_id]  }
  end
end
