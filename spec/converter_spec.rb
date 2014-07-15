require_relative 'spec_helper'

include Table2PNG 

describe Converter do

  subject(:png) { Converter.new(table).process style}

  describe '#process' do
    context 'given a small table' do
      let(:style) { nil }
      let(:table) { File.read(Dir.pwd + "/spec/fixtures/small_table.html") }
      let(:result) { File.read(Dir.pwd + "/spec/fixtures/small.png") }

      it 'converts table to trimmed png' do
        expect(png.to_blob).to eq(result)
        expect(png.width).to eq(300) 
        expect(png.height).to eq(73) 
      end
    end

    context 'given a big table' do
      let(:style) { nil }
      let(:table) { File.read(Dir.pwd + "/spec/fixtures/big_table.html") }
      let(:result) { File.read(Dir.pwd + "/spec/fixtures/big.png") }
      
      it 'converts table to trimmed png' do
        expect(png.to_blob).to eq(result)
        expect(png.width).to eq(845) 
        expect(png.height).to eq(414) 
      end
    end

    context 'given a small table with other style file' do
      let(:style) { ['public/other_style.css'] }
      let(:table) { File.read(Dir.pwd + "/spec/fixtures/small_table.html") }
      let(:result) { File.read(Dir.pwd + "/spec/fixtures/other_style_small.png")}

      it 'should have new design' do
        expect(png.to_blob).to eq(result)
      end
    end

    context 'given a small table with wrong style file' do
      it 'should raises' do
        expect{Converter.new(File.read(Dir.pwd + "/spec/fixtures/small_table.html")).process('public/style.css')}.to raise_error(
          RuntimeError,
          'Please pass list of css path i.e [\'/public/file.css\',\'/public/file2.css\']')
      end
    end
  end

end
