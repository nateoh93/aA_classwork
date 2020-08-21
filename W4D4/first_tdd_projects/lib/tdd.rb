#TEST FOR EDGE CASES

# Remove dups
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.

def my_uniq(arr)
    new_arr = arr.uniq
    new_arr
end

# Two sum
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":

# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)
class Array
    def two_sum
        res = []
        (0..self.length - 1).each do |i1|
            (0..self.length - 1).each do |i2|
                res << [i1,i2] if self[i1] + self[i2] == 0 && (i2 > i1)
            end
        end
        res
    end
end

# My Transpose
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:

def my_transpose(arr)
    new_arr = arr.transpose
    new_arr
end
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]

# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:

# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:

# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]

# Stock Picker
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days 
# on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!

def stock_picker(stocks)
    return [] if stocks.uniq.length == 1 || (stocks == stocks.sort.reverse)

    best_profit = [stocks.index(stocks.min), stocks.index(stocks.max)]
    best_profit
end

# Stock prices = [1,2,3,1,2] ==> [0, 2] 
# Stock prices = [1,2,7,1,10] ==> [0, 5]
# Stock prices = [1,2,1,2,1] ==> [?,?] go with the first
# Stock prices = [5,4,3,2,1] ==> []
# Stock prices = [1,1,1,1,1] ==> []
# stock price = stock_price[i]
# stock price at day = stock_price.index(stock)

# Towers of Hanoi
# Write a Towers of Hanoi game.

class Towers_of_Hanoi

    attr_accessor :board

    def initialize
        @board = [[1,2,3],[],[]]
    end

    def start_game
        self.play_game
    end

    def play_game
        p board
        until won?
            puts "enter a start and end position 0 1 or 2"
            start_response = gets.chomp.to_i
            end_response = gets.chomp.to_i
            move(start_response, end_response)
            p board
        end
        puts 'You win'
    end

    def move(start_pos, end_pos)
        if valid_move?(start_pos, end_pos)
            # [[1,2,3],[],[]]
            ele = board[start_pos].shift
            # [[2,3],[],[1]] # move(0, 2)
            board[end_pos].unshift(ele)
        end
        # [[2,3],[],[1]]
        board
    end

    def valid_move?(start_pos, end_pos) # works
        return false if !start_pos.between?(0,2) || !end_pos.between?(0,2)
        return true if board[end_pos].empty?
        if board[start_pos].first > board[end_pos].first
            puts 'Invalid move'
            return false
        end
        return true
    end

    protected
    def won? # works
        if (0..1).all? { |subA| board[subA].empty? }
            return true
        else 
            # puts 'Not yet! :D'
            return false
        end
        # puts 'You win'
    end

end

# play = Towers_of_Hanoi.new
# play.play_game

# puts
# p play.move(0, 2)
# puts
# p play.move(0, 1)
# puts
# p play.move(2, 1)
# puts
# p play.move(0, 2)
# puts
# p play.move(1, 0)
# puts
# p play.move(1, 2)
# puts
# p play.move(0, 2)

#     #   #-
#   #   #--
#   #   #-----

# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size. Don't worry too much about making the user interface pretty.

    # 3 arrays [ [1,2,3]        []          []   ]
    # end goal [ []        []          [1,2,3]   ]
    # to represent piles of discs

# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.

    # ask user for what pile and where to place the disk
    # arr[0], arr[1]
    # if arr[0].shift > arr[1].first ==> raise invalid move. can't put larger disc on a smaller disc
            #[ [3,4]        [1,2]          []   ]

# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!

    # return you win if ending arr == end goal

# Note: don't worry about testing the UI. Testing console I/O is tricky (don't bother checking gets or puts). Focus on:

# #move
# #won?