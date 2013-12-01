require 'spec_helper'

describe CatchAndRelease do
  it "has a version #" do
    expect( CatchAndRelease::VERSION >= '0.0.0' ).to be_truthy
  end
end