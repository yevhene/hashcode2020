class Library
  attr_reader :lib_id, :signup_time, :can_ship_books, :books_in_lib

  def initialize(lib_id, signup_time, can_ship_books, books_in_lib)
    @lib_id = lib_id
    @signup_time = signup_time
    @can_ship_books = can_ship_books
    @books_in_lib = books_in_lib
  end
end
