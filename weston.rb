def main
    myWallet = Wallet.new
    myWallet.addChips(15)
    while true
        game = Game.new
        puts "You have #{myWallet.chips} chips, how much do you want to bet"
        input = gets.chomp
        myBet = Bet.new input.to_i
        while game.winLoseStatus == -1
            game.playGame
        end
        if game.winLoseStatus == 0
            myWallet.subChips myBet.bet
        elsif game.winLoseStatus == 1
            myWallet.addChips Bet.won(myBet.bet)
        end
                
    end 
end
class Wallet
    attr_accessor :chips
    def initialize
        @chips = 0
    end
    def addChips amount
        @chips += amount
    end
    def subChips amount
        @chips -= amount
    end
end
class Game
    attr_accessor :winLoseStatus
    def initialize
        @winLoseStatus = -1
    end
    def win
        @winLoseStatus = 1
    end
    def lose
        @winLoseStatus = 0
    end
    def playGame
        puts "playing game"
        case gets.chomp
        when "0"
            puts "You lost"
            lose
        when "1"
            puts "You won"
            win
        end
    end
end
class Bet
    attr_accessor :bet
    def initialize amount
        @bet = amount
    end
    def self.won bet
        bet * 2
    end
end
main