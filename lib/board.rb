class Board

    attr_reader :size, :width
    attr_accessor :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
        @width = n
    end

    def self.print_grid(spots)
        spots.each do |row|
            puts row.join(" ")
        end
        nil
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

    
    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
       
        ship_count = @size/4
        i = 0
        while i < ship_count
            location = [
            rand(0..(@size**(0.5))), rand(0..(@size**(0.5)))]
            if self[location] == :N
                i +=1
                self[location] = :S
            end
        end
    end

    def hidden_ships_grid
        hidden = []
        @grid.each do |rows|
            new_row = []
            rows.each do |spot|
                if spot == :S
                    new_row << :N
                else
                    new_row << spot
                end

            end
            hidden << new_row
        end
        hidden
    end    


end
