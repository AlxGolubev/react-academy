require 'rspec'
require './hello'

RSpec.describe "Hello.rb" do
  describe '#sum' do
    subject { sum(left, right) }

    let(:left) { 1 }
    let(:right) { 2 }

    let(:result) { 3 }

    it { is_expected.to eq result }

    context 'when users passes strings instead of numbers' do
      let(:left) { 'hello' }
      let(:right) { ' world' }
      let(:result) { 'hello world' }

      it { is_expected.to eq result }
    end
  end

  describe '#divide' do
    subject { divide(left, right) }

    let(:left) { 4 }
    let(:right) { 2 }
    let(:result) { 2 }

    it { is_expected.to eq result }

    context 'when second argument is equal zero' do
      let(:right) { 0 }

      it { expect { subject }.to raise_error('You cannot divide on zero') }
    end
  end

  describe '#app' do
    subject { app }

    let(:sum_left) { 1 }
    let(:sum_right) { 2 }
    let(:divide_left) { 4 }
    let(:divide_right) { 2 }

    let(:prompt) do
      <<-EOS
Running method sum
#{sum_left + sum_right}
Running method divide
#{divide_left / divide_right}
      EOS
    end

    before do
      allow_any_instance_of(Kernel).to receive(:gets).and_return(
        sum_left, sum_right, divide_left, divide_right
      )
    end

    it 'exectues app with several outputs' do
      expect { subject }.to output(prompt).to_stdout
    end
  end
end
