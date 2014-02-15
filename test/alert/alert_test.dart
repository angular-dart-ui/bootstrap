// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.test;

void alertTest() {
  
  String HTML = "<div test-div>" + 
      "<alert ng-repeat='alert in alerts' type='alert.type' close='onCloseCallback(\$index)'>{{alert.msg}}</alert>" +
    "</div>";
  
  List<Map> alerts = [
                     { 'msg':'foo', 'type':'success'},
                     { 'msg':'bar', 'type':'error'},
                     { 'msg':'baz'}
                     ];
  
  Compiler $compile;
  Scope $rootScope;
  Injector injector;
  DirectiveMap directives;
  
  setUp(() {
    setUpInjector();
    module((Module module) {
      module.install(new BootstrapUI());
    });
    inject((
        Compiler _compile, Scope _rootScope, Injector _injector, DirectiveMap _directives) {
      $compile = _compile; $rootScope = _rootScope; injector = _injector; directives = _directives;
    });
  });
  
  tearDown(tearDownInjector);
  
  group('Alert', () {
    
    Element findAlert(Element elem, int index) {
      return elem.children[index].shadowRoot.querySelector('.alert');
    }
    
    Element findCloseButton(Element elem, int index) {
      return elem.children[index].shadowRoot.querySelector('.close');
    }

  
    test('should render a simple alert', async(inject(() {

      $rootScope.alert = { 'msg':'foo', 'type':'success'};
      String html = "<div test-div>" + 
          "<alert type='alert.type'>{{alert.msg}}</alert>" +
          "</div>";
      Element elem = compileComponent(html, $compile, $rootScope, injector, directives);

      //print('elem.outerHtml: ' + elem.outerHtml);
      //print('elem.children[0]: ' + elem.children[0].outerHtml);
      //print('shadow inner of 0: ' + elem.children[0].shadowRoot.innerHtml);
      expect(findAlert(elem, 0)).toHaveClass("alert-success");
      
    })));
    
    
    test("should generate alerts using ng-repeat", async(inject(() {
      $rootScope.alerts = alerts;
      Element elem = compileComponent(HTML, $compile, $rootScope, injector, directives, repeatDigest:2);
      expect(elem.children.length).toEqual(3);
      
      for (Element e in elem.children) {
        expect(e.shadowRoot.querySelector('.alert')).toBeNotNull();
      }
      
    })));
    
    
    test("should use correct classes for different alert types", async(inject(() {
      $rootScope.alerts = alerts;
      Element elem = compileComponent(HTML, $compile, $rootScope, injector, directives, repeatDigest:2);
      
      expect(findAlert(elem, 0)).toHaveClass('alert-success');
      expect(findAlert(elem, 1)).toHaveClass('alert-error');

      //defaults
      expect(findAlert(elem, 2)).toHaveClass('alert');
      expect(findAlert(elem, 2)).not.toHaveClass('alert-info');
      expect(findAlert(elem, 2)).not.toHaveClass('alert-block');
    })));
    
    
    test("should fire callback when closed", async(inject(() {

      int closeIndex = 1;
      $rootScope.alerts = alerts;
      $rootScope.closeCallbackCalls=0;
      $rootScope.onCloseCallback = (int index) {
        $rootScope.closeCallbackCalls++;
        expect(index).toBe(closeIndex);
      };
      
      Element elem = compileComponent(HTML, $compile, $rootScope, injector, directives, repeatDigest:2);
      findCloseButton(elem, closeIndex).click();
      expect($rootScope.closeCallbackCalls).toBe(1);
    })));

    
    test("should show close buttons", async(inject(() {

      $rootScope.alerts = alerts;
      $rootScope.onCloseCallback = () {};
      
      Element elem = compileComponent(HTML, $compile, $rootScope, injector, directives, repeatDigest:2);

      for (var i = 0, n = alerts.length; i < n; i++) {
        expect(findCloseButton(elem, i)).toBeNotNull();
      }
    })));
    
    
    test("should not show close buttons if no close callback specified", async(inject(() {

      $rootScope.alert = { 'msg':'foo', 'type':'success'};
      String html = "<div test-div>" + 
          "<alert type='alert.type'>{{alert.msg}}</alert>" +
          "</div>";
      Element elem = compileComponent(html, $compile, $rootScope, injector, directives, repeatDigest:2);
      
      //print('shadow inner of 0: ' + elem.children[0].shadowRoot.innerHtml);
      expect(findCloseButton(elem, 0)).toBeNull();
    })));

    /*
    it('it should be possible to add additional classes for alert', function () {
      var element = $compile('<alert class="alert-block" type="\'info\'">Default alert!</alert>')(scope);
      scope.$digest();
      expect(element).toHaveClass('alert-block');
      expect(element).toHaveClass('alert-info');
    });
    */
    
  });
  
}

