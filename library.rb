class Library
  attr_reader :lib_id, :signup_time, :can_ship_books, :books_in_lib

  def initialize(lib_id, signup_time, can_ship_books, books_in_lib)
    @lib_id = lib_id
    @signup_time = signup_time
    @can_ship_books = can_ship_books
    @books_in_lib = books_in_lib
  end

  def score
    books_value = books_in_lib.inject(0) { |sum, book_id| sum + $books[book_id]  }
    books_value_per_day = books_value / can_ship_books
    books_value_per_day / signup_time
  end
end
