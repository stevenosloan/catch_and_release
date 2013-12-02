require 'spec_helper'

describe CatchAndRelease::Release do

  describe "::stdin" do

    it "loads args into stdin" do
      described_class.stdin 'hello world' do
        expect( get_input ).to eq 'hello world'
      end
    end

    it "loads args in order to stdin" do
      described_class.stdin 'hello world', 'second arg' do
        expect( get_input ).to eq 'hello world'
        expect( get_input ).to eq 'second arg'
      end
    end

    context "with a non-default stdin" do
      before :each do
        @set_stdin = StringIO.new
        $stdin = @set_stdin
      end

      it "returns $stdin to it's existing state after the call" do
        described_class.stdin 'hello world' do
          'nothing'
        end

        expect( $stdin ).to eq @set_stdin
      end

      context "when an exception is raised" do
        it "returns $stdin to it's existing state after the call " do
          begin
            described_class.stdin 'hello world' do
              raise "hello world"
            end
          rescue RuntimeError
          end

          expect( $stdin ).to eq @set_stdin
        end
      end
    end

  end

  def get_input
    $stdin.gets.chomp
  end

end