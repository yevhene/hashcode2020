echo "Cleanup"
rm out/*
echo "Zip code"
zip out/code.zip *.rb
echo "A"
ruby app.rb < in/a_example.txt > out/a_example.txt
echo "B"
ruby app.rb < in/b_read_on.txt > out/b_read_on.txt
echo "C"
ruby app.rb < in/c_incunabula.txt > out/c_incunabula.txt
echo "D"
ruby app.rb < in/d_tough_choices.txt > out/d_tough_choices.txt
echo "E"
ruby app.rb < in/e_so_many_books.txt > out/e_so_many_books.txt
echo "F"
ruby app.rb < in/f_libraries_of_the_world.txt > out/f_libraries_of_the_world.txt
echo "Done"
