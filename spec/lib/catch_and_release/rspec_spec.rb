require 'spec_helper'
require 'catch_and_release/rspec'

RSpec.configure do |c|
  c.include CatchAndRelease::RSpec
end

describe CatchAndRelease::RSpec do
  it "includes methods in RSpec scope" do
    expect( respond_to?(:catch_stdout) ).to be_truthy
  end
  it "passes blocks methods" do
    out = catch_stdout do
      print 'hello world'
    end

    expect( out ).to eq 'hello world'
  end
end