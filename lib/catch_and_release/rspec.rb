module CatchAndRelease
  module RSpec

    Catch.spec_methods.each do |method|
      define_method "catch_#{method}" do |&block|
        Catch.public_send(method,&block)
      end
    end

    Release.spec_methods.each do |method|
      define_method "release_#{method}" do |*args, &block|
        Release.public_send(method,*args,&block)
      end
    end

  end
end