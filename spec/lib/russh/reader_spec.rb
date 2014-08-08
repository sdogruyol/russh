require 'spec_helper'

describe Russh::Reader do
  it 'should be able to read .ssh/config' do
    File.read('~/.ssh/config')
  end
end