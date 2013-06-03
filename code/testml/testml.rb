class TestML
  VERSION = '0.0.2'

  attr_accessor :runtime
  attr_accessor :compiler
  attr_accessor :bridge
  attr_accessor :library
  attr_accessor :testml

  def initialize attributes={}
    attributes.each { |k,v| self.send "#{k}=", v }
    yield self if block_given?
  end

  def run(*args)
    set_default_classes
    @runtime.new(
      compiler: @compiler,
      bridge: @bridge,
      library: @library,
      testml: @testml,
    ).run(*args)
  end

  def set_default_classes
    if not @runtime
      require 'testml/runtime/unit'
      @runtime = TestML::Runtime::Unit
    end
    if not @compiler
      require 'testml/compiler/pegex'
      @compiler = TestML::Compiler::Pegex
    end
    if not @bridge
      require 'testml/bridge'
      @bridge = TestML::Bridge
    end
    if not @library
      require 'testml/library/standard'
      require 'testml/library/debug'
      @library = [
        TestML::Library::Standard,
        TestML::Library::Debug,
      ]
    end
  end
end
