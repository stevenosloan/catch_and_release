module CatchAndRelease
  module Catch

    class << self
      def stdout &block
        Stdout.new.capture(&block).read
      end

      def stderr &block
        Stderr.new.capture(&block).read
      end
    end

    class Stdout
      attr_reader :orig_stdout
      attr_reader :new_stdout

      def initialize
        @orig_stdout = $stdout
        @new_stdout  = StringIO.new
      end

      def capture &block
        $stdout = new_stdout
        yield
        return self
      ensure
        $stdout = orig_stdout
      end

      def read
        new_stdout.rewind
        new_stdout.read
      end
    end

    class Stderr
      attr_reader :orig_stderr
      attr_reader :new_stderr

      def initialize
        @orig_stderr = $stderr
        @new_stderr  = StringIO.new
      end

      def capture &block
        $stderr = new_stderr
        yield
        return self
      ensure
        $stderr = orig_stderr
      end

      def read
        new_stderr.rewind
        new_stderr.read
      end
    end

  end
end