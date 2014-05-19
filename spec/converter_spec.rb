require_relative 'spec_helper'

include Table2PNG 

describe Converter do

  subject(:png) { Converter.new(table).process }
  
  describe '#process' do
    context 'given a small table' do
      let(:table) { File.read(Dir.pwd + "/spec/fixtures/small_table.html") }
      let(:result) { File.read(Dir.pwd + "/spec/fixtures/small.png") }

      it 'converts table to trimmed png' do
        expect(png.to_blob).to eq(result)
        expect(png.width).to eq(300) 
        expect(png.height).to eq(73) 
      end
    end

    context 'given a big table' do
      let(:table) { File.read(Dir.pwd + "/spec/fixtures/big_table.html") }
      let(:result) { File.read(Dir.pwd + "/spec/fixtures/big.png") }
      
      it 'converts table to trimmed png' do
        expect(png.to_blob).to eq(result)
        expect(png.width).to eq(845) 
        expect(png.height).to eq(414) 
      end
    end
  end
end
