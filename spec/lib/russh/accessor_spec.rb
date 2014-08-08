require 'spec_helper'

describe Russh::Reader do
  it 'should be able to read .ssh/config' do
    subject.is_readable?.should == true
  end
  it 'should be able to write .ssh/config' do
    subject.is_writable?.should == true
  end
end
