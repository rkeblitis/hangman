#class Man
  # I need an interger representing the number of wrong guesses
  # method that reads the interger, and based on that will print the
  # body parts. ex 0 would = nil

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
    @guesses_left         = 6
    @left_ear             = "\\"
    @right_ear            = "/"
    @left_eye             = "-"
    @right_eye            = "-"
    @nose                 = "."
    @left_foot            = ">"
    @right_foot           = "<"
  end


  def game_flow
    puts "You have #@guesses_left guesses. Good Luck!"
    puts @randword.inspect
    while @secret_word != @randword && @wrong_guesses.length < 6#make intoa global variably- or make it global to the clas
      user_input
      board

    end
    puts "End"
  end

  def random_word
    words = ["python", "ruby", "java", "php", "html", "css", "assembly"]
    words.sample
  end

  def board
    puts """
          (#@left_ear   #@right_ear)
          (#@left_eye #@nose #@right_eye)
          (#@left_foot   #@right_foot)
  """
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
    puts "*" * 80
    puts "Pick a letter:\n"
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
      guesses_left(1)
      puts "#@wrong_guesses is incorrect"
      puts "You have #@guesses_left left."

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

  def guesses_left(wrong_guess)
    @guesses_left = @guesses_left - wrong_guess
  end


end


h = Hangman.new
h.game_flow
