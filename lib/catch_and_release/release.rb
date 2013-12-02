module CatchAndRelease
  module Release

    class << self

      def stdin *args, &block
        Stdin.new.release(*args, &block)
      end

    end

    class Stdin
      attr_reader :orig_stdin
      attr_reader :new_stdin

      def initialize
        @orig_stdin = $stdin
        @new_stdin  = StringIO.new
      end

      def release *args, &block
        $stdin = new_stdin
        $stdin.puts(args.shift) until args.empty?
        $stdin.rewind

        yield
      ensure
        $stdin = orig_stdin
      end

    end

  end
end