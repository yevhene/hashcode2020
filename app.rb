require_relative './library.rb'

number_of_books, number_of_libs, days = gets.split(' ').map(&:to_i)

books = gets.split(' ').map(&:to_i)

fail if books.size != number_of_books

libraries = []

number_of_libs.times do |i|
  lib_id, signup_time, can_ship_books = gets.split(' ').map(&:to_i)
  books_in_lib = gets.split(' ').map(&:to_i)
  library = Library.new lib_id, signup_time, can_ship_books, books_in_lib
  libraries << library
end

processing = Processing.new(libraries, books, days)
