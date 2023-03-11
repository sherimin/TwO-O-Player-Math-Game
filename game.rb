class Game

    attr_accessor :turn, :player1, :player2

    def initialize
        @turn = 1
        @player1 = 3
        @player2 = 3
    end

    def start
        question = Question.new(turn)
        turn

        num1 = rand(1..20)
        num2 = rand(1..20)

        puts " ----- NEW TURN ----- "

        puts "Player #{turn}: What does #{num1} plus #{num2} equal?"

        print "> "

        answer = $stdin.gets.chomp.to_i

        if answer === num1 + num2
            puts "Player #{turn}: YES! You are correct."
            show_score
            update_turn(turn)
        else 
            puts "Player #{turn}: Seriously? No!"
            remaining_lives(turn)
            show_score
            update_turn(turn)
        end
    end

    def update_turn(turn)
        if turn == 1
            @turn = 2
        else
            @turn =1
        end
        start
    end

    def show_score
        puts "P1 : #{@player1}/3 vs P2: #{@player2}/3"
    end

    def game_over_player1_win
        puts "Player 1 wins with a score of #{@player1}/#{@player2}"
        puts " ----- GAME OVER -----"
        puts "Good bye!"
        exit(0)
    end

    def game_over_player2_win
        puts "Player 2 wins with a score of #{@player2}/#{@player1}"
        puts " ----- GAME OVER -----"
        puts "Good bye!"
        exit(0)
    end

    def remaining_lives(turn)
        if turn == 1
            @player1 -= 1
        else
            @player2 -=1
        end

        if @player1 == 0
            game_over_player2_win
        end

        if @player2 == 0
            game_over_player1_win
        end
    end

end