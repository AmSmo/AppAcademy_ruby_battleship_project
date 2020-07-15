require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player= Player.new
        @board = Board.new(n)
        @remaining_misses = (@board.size/2)
    end
    
    def start_game
        @board.place_random_ships
        puts "You have #{@board.num_ships} to sink"
        puts @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true

        else
            return false
        end
    end

    def win?

        if @board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end

    end

    def game_over?
        win? || lose?
    end

    def turn
        move = @player.get_move
        if valid?(move)
            
            if !@board.attack(move)
                @remaining_misses-=1
            end
            @board.print
            puts "You have: #{@remaining_misses} shots left"
        else
            turn
        end
    end

    def valid?(move)
            if move.length == 2 && move.all? {|thing| thing.is_a? Integer}
                if move[0]< @board.width && move[1] < @board.width && move.length
                    return true
                else 
                    puts "Not a valid move, the board is top/left is 0 and bottom right is #{board.width-1}"
                    return false
                end
            else
                puts "Those aren't two numbers"
                turn
            end
            
    

    end
end

