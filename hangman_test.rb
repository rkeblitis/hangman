def duplicate_guess(guess)
  @guesses_stored.each do |individual_guesses|
    if guess == individual_guesses
      puts "You already guesses that letter"
    end
  end
end

puts duplicate_guess(w)
