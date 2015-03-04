require "github/script/version"

module Github
  module Script
    def proc(text, *args, &block)
      raise "error. text is null" unless text

      eval scan(text), TOPLEVEL_BINDING
      self.instance_eval &block
    end

    def self.scan(text)
      inside = false
      script = ""

      text.each_line do |line|
        if  line.match('^```script') then
          inside = true 
        elsif line.match('^```') then
          inside = false 
        elsif inside then
          script += line
        end
      end

      script
    end
    
    module_function :proc
  end
end
