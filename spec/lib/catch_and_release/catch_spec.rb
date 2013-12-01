require 'spec_helper'

describe CatchAndRelease::Catch do

  describe "::stdout" do
    it "returns $stdout output from the given block" do
      out = described_class.stdout do
        $stdout.print "hello world"
      end

      expect( out ).to eq "hello world"
    end
  end

  describe "::stderr" do
    it "returns $stderr output from the given block" do
      out = described_class.stderr do
        $stderr.print "hello world"
      end

      expect( out ).to eq "hello world"
    end
  end

end