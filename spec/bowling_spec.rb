require 'spec_helper'

require 'bowling'

describe 'Bowling' do
  
  it 'should return 0' do
    bowling = Bowling.new "0000"
    bowling.score.should eq(0)
  end

  it 'should return 8' do
    bowling = Bowling.new "3140"
    bowling.score.should eq(8)
  end

  it '3 and spare should return 10' do
    bowling = Bowling.new "3/"
    bowling.score.should eq(10)
  end

  it 'should not count a miss' do
    bowling = Bowling.new "3-"
    bowling.score.should eq(3)
  end

  it 'should not count misses' do
    bowling = Bowling.new "3--4"
    bowling.score.should eq(7)
  end

  it 'should duplicate third roll' do
    bowling = Bowling.new "-/30"
    bowling.score.should eq(16)

    bowling = Bowling.new "0/03"
    bowling.score.should eq(13)
  end

  it 'should validate with a spare as last' do
    bowling = Bowling.new "133/"
    bowling.score.should eq(14)
  end

  it 'should validate with multiple spares' do
    bowling = Bowling.new "14456/5/91"
    bowling.score.should eq(58)
  end

  it 'should validate a strike' do
    bowling = Bowling.new "14x"
    bowling.score.should eq(15)
  end

  it 'should duplicate next 2 rolls after strike' do
    bowling = Bowling.new "14x30"
    bowling.score.should eq(21)
  end

  it 'should run a complete game' do
    bowling = Bowling.new "14456/5/x017/6/x2/"
    bowling.score.should eq(127)
  end

end

describe 'Frame' do

  it 'should return 0' do
    frame = Frame.new('00')
    frame.score.should eq(0)
  end

  it 'should return 10 (sum of 1 and 9)' do
    frame = Frame.new('19')
    frame.score.should eq(10)
  end

  it 'should return 10 on spare' do
    frame = Frame.new('1/')
    frame.score.should eq(10)
  end

  it 'should return 10 on spare with -' do
    frame = Frame.new('-/')
    frame.score.should eq(10)
  end

  it 'should identify as spare' do
    frame = Frame.new('-/')
    frame.spare.should be_true
  end

  it 'should multiply first score' do
    frame = Frame.new('1/')
    frame.score(true).should eq(11)

    frame = Frame.new('8/')
    frame.score(true).should eq(18)
  end

  it 'should return 10 on strike' do
    frame = Frame.new('x')
    frame.score.should eq(10)
  end

  it 'should identify as strike' do
    frame = Frame.new('x')
    frame.strike.should be_true
  end

  it 'should multiply first and second score' do
    frame = Frame.new('1/')
    frame.score(false, true).should eq(20)

    frame = Frame.new('8/')
    frame.score(false, true).should eq(20)

    frame = Frame.new('12')
    frame.score(false, true).should eq(6)
  end

end