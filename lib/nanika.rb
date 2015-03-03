require "nanika/version"

module Nanika
  def proc(fixture, &block)
    eval fixture
    instance_eval &block
  end
  
  module_function :proc
end
