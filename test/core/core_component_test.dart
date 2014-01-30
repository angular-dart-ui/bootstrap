// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.test;

@NgComponent(
    selector : 'base-component',
    template : '''<div id='testBaseComponent'>HELLO FROM BASE COMPONENT</div>'''
)
class BaseComponentImpl extends BaseComponent {
  BaseComponentImpl(Element element) : super(element);
}

void coreTest() {
  
  Compiler $compile;
  Scope $rootScope;
  Injector injector;
  
  setUp(() {
    setUpInjector();
    module((Module module) {
      module.type(BaseComponentImpl);
    });
    inject((
        Compiler _compile, Scope _rootScope, Injector _injector) {
      $compile = _compile; $rootScope = _rootScope; injector = _injector;
    });
  });
  
  tearDown(tearDownInjector);

  group('CoreComponent basics', () {
    
    test('Component should have a custom attribute', async(inject(() {
      String HTML = '''<base-component>Some text here</base-component>''';
      Element elem = compileComponent(HTML, $compile, $rootScope, injector);
      expect(elem.attributes.containsKey(BaseComponent.BOOTSTRAP_COMPONENT_ATTR)).toBeTruthy();
      
    })));
    
    test('Should be able to search into the shadow dom', async(inject(() {
      String HTML = '''<div><base-component>Some text here</base-component></div>''';
      Element elem = compileComponent(HTML, $compile, $rootScope, injector);
      //print(elem.shadowRoot.innerHtml);
      //print(extSelector(elem, "#testBaseComponent")[0].text);
      expect(extSelector(elem, "#testBaseComponent")[0].text).toEqual('HELLO FROM BASE COMPONENT');
    })));
    
  });
  
}