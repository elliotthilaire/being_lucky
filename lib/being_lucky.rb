# Calculate the score of a turn according to the rules of Being Lucky
# Give it an array with the face shown for each dice rolled.
# e.g. [2, 1, 5]; for three dice, rolled on a two, a one, and a five.
class BeingLucky
  def initialize(dice)
    raise ArgumentError.new, 'must have maximum 5 dice' if dice.count > 5
    raise ArgumentError.new, 'must have minimum 1 dice' if dice.count == 0
    raise ArgumentError.new, 'must be numbers' unless dice.all? { |i| i.is_a? Fixnum }
    @dice = dice
  end

  # Calculate score for each face that is rolled.
  # then return the sum.
  def score
    scores = @dice.uniq.map { |face| calculate_score(face,  @dice.count(face)) }
    scores.reduce(:+)
  end

  private

  # Tell it a face and the number of times the face appears
  # and it will calculate the total score for that face
  def calculate_score(face, count)
    face_score = 0

    # score triples
    number_of_triples = count / 3
    face_score += triple_score(face) * number_of_triples

    # score singles
    number_of_singles = count % 3
    face_score + single_score(face) * number_of_singles
  end

  # Lookup points for a triple face
  def triple_score(face)
    points = { 1 => 1000, 2 => 200, 3 => 300, 4 => 400, 5 => 500, 6 => 600 }
    points[face] || 0
  end

  # Lookup points for a single face
  def single_score(face)
    points = { 1 => 100, 5 => 50 }
    points[face] || 0
  end
end
