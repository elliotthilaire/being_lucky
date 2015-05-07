require_relative '../lib/being_lucky'

describe 'BeingLucky' do
  describe 'score' do
    context 'when dice = [5, 1, 3, 4, 1]' do
      it 'returns 250' do
        dice = [5, 1, 3, 4, 1]
        expect(BeingLucky.new(dice).score).to equal(250)
      end
    end

    context 'when dice = [1, 1, 1, 3, 1]' do
      it 'returns 1100' do
        dice = [1, 1, 1, 3, 1]
        expect(BeingLucky.new(dice).score).to equal(1100)
      end
    end

    context 'when dice = [2, 4, 4, 5, 4]' do
      it 'returns 450' do
        dice = [2, 4, 4, 5, 4]
        expect(BeingLucky.new(dice).score).to equal(450)
      end
    end

    context 'when one dice' do
      it 'returns correct score' do
        dice = [1]
        expect(BeingLucky.new(dice).score).to equal(100)
      end
    end

    context 'when three scoring, and one unscoring' do
      it 'returns correct score' do
        dice = [2, 2, 2, 2]
        expect(BeingLucky.new(dice).score).to equal(200)
      end
    end
  end

  context 'when invalid input' do
    context 'when no dice' do
      it 'raises an error' do
        dice = []
        expect { BeingLucky.new(dice) }.to raise_error('NoDiceError')
      end
    end

    context 'when too many dice' do
      it 'raises an error' do
        dice = [1, 1, 1, 1, 1, 1]
        expect { BeingLucky.new(dice) }.to raise_error('TooManyDiceError')
      end
    end

    context 'when not a dice' do
      it 'raises an error' do
        dice = [1, 1, 'string']
        expect { BeingLucky.new(dice) }.to raise_error('InvalidDiceError')
      end
    end
  end
end
