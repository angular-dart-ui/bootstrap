library bootstrap_ui.tabs.test;

import '../_specs.dart';
import 'package:angular_dart_ui_bootstrap/bootstrap.dart';

main() {
  
  Compiler $compile;
  Scope $rootScope;
  Injector injector;
  
  setUp(() {
    setUpInjector();
    module((Module module) {
      module.install(new BootstrapUI());
    });
    inject((
        Compiler _compile, Scope _rootScope, Injector _injector) {
      $compile = _compile; $rootScope = _rootScope; injector = _injector;
    });
  });
  
  tearDown(tearDownInjector);
  
  group('Tabset component', () {
    
    test('true should be true', async(inject(() {

      expect(true).toBeTruthy();
      
    })));
    
  });
}
