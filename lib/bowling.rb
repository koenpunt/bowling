class Frame
  
  def initialize score_1, score_2
    @spare = false
    @score_1 = score_1
    @score_2 = score_2
  end
  
  def score spare = nil
    score_1 = @score_1
    score_2 = @score_2

    if score_2 == '/'
      score_2 = 10 - score_1.to_i
    end

    if spare
      score_1 = score_1.to_i * 2
    end
    
    score_1.to_i + score_2.to_i
  end
  
  def spare
    @score_2 == '/'
  end

end


class Bowling

  def initialize score
    @score = score
    @frames = @score.scan(/../).map do |variable|
      Frame.new(variable[0], variable[1])
    end
  end

  def score
    spare = false
    
    @frames.map do |frame|
      score = frame.score spare
      spare = frame.spare
      score
    end.reduce(:+)
  end

end
