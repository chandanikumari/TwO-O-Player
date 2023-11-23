class Game

  def initialize
    @game_over = false
    @turn = Turn.new
    @math = Question.new
  end

  def start_game
    while !@game_over
      puts "----- TURN #{@turn.current_turn} -----"
      puts "#{@turn.current_player.name} it's your turn"
      @math.question
      answer = gets.chomp.to_i

      if answer != @math.answer
        puts "#{@turn.current_player.name} you are incorrect"
        @turn.current_player.wrong
      else
        puts "#{@turn.current_player.name} you are correct"
      end

      if @turn.current_player.lives < 1
      @game_over = true
      @turn.new_turn
      puts "#{@turn.current_player.name} wins with a score of #{@turn.current_player.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      else
        puts "#{@turn.player1.name}: #{@turn.player1.lives}/3 vs #{@turn.player2.name}: #{@turn.player2.lives}/3"
      end
      
      @turn.new_turn
    end
  end
end