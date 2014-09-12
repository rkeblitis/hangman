class Hangman
  attr_accessor :randword, :guess, :guesses_stored, :secret_word
  def initialize
    @randword             = random_word #
    #@secret_word         = @randword
    @guesses_stored       = []
    @wrong_guesses       = []
    #@correct_guesses     = []
    @secret_word          = convert_word_to_secret(@randword)
    @guess                = ""
  end

  def game_flow
    puts @randword.inspect
    while @secret_word != @randword && @wrong_guesses.length < 3
      user_input
      compare
      current_user_display

      #puts "End Game"
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
    duplicate_guess(@guess)
  end

  def duplicate_guess(guess)
    if @guesses_stored.include?(guess) == true
        puts "You already guessed that letter silly!"
        user_input
    else
      @guesses_stored << @guess
      puts "You have guessed '#{@guesses_stored.join}' so far"
    end
  end

  def compare
    # dupliate_guess
    @randword.chars.each_with_index do |c, i|
      if @guess == c
        replace(c, i)
      end
    end
    if !@randword.chars.include?(@guess)
      @wrong_guesses << @guess
      puts "#@wrong_guesses is incorrect"
    end
  puts @secret_word
# compare the array of the secret word to the guess
  end

  def replace(charcter,index)
    @secret_word[index] = charcter
    @secret_word
    # replaces index of the secret word array with the correct guess
  end

end


h = Hangman.new.game_flow
