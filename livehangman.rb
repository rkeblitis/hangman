class Hangman

  def initialize
    @head       = " "
    @left_arm   = " "
    @right_arm  = " "
    @body       = " "
    @left_leg   = " "
    @right_leg  = " "
    @secret     = random_word
    @characters = empty_characters
    @guesses    = []
  end

    def make_guess(guessed_letter)
      return false if @guesses.include?(guessed_letter)
      @secret.chars.each_with_index do |letter, index|
        if guessed_letter == letter
          @characters[index] = letter
        end
      end
      @guesses << guessed_letter
    end


  def empty_characters
    Array.new(@secret.length, "_")
  end

  def characters
    @characters
  end

  def guess
    @characters.join
  end

  def random_word
    words.sample
  end

  def words
    ["blah", "floo"]
  end

  def board
    "   ----------\n    #{@head}   |\n  #{@left_arm} #{@right_arm}   |\n  #{@left_leg}#{@body}#{@right_leg}   |\n   __________"
  end

end

# Draw and print a board
# secret word
# make the concetp of blank spaces
# take a guess and comapre to the secret word, update the characters
# the geuss letter
# remember guesses
# it should know if a guess already been guessed
# it should know when the game is complete or hung
# remember which parts have been added
# body parts need color

def run
  h = Hangman.new
  until h.game_over? # Make game_over? method
    puts h.board
    puts h.guess
    puts "What letter would you like to guess?\n"
    guess = gets.chomp
    h.make_guess(guess)
  end
end

run


#1st starts with saying things you want in like human terms
h = Hangman.new
puts h.make_guess("l")
puts h.make_guess("l")
