class TicTacToe

    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    # array of arrays of indexes into an array
    
    def initialize(board=nil)
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i-1 
        # new var integers = string arg converted to integer
    end

    def move(index, token="X") # index = player input number (1-9)
        @board[index] = token
        # runs the method above to take player move (ex. 1) and substract 
        # 1 space to get array spot 0 (which is where they really want to play)
    end

    def position_taken?(index)
        @board[index] == " " ? false : true

    end
        # will check to see if that position on the @board is vacant or if it
        # contains an "X" or an "O". If the position is free, the method should 
        # return false (i.e., "the position is not taken"); 
        # otherwise, it will return true.
        # def position_taken?(input_to_index)
        #     if @board[input_to_index] == "X" || @board[input_to_index] == "O" 
        #     true
        # else 
        #     false
        # end
   
    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
        # if index > 9
        #     false
        # elsif position_taken?(index) == true
        #     false
        # else
        #     true
        # end
    end

    def turn_count
        @new_array = []
        @board.each do |space|
            if space == "X"
                @new_array << space
            elsif space == "O"
                @new_array << space
            else
            end
        end
        @new_array.length 
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Would you like to play a game?"
        puts "Let's play Tic Tac Toe!"
        puts "Enter a number 1-9 to correspond to a square:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end
    #     loop do 
    #         num = gets
    #         @new_num = input_to_index(num)
    #         if valid_move?(@new_num) == true  
    #             break
    #         end
    #     end
    #     move(@new_num, current_player)
    #     display_board
    # end

    def won?
        WIN_COMBINATIONS.detect {|combo| (@board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[0]] && @board[combo[0]] != " ")}
        # WIN_COMBINATIONS.each do |combos|
        #     if (@board[combos[0]] == @board[combos[1]] && @board[combos[2]] == @board[combos[0]] && @board[combos[0]] != " ")
        #         return combos               
        #     end
        # end
        # nil
    end

    # def won? 
    #     WIN_COMBINATIONS.each do |combos|
    #         if (@board[combos[0]] == "X" && @board[combos[1]] == "X" && @board[combos[2]] == "X") || 
    #             (@board[combos[0]] == "O" && @board[combos[1]] == "O" && @board[combos[2]] == "O")
    #             return combos
    #         end
    #     end
    #     false
    # end

    def full?
        @board.all? {|i| i != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw? || full?
    end

    def winner
        !won? ? nil : @board[won?[0]]
    end
    
    def play
        display_board
        until over? do
            turn
        end
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

    # if valid_move?(new_num)
    #     move(new_num, current_player)
    #     display_board
    # else
    #     num = gets 
    # end

    # ask for input
    # get input
    # translate input into index
    # if index is valid
    #   make the move for index
    #   show the board
    # else
    #   ask for input again
    # end     

    # def turn
    #     puts "enter #"
    #     user_input = gets.strip
    #     index = input_to_index(user_input)
    #     if valid_move?(index)
    #         move(index, current_player)
    #         display_board
    #     else
    #         turn
    #     end
    # end



end

