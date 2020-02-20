class Library
  attr_reader :id, :signup_time, :can_ship_books, :books

  def initialize(id, signup_time, can_ship_books, books)
    @id = id
    @signup_time = signup_time
    @can_ship_books = can_ship_books
    @books = books
  end

  def score
    books_value = books.inject(0) { |sum, book_id| sum + $books[book_id]  }
    books_value_per_day = books_value / can_ship_books
    books_value_per_day / signup_time
  end
end
