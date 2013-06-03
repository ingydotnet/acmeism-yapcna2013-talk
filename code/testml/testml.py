__version__ = '0.0.2'

class TestML:
    def __init__(self, **args)
        self.testml = args.get('testml')
        self.runtime = args.get('runtime')
        self.bridge = args.get('bridge')
        self.library = args.get('library')
        self.compiler = args.get('compiler')

    def run(self, *args):
        self.set_default_classes()
        self.runtime(
            compiler=self.compiler,
            bridge=self.bridge,
            library=self.library,
            testml=self.testml,
        ).run(*args)

    def set_default_classes(self):
        if not self.runtime:
            from testml.runtime.unit import Unit
            self.runtime = Unit
        if not self.compiler:
            from testml.compiler.pegex import Pegex
            self.compiler = Pegex
        if not self.bridge:
            from testml.bridge import Bridge
            self.bridge = Bridge
        if not self.library:
            from testml.library.standard import Standard
            from testml.library.debug import Debug
            self.library = [
                Standard,
                Debug,
            ]
