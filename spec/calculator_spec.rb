require 'rspec'
require './calculator'

RSpec.describe Calculator do
  subject { described_class.new(left, right) }

  let(:left) { 4 }
  let(:right) { 2 }

  describe '#sum' do
    it 'sums two numbers' do
      puts "sum ===> #{subject.object_id}"
      expect(subject.sum).to eq(6)
      expect(subject.last_result).to eq(6)
    end
  end

  describe '#minus' do
    it 'subtracts two numbers' do
      puts "subtract ===> #{subject.object_id}"
      expect(subject.minus).to eq(2)
      expect(subject.last_result).to eq(2)
    end
  end

  describe '#divide' do
    it 'divides two numbers' do
      puts "divide ===> #{subject.object_id}"
      expect(subject.divide).to eq(2)
      expect(subject.last_result).to eq(2)
    end

    context 'when second argument is equal zero' do
      let(:right) { 0 }

      it 'raises an error' do
        puts "divide/context ===> #{subject.object_id}"
        expect { subject.divide }.to raise_error(ZeroDivisionError)
      end
    end

    context 'when first argument is equal zero' do
      let(:left) { 0 }

      it 'returns zero' do
        puts "divide/conetx#2 ===> #{subject.object_id}"
        expect(subject.divide).to eq(0)
        expect(subject.last_result).to eq(0)
      end
    end
  end
end
