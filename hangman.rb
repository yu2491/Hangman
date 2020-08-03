puts "Enter a word or phrase to guess:"

answer = gets.chomp
guess = answer.downcase.delete(" ")
lives = 10
guesses = []

def choose_letter(guessed_already)
  puts "Guess 1 letter:"
  while true
    letter = gets.chomp
    if letter.length == 1 && letter != ' ' && !guessed_already.include?(letter)
      return letter
    end
  end
end

def display_hangman(lives)
  hangman = { 0 =>  [['  _____'],['  |   |'],['  |   O'],['  | |_|_|'],
    ['  |   |'],['  |  _|_'],['  | |   |'],['__|__'],["HANGMAN! You have lost"]],
1 =>  [['  _____'],['  |   |'],['  |   O'],['  | |_|_|'],['  |   |'],
['  |  _| '],['  | |'],['__|__']],
2 =>  [['  _____'],['  |   |'],['  |   O'],['  | |_|_|'],['  |   |'],
['  |   | '],['  |'],['__|__']],
3 =>  [['  _____'],['  |   |'],['  |   O'],['  | |_|'],['  |   |'],
['  |   | '],['  |'],['__|__']],
4 =>  [['  _____'],['  |   |'],['  |   O'],['  |   |'],['  |   |'],
['  |   | '],['  |'],['__|__']],
5 =>  [['  _____'],['  |   |'],['  |   O'],['  |'],['  |'],
['  |'],['  |'],['__|__']],
6 =>  [['  _____'],['  |   |'],['  |'],['  |'],['  |'],
['  |'],['  |'],['__|__']],
7 =>  [['  _____'],['  |'],['  |'],['  |'],['  |'],['  |'],['  |'],['__|__']],
8 =>  [[''],['  |'],['  |'],['  |'],['  |'],['  |'],['  |'],['__|__']],
9 =>  [[''],[''],[''],[''],[''],[''],[''],['_____']],
10 => [[''],[''],[''],[''],[''],[''],[''],['']] }

  puts hangman[lives]
end

while true
  puts `clear`

  if guess == ''
    puts answer
    display_hangman(lives)
    puts "Congratulations you have won"
    break
  elsif lives == 0
    puts answer.gsub(/[#{guess}]/i,"-")
    puts "The phrase was: #{answer}"
    display_hangman(lives)
    break
  end


  puts answer.gsub(/[#{guess}]/i,"-")
  display_hangman(lives)
  puts "Guessed so far: #{guesses.join(',')}"

  letter = choose_letter(guesses)
  guesses << letter

  guess = guess.delete(letter.downcase)

  if !answer.downcase.include?(letter.downcase)
    lives -= 1
  end
end
