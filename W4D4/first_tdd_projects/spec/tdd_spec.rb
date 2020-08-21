require 'tdd'

describe '#my_uniq' do
    subject(:array) { [1, 2, 1, 3, 3] }
    # let(:empty_array) { [] }
    # # [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
    it 'should accept an array' do
        expect { my_uniq(array) }.to_not raise_error
    end

    it 'should return unique elements in the order that they appear' do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end
end

describe '#two_sum' do
    subject(:array) { [-1, 0, 2, -2, 1] }

    it 'should accept an array' do
        expect { array.two_sum }.to_not raise_error
    end

    it 'should find pairs that sum to 0' do 
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

end

describe '#my_transpose' do
    subject(:array) {[
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
          ]}

    it 'should accept an array' do
        expect { my_transpose(array) }.to_not raise_error
    end

    it 'should return subarray of an appropriate length' do
        transposed = my_transpose(array)
        expect(transposed[0].length).to eq(array.length)
    end

    it 'should return a transposed array' do 
        expect( my_transpose(array) ).to eq( [
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
              ])
    end
end

describe '#stock_picker' do
    it 'return most profitable pair of days' do
        expect(stock_picker([1,2,3,1,2])).to eq([0, 2])
    end
    it 'return earliest buy date and best sell date' do
        expect(stock_picker([1,2,7,1,10])).to eq([0,4])
    end
    it 'should return earliest profits made' do
        expect(stock_picker([1,2,1,2,1])).to eq([0,1])
    end
    it 'should return empty array if no profit is made' do
        expect(stock_picker([5,4,3,2,1])).to eq([])
        expect(stock_picker([1,1,1,1,1])).to eq([])
    end
end

describe Towers_of_Hanoi do
    subject(:game) { Towers_of_Hanoi.new }
    
    describe '#initialize' do
        it 'should create a rendered board' do
            expect(game.board).to eq([[1,2,3],[],[]])
        end
    end

    describe '#valid_move?' do
        it 'should take in a start and end position' do
            expect(game.valid_move?(0,1)).to be(true)
            expect(game.valid_move?(0,5)).to be(false)
        end
    end

    describe '#move' do
        it 'should take in a start and end position' do
            expect{game.valid_move?(0,1)}.to_not raise_error
            expect{game.valid_move?("a", 5)}.to raise_error(ArgumentError)
            expect{game.valid_move?(0)}.to raise_error(ArgumentError)
        end
    end

    describe '#play_game' do
        it 'should receive response from player' do
            input = double('0\n', :chomp => '0', :to_i => 0)
            allow(game).to receive(:gets).and_return(input)
        end
    end
    
end

