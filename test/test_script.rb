require 'minitest/autorun'
$LOAD_PATH.push('lib')

require 'github/script'

describe Github::Script do
  before do
    @text = File.read('test/script.txt')
  end
  
  it "should create User class instance" do
    Github::Script.proc(@text) do
      User.class.must_equal Class
      User.new.must_be_instance_of User
    end
  end
end
