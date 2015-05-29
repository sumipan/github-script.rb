require "github/script/version"
require "github_api"

module Github
  module Script
    def configure(&block)
      @github = Github::Client.new
      yield @github
    end

    def discover(number)
      raise "error. text is null" unless number
      text = @github.issues.get(:number => number).body.body
      scan(text)
    end

    def serve(text, &block)
      text.untaint

      thread = Thread.new {
        $SAFE = 0
        eval text, TOPLEVEL_BINDING
        self.instance_eval &block if block_given?
      }

      thread.join
    end

    def scan(text)
      inside = false
      script = ""

      text.each_line do |line|
        if  line.match(/^```script/) then
          inside = true
        elsif line.match(/^```/) then
          inside = false
        elsif inside then
          script += line
        elsif match = line.match(/#(\d+)/) then
          text = @github.issues.get(:number => match[1].to_i).body.body
          script += scan(text)
        end
      end

      script
    end

    module_function :configure, :discover, :serve, :scan
  end
end
