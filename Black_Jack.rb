@deck = ["Ace",2, 3,4,5,6,7, 8, 9,10,"Jack","Queen","King","Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King"]


def round

  # playerHand = ["Ace"]
  playerHand = [] << @deck.sample
  dealerHand = [] << @deck.sample
  p "Can you get closer than the dealer to 21 without going over?"
  p "First off, how much would you like to bet?"
  playerBet = gets.chomp!
  p "Fantastic. You are dealt #{playerHand.first}."
  p "You can either hit, or you can stay"
  p "(hit/stay)"
  playerAction = gets.chomp!

  while playerAction == "hit"
    playerHand = playerHand << @deck.sample

    dealerHand = dealerHand << @deck.sample
    puts " Your hand is how #{playerHand}. (hit/stay)"
    playerAction = gets.chomp!
  end

  while playerAction == "stay"

  
    dealerTotal = dealerHand.map { |x| x == "King" ? 10 : x }
    dealerTotal = dealerTotal.map { |x| x == "Queen" ? 10 : x }
    dealerTotal = dealerTotal.map { |x| x == "Jack" ? 10 : x }
    playerTotal = playerHand.map { |x| x == "King" ? 10 : x }
    playerTotal = playerTotal.map { |x| x == "Queen" ? 10 : x }
    playerTotal = playerTotal.map { |x| x == "Jack" ? 10 : x }


    if playerTotal.include? "Ace"
      playerTotal.delete("Ace")
      if playerTotal.sum + 11 > 21
        playerTotal << 1
      elsif playerTotal.sum + 11 <= 21
        playerTotal << 11
      end
      else
        p "well poop"
     end 
          
    if dealerTotal.include? "Ace"
      dealerTotal.delete("Ace")
      if dealerTotal.sum + 11 > 21
        dealerTotal << 1
      elsif dealerTotal.sum + 11 <= 21
        dealerTotal << 11
      end
      else
        p "well poop"
     end 


      dealerTotal = dealerTotal.inject(:+)
      playerTotal = playerTotal.inject(:+)

      
      puts "Okay great!  Now lets see who wins.  You had #{playerHand} for a total of #{playerTotal}."
      puts "Press return to contunue"
      filler = gets.chomp!
      puts "The dealer had #{dealerHand} for a total of #{dealerTotal}."
      puts "Press return to contunue"
      filler = gets.chomp!
      playerWinnings = playerBet.to_i * 2

      if dealerTotal > 21 && playerTotal > 21
        puts "You both bust.  You get your bet of #{playerBet} back"
      elsif dealerTotal > 21 && playerTotal < 22
        puts "The dealer busted! You recieve #{playerWinnings}"
      elsif dealerTotal <22 && playerTotal > 21
        puts "You busted and lose your bet of #{playerBet}."
      elsif dealerTotal > playerTotal
        puts "The Dealer wins. You lose your bet of #{playerBet}."
      elsif playerTotal > dealerTotal
        puts "You win!  You are awarded #{playerWinnings}!"
      else 
        puts "Hopefully you dont see this because if you do then that means its broke and being broke is no fun :("
      end 

      break

    end

  end

  round