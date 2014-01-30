// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.test;

void collapseTest() {
  
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
  
  group('Collapse', () {

    Element compileCollapse() {
      return compileComponent('<div collapse="isCollapsed">Some Content</div>', $compile, $rootScope, injector);
    };

    test('should be hidden on initialization if isCollapsed = true without transition', async(inject(() {
      $rootScope.isCollapsed = true;
      Element collapseElement = compileCollapse();
      expect(collapseElement.style.height).toEqual('0px');
    })));
    
    test('should be shown on initialization if isCollapsed = false without transition', async(inject(() {
      $rootScope.isCollapsed = false;
      Element collapseElement = compileCollapse();
      expect(collapseElement.style.height).not.toEqual('0px');
    })));
    
  });
  
}

