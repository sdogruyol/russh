require 'spec_helper'

describe Russh::Accessor do

  class TestAccessor < Russh::Accessor
    attr_accessor :path
    def initialize
      @path = '/tmp/ssh_conf'
      is_existing?
    end
  end

  subject { TestAccessor.new }

  context 'backup' do
    it 'should copy the original config' do
      subject.backup
      File.read(subject.path + '.bk').should == File.read(subject.path)
    end
  end

  context 'writing' do
    it 'should be able to create a new host' do
      subject.stub(:backup)
      subject.create('host', 'example.com', 'user')
      File.exist?(subject.path).should == true
      File.delete('/tmp/ssh_conf')
    end
  end

  context 'listing' do
    it 'lists all the entries' do
      subject.stub(:backup)
      subject.create('test1', 'test1.com', 'serdar')
      subject.create('test2', 'test2.com', 'serkan')
      expected_output = "\"Host test1 HostName test1.com User serdar\"\n\"Host test2 HostName test2.com User serkan\"\n"
      expect{ subject.list }.to output(expected_output).to_stdout
    end
  end

  after(:all) do
     File.delete('/tmp/ssh_conf', '/tmp/ssh_conf.bk')
  end

end
