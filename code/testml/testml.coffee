class TestML
  VERSION = '0.0.2'

  constructor: ->
    @runtime = null
    @compiler = null
    @bridge = null
    @library = null
    @testml = null

  run: (args...) ->
    @.set_default_classes()
    new @runtime(
      compiler: @compiler,
      bridge: @bridge,
      library: @library,
      testml: @testml,
    ).run(args...)

  set_default_classes: ->
    if not @runtime
      require '../TestML/Runtime'
      @runtime = TestML.Runtime
    if not @compiler
      require '../TestML/Compiler'
      @compiler = TestML.Compiler
    if not @bridge
      require '../TestML/Bridge'
      @bridge = TestML.Bridge
    if not @library
      require '../TestML/Library/Standard'
      require '../TestML/Library/Debug'
      @library = TestML.Library = [
        TestML.Library.Standard,
        TestML.Library.Debug,
      ]
