require 'spec_helper'

describe Russh::Accessor do

  context 'accessing' do
    it 'should be able to read .ssh/config' do
      subject.is_readable?.should == true
    end
    it 'should be able to write .ssh/config' do
      subject.is_writable?.should == true
    end
  end

  context 'backup' do
    it 'should copy the original config' do
      subject.backup
      File.read( subject.path + '.bk').should == subject.read
    end
  end

  context 'reading' do
    it 'should be able to get the file content' do
      subject.read.should_not == nil
    end
  end

  context 'writing' do
    it 'should be able to create a new host' do
      subject.stub(:backup)
      subject.create('host', 'example.com', 'user')
      File.exist?(subject.path).should == true
    end
  end

end
