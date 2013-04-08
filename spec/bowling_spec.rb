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
  
  it '3 and gutter should return 3' do
    bowling = Bowling.new "3-"
    
    bowling.score.should eq(3)
  end
  
  it '3 and 4 and gutter should return 7' do
    bowling = Bowling.new "3--4"
    
    bowling.score.should eq(7)
  end
  
  it '-/30 should duplicate second frame' do
    bowling = Bowling.new "-/30"
    bowling.score.should eq(16)
  end
  
  it '0/03 should duplicate second frame' do
    bowling = Bowling.new "0/03"
    bowling.score.should eq(13)
  end
  
end

describe 'Frame' do
  
  it 'should return 0' do
    frame = Frame.new('0', '0')
    frame.score.should eq(0)
  end
  
  it 'should return 10' do
    frame = Frame.new('1', '9')
    frame.score.should eq(10)
  end
  
  it '3 and spare should return 10' do
    frame = Frame.new('1', '/')
    frame.score.should eq(10)
  end
  
  
  it 'gutter and spare should return 10' do
    frame = Frame.new('-', '/')
    frame.score.should eq(10)
  end
  
  it 'should multiply on spare' do
    frame = Frame.new('-', '/')
    frame.spare.should be_true
  end
end