# The operator for the casino and all its related functions:
# welcome, wallet, games directory

class Casino
  def initialize
    @myWallet = Wallet.new
    @game = Game.new
    welcome
  end

  def welcome
    p "Welcome to ABL Casino!"
    p "Would you like to go to the chips counter, to the games, or exit?"
    p "(chips / games / exit)"
    welcomeAction = gets.chomp!

    if welcomeAction == "chips"
      p "Welcome to the chips counter! Your chips are very important here at ABL Casino, here any game requires chips to play.  If you lose a game, you will lose your chips, if you tie a game you get your chips back, but if you win your chips will double!"
      chipsCounter

    elsif welcomeAction == "games"
      gamesCounter

    elsif welcomeAction == "exit"
      p "Goodbye!! Come again soon!!"

    else
      puts "sorry, that input is invalid. please try again"
    end
  end

  def gamesCounter
    puts "you are in the game counter"
    if @game.winLoseStatus == -1
      puts "which game would you like to play?"
      puts "(game / <other games to be added)"
      selectgame = gets.chomp!
      puts "please place your bet"
      @bet = gets.chomp!.to_i
      p @bet
      p selectgame
      if @bet <= @myWallet.chips
        puts "Your bet of #{@bet} chips has been recorded. Enjoy your game!"
        if selectgame == "game"
          puts "you are inside game"
        @game.play
        gamesCounter
        else 
          puts "that input is invalid"
          gamesCounter
        end
      else
        puts "sorry, you only have #{@myWallet.chips}. Your bet cannot exceed the amount of chips owned"
        gamesCounter
      end 
    elsif @game.winLoseStatus == 0
      p @myWallet.chips
      @myWallet.addChips(@bet * 2)
      p @myWallet.chips

        
    end

  end

  def chipsCounter
    p "You currently have #{@myWallet.chips} chips valued at #{@myWallet.chips * 2} dollars."
    
    p "Would you like to buy chips, sell chips, or leave?"
    p "(buy / sell / leave)"
    ccaction = gets.chomp!

    if ccaction == "buy"
      puts "how many chips would you like to buy?"
      purchase = gets.chomp!.to_i
      @myWallet.addChips(purchase)
      chipsCounter


    elsif ccaction == "sell"
      puts "how many chips would you like to sell?"
      sell = gets.chomp!.to_i
      @myWallet.subChips(sell)
      puts "you sold #{sell} chips for #{sell * 2} dollars"
      chipsCounter

    elsif ccaction == "leave"
      welcome

    else
      p "Sorry, that input is invalid."
      chipsCounter
    end

  end

end

class Wallet
  attr_accessor :chips
  def initialize
    @chips = 10
  end

  def addChips(amount)
    @chips += amount
    p "you are here"
  end

  def subChips(amount)
    @chips -= amount
  end
end

class Game
  attr_accessor :winLoseStatus

  def initialize
    @deck = ["Ace",2, 3,4,5,6,7, 8, 9,10,"Jack","Queen","King","Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King"]
    @bet = 0
    @winLoseStatus = -1

  end

  def play
    playaction = gets.chomp!

    if playaction == "0"
      puts "this is win"
      win
    elsif playaction == "1"
      puts "this is lose"
      lose
    elsif playaction == "2"
      puts "this is tie"
      tie
    else
      puts "this is else"
      play
    end    
  end

  def win
    puts "you won!!"
    @winLoseStatus = 0
    # Casino.gamesCounter
  end

  def lose
    puts "you lost"
    @winLoseStatus = 1
  end

  def tie
    puts "you tied"
    @winLoseStatus = 2
  end
end

@casino = Casino.new