# This is a simple solution to the Coin Change Problem
# http://en.wikipedia.org/wiki/Coin_problem and
# http://www.algorithmist.com/index.php/Coin_Change
# I solved this problem using a couple of different
# approaches. See below for Gist Links

class Change
  def change(amount)
    available_coins  = [100,50,25,10,5,1]
    coins            = []          # holds list of coins to return
    remaining_amount = amount
    available_coins.each do |coin| # counts down finds biggest coins first
      if ((remaining_amount/coin).to_int > 0)
      then (remaining_amount/coin).to_int.times { coins << coin }
        puts "Remaining Amount: #{remaining_amount} | Coin: #{coin}"
        remaining_amount = amount - coins.inject(:+)
      end                         # coins.inject(:+) sums array items
    end                           # stackoverflow.com/a/1538801/1148249
    puts "Amount #{amount} >> Coins: #{coins}\n\n"
    return coins
  end
end

# RSPEC Unit Tests:
describe Change do

  it "returns [1] for 1" do
    expect(subject.change(1)).to eq [1]
  end

  it "returns [1, 1, 1, 1] for 4" do
    expect(subject.change(4)).to eq [1,1,1,1]
  end

  it "returns [5, 1] for 6" do
    expect(subject.change(6)).to eq [5,1]
  end

  it "returns [25, 10, 10, 1, 1, 1] for 48" do
    expect(subject.change(48)).to eq [25,10,10,1,1,1]
  end

  it "returns [100, 25, 10, 5, 1, 1] for 142" do
    expect(subject.change(142)).to eq [100,25,10,5,1,1]
  end

  it "returns [100,100,50,25,10,5,1] for 291" do
    expect(subject.change(291)).to eq [100,100,50,25,10,5,1]
  end

end

# Alternative Solutions:
# Two (separate) methods:
# https://gist.github.com/4570492

# Two Nested Until Loops (recursive):
# https://gist.github.com/4570556

# One .each Loop, Subtraction AND Division (a bit fancier)
# https://gist.github.com/4570709

# 5 - Liner (compressed method to single line - unmaintainable!)
# https://gist.github.com/4570855
