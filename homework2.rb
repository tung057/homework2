class Player
  def initialize(name)
    @name = name
    def get_gesture
    input = gets.chomp.upcase
    end
  end 
end

# 人類玩家的類別
class Human < Player
  
end

# 電腦的類別
class Computer < Player
  def get_gesture
  	input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS
  def initialize
     show_message
  end
  def intro
    #印出開場畫面，告訴玩家遊戲規
    puts "|===============================================|" 
    puts "|Welcome to Rock Paper Scissors!!!              |"
    puts "|===============================================|"
  end

  def decide
    #邏輯判斷式
    hash = {
      "S"=>"P",
      "P"=>"R",
      "R"=>"S"
    }


    if hash[@user_input] == @com_input
        puts "you win"
        elsif hash[@com_input] == @user_input
        puts "computer win"
        else 
        puts "draw"

    end
  end
  
  def get_player_gestures
    #取得玩家和電腦兩個物件的
    puts "猜拳R/P/S"
    human = Human.new(@user_input)
    @user_input = human.get_gesture
    computer = Computer.new(@com_input)
    @com_input = computer.get_gesture
    puts "com出" + @com_input + " user出 " + @user_input

  end

  def continue?
    #判斷玩家是否要繼續下一輪
     begin
    puts 'Play Again?: Y / N'
    player = Player.new(@continue)
    @continue = player.get_gesture
     end while !["Y", "N"].include?(@continue)

  end

  def show_message
    #印出結果
     intro 
     begin
     get_player_gestures 
     decide  
     continue?
     end while @continue == 'Y'
  end
end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new