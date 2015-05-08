# Calculate the score of a turn according to the rules of Being Lucky
# Give it an array with the face shown for each dice rolled.
# e.g. [2, 1, 5]; for three dice, rolled on a two, a one, and a five.
class BeingLucky
  def initialize(dice)
    fail 'TooManyDiceError' if dice.count > 5
    fail 'NoDiceError' if dice.count == 0
    fail 'InvalidDiceError' unless dice.all? { |i| i.is_a? Fixnum }
    @dice = dice
  end

  def score
    calculate_score
  end

  private

  # Calculate score for each face and sum the results
  def calculate_score
    scores = @dice.uniq.map { |face| lookup_score(face,  @dice.count(face)) }
    scores.reduce(:+)
  end

  # Tell it a face and the number of times the face appears
  # and it will look up the score. If there is no rule, the score is 0.
  def lookup_score(face, count)
    score = scoring_rules[face][count]
    score || 0
  end

  # The scoring rules formatted as a hash.
  # { dice_face => { times_face_appears => score, ..}, ..}
  def scoring_rules
    {
      1 => { 1 => 100, 2 => 200, 3 => 1000, 4 => 1100, 5 => 1200 },
      2 => { 3 => 200, 4 => 200, 5 => 200 },
      3 => { 3 => 300, 4 => 300, 5 => 300 },
      4 => { 3 => 400, 4 => 400, 5 => 400 },
      5 => { 1 => 50, 2 => 100, 3 => 500, 4 => 550, 5 => 600 },
      6 => { 3 => 600, 4 => 600, 5 => 600 }
    }
  end
end
