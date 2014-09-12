class Hangman
  attr_accessor :randword, :guess, :guesses_stored, :secret_word, :guesses_left,
    :total_guesses
  def initialize
    @randword             = random_word #
    @correct_guesses      = []
    @wrong_guesses        = []
    @total_guesses        = []
    @secret_word          = convert_word_to_secret(@randword)
    @guess                = ""
    @guesses_left         = guesses_left
  end

  def game_flow
    puts @randword.inspect
    while @secret_word != @randword && @wrong_guesses.length < 3
      user_input

      current_user_display

    end
  end

  def random_word
    words = ["python", "ruby", "java", "php", "html", "css", "assembly"]
    words.sample
  end

  def current_user_display
    #def duplicate_guess

  end
    #puts @guesses_stored.inspect
    #puts @secret_word.inspect
    # secret word spaces
    # if guess is correct and placement of guess
    # show board
    #word status of current game, display the incorrent guessses

  def convert_word_to_secret(temp_word)
    secret_word = temp_word.dup
    secret_word.chars.each_with_index do |l, i|
      secret_word[i] = "_"
    end
    secret_word
  end

  def user_input
    puts "Pick a letter:"
    @guess = gets.chomp.downcase
    duplicate_guess
  end

  # def number_of_guesses_left(guess_number)
  #   @guesses_left = @wrong_guesses - guess_number
  #   puts "You have six guesses"
  #   puts "!!!!!!! @guesses_left!!!!!!"
  # end

  def duplicate_guess
    if @total_guesses.include? @guess
      puts "You already guessed that letter silly!"
      user_input
    else
      @total_guesses << @guess
        compare
    end
  end

  def compare
    @randword.chars.each_with_index do |c, i|
      if @guess == c
        replace(c, i)
      end
    end
    if !@randword.chars.include?(@guess)
      @wrong_guesses << @guess
      puts "#@wrong_guesses is incorrect"
    else
      @correct_guesses << @guess
      puts "Good Guess!"
      puts "You've guessed #{@total_guesses} so far"
    end
  puts @secret_word
  end

  def replace(charcter,index)
    @secret_word[index] = charcter
    @secret_word
  end

end


h = Hangman.new
h.game_flow
