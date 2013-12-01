require 'spec_helper'

describe CatchAndRelease::Catch do

  describe "::stdout" do
    it "returns $stdout output from the given block" do
      out = described_class.stdout do
        $stdout.print "hello world"
      end

      expect( out ).to eq "hello world"
    end

    context "with a non-default stdout" do
      before :each do
        @set_stdout = StringIO.new
        $stdout = @set_stdout
      end

      it "returns $stdout to it's existing state after the call" do
        described_class.stdout do
          $stdout.print "hello world"
        end

        expect( $stdout ).to eq @set_stdout
      end

      context "when an exception is raised" do
        it "returns $stdout to it's existing state after the call " do
          begin
            described_class.stdout do
              raise "hello world"
            end
          rescue RuntimeError
          end

          expect( $stdout ).to eq @set_stdout
        end
      end
    end
  end

  describe "::stderr" do
    it "returns $stderr output from the given block" do
      out = described_class.stderr do
        $stderr.print "hello world"
      end

      expect( out ).to eq "hello world"
    end

    context "with a non-default stderr" do
      before :each do
        @set_stderr = StringIO.new
        $stderr = @set_stderr
      end

      it "returns $stderr to it's existing state after the call" do
        described_class.stderr do
          $stderr.print "hello world"
        end

        expect( $stderr ).to eq @set_stderr
      end

      context "when an exception is raised" do
        it "returns $stderr to it's existing state after the call " do
          begin
            described_class.stderr do
              raise "hello world"
            end
          rescue RuntimeError
          end

          expect( $stderr ).to eq @set_stderr
        end
      end
    end
  end

end