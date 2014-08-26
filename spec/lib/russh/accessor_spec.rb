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
    end
  end

  after(:all) do
    File.delete('/tmp/ssh_conf', '/tmp/ssh_conf.bk')
  end

end
