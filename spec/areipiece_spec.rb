require 'spec_helper'

describe Areipiece do
  it 'has a version number' do
    expect(Areipiece::VERSION).not_to be nil
  end

  it 'is successfully register piece' do
    ret = Areipiece::SP.new.piece
    expect(ret).to eq(true)
  end
end
