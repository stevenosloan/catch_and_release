require 'spec_helper'
require 'catch_and_release/rspec'

RSpec.configure do |c|
  c.include CatchAndRelease::RSpec
end

describe CatchAndRelease::RSpec do
  it "works to include methods in RSpec scope" do
    expect( respond_to?(:catch_stdout) ).to be_truthy
  end
end