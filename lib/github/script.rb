require "github/script/version"

module Github
  module Script
    def proc(fixture, &block)
      eval fixture
      instance_eval &block
    end
    
    module_function :proc
  end
end
