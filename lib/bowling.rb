class Frame

  def initialize score
    @score = score
    @spare = false
    @score_1, @score_2 = *score.split('')
  end

  def score spare = false, strike = false
    score_1 = @score_1
    score_2 = @score_2

    # Strike
    if score_1 == 'x'
      score_1 = 10
      score_2 = 0
    end

    # Spare
    if score_2 == '/'
      score_2 = 10 - score_1.to_i
    end

    score_1 = score_1.to_i
    score_2 = score_2.to_i

    if spare
      score_1 = score_1 * 2
    end

    if strike
      score_1 = score_1 * 2
      score_2 = score_2 * 2
    end

    score_1 + score_2
  end

  def spare
    @score_2 == '/'
  end

  def strike
    @score_1 == 'x'
  end

end


class Bowling

  def initialize score
    @frames = []
    @score = score
    @score.scan(/[0-9\/-]{2}|x/) do |score|
      @frames << Frame.new(score)
    end
  end

  def score
    spare = false
    strike = false

    @frames.map do |frame|
      score = frame.score spare, strike
      spare = frame.spare
      strike = frame.strike
      score
    end.reduce(:+)
  end

end
