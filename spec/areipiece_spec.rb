require 'spec_helper'

describe Areipiece do

  before do
    
  end
  
  it 'has a version number' do
    expect(Areipiece::VERSION).not_to be nil
  end

  it 'has error if database.yml is not found' do
    Dir.chdir("/var/share/")
    ret = Areipiece::SP.new.piece
    expect(ret).to eq(false)
  end
  
  it 'is successfully registered piece' do
    Dir.chdir("/var/share/zomeki")
    ret1 = Areipiece::SP.new.piece
    expect(ret1).to eq(true)
    
    ret2 = Areipiece::SP.new.piece
    expect(ret2).to eq(true)
  end
end
