# The operator for the casino and all its related functions:
# welcome, wallet, games directory, deck of cards

class Casino
  def initialize
    welcome
  end

  def welcome
    p "Welcome to ABL Casino!"
    p "Would you like to go to the chips counter, to the games, or exit?"
    p "(chips / games / exit)"
    welcomeAction = gets.chomp!

    if welcomeAction == "chips"
      # p "Welcome to the chips counter! You currently have #{chips} chips valued at #{chips * 2} dollars."
      p "Your chips are very important here at ABL Casino, here any game requires chips to play.  If you lose a game, you will lose your chips, if you tie a game you get your chips back, but if you win your chips will double!"
      chipsCounter

    elsif welcomeAction == "games"
      p "you are in games"

    else welcomeAction == "exit"
      p "Goodbye!!"
    end
  end

  def chipsCounter
    
    p "Would you like to buy chips, sell chips, or leave?"
    p "(buy / sell / leave)"
    ccaction = gets.chomp!

    if ccaction == "buy"
      puts "how many chips would you like to buy?"
      purchase = gets.chomp!
      @@wallet.addChips(purchase)

    elsif ccaction == "sell"

    elsif ccaction == "leave"
      welcome

    else
      p "Sorry, that input is invalid."
      chipsCounter
    end

  end

end

class Wallet
  # attr_accessor :chips
  def initialize
    @chips = 0
  end

  def addChips(amount)

    puts @chips
    @chips  = @chips + amount.to_i
    puts @chips
    @@casino.chipsCounter
  end

  def self.takeChips(amount)
    @chips = @chips + amount
  end
end


@@wallet = Wallet.new
@@casino = Casino.new
Casino.new