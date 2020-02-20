class Library
  attr_reader :id, :signup_time, :can_ship_books, :books, :picked_books

  def initialize(id, signup_time, can_ship_books, books)
    @id = id
    @signup_time = signup_time
    @can_ship_books = can_ship_books
    @books = books
    @picked_books = []
  end

  def score(days_left)
    books_value = books.inject(0) { |sum, book_id| sum + $books[book_id]  }
    days = signup_time + (books.count / can_ship_books)
    days = days_left if days_left < days
    books_value / days
  end

  def pick_books
    return if books.empty?
    books.sort_by! { |id| $books[id] }
    can_ship_books.times do
      break if books.empty?
      book_id =  books.pop
      $books[book_id] = 0
      @picked_books << book_id
    end
  end
end
