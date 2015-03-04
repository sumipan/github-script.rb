require 'minitest/autorun'
$LOAD_PATH.push('lib')

require 'github/script'

describe Github::Script do
  before do
    @text = File.read('test/script.txt')
  end
  
  it "should create User class instance" do
    skip "conflict other test"
    Github::Script.serve(Github::Script.scan(@text)) do
      User.class.must_equal Class
      User.new.must_be_instance_of User
    end
  end
  
  it "ok" do
    @options = {
      :user => ENV['GITHUB_USER'],
      :repo => ENV['GITHUB_REPO'],
    }
  
    Github::Script.configure do |github|
      github.setup(@options.merge({
        :oauth_token => ENV['GITHUB_TOKEN']
      }))
    end
    
    recipe = Github::Script.discover(ENV['GITHUB_ISSUE'])
    Github::Script.serve(recipe) do
      $server.must_equal "dev02"
    end
  end
end
