module CatchAndRelease
  module RSpec

    Catch.spec_methods.each do |method|
      define_method "catch_#{method}" do
        Catch.public_send(method)
      end
    end

    Release.spec_methods.each do |method|
      define_method "release_#{method}" do |*args|
        Release.public_send(method,*args)
      end
    end

  end
end