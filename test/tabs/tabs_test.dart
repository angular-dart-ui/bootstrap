library bootstrap.ui.tabs.test;

import '../_specs.dart';
import 'package:angular_dart_ui_bootstrap/core/bootstrap.dart';

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
  
  List<Element> titles(Element elm) {
    return elm.children[0].shadowRoot.querySelectorAll('ul.nav-tabs li');
  }
  
  List<Element> contents(Element elm) {
    return extSelector( elm , '.tab-pane' );
  }

  void expectTitles(Element elm, titlesArray) {
    List<Element> t = titles(elm);
    expect(t.length).toEqual(titlesArray.length);
    for (int i=0; i<t.length; i++) {
      expect(extSelector(t[i] ,'tab-heading')[0].innerHtml.trim()).toEqual(titlesArray[i]);
    }
  }
  
  group('Tabset - basics', () {
    
    Element createElement() {
      Scope scope = $rootScope; //.$new();
      scope.first = '1';
      scope.second = '2';
      scope.actives = {};
      scope.selectFirst = () {};
      scope.selectSecond = () {};
      scope.deselectFirst = () {};
      scope.deselectSecond = () {};
      
      String html =  '''
          <div>
            <tabset class="hello" data-pizza="pepperoni">
              <tab heading="First Tab {{first}}" active="actives.one" select="selectFirst()" deselect="deselectFirst()">
                first content is {{first}}
              </tab>
              <tab active="actives.two" select="selectSecond()" deselect="deselectSecond()">
                <tab-heading><b>Second</b> Tab {{second}}</tab-heading>
                second content is {{second}}
              </tab>
            </tabset>
          </div>
          ''';
      return compileComponent(html, $compile, $rootScope, injector, repeatDigest:4);
    };

    /*
    test('should pass class and other attributes on to tab template', async(inject(() {
      var tabbable = elm.querySelector('.tabbable');
      expect(tabbable).toHaveClass('hello');
      expect(tabbable.attributes['data-pizza']).toBe('pepperoni');
    })));
    */
    
    test('should create clickable titles', async(inject(() {
      ElementList<Element> t = titles(createElement());
      expect(t.length).toBe(2);
      //print(t[0].outerHtml);
      expect(renderedText( extSelector(t[0] ,'a')[0] )).toEqual('First Tab 1');
      //It should put the tab-heading element into the 'a' title
      //print( extSelector(t[1] ,'tab-heading')[0].innerHtml );
      //expect( extSelector(t[1] ,'a')[0].children[0].shadowRoot .is('tab-heading')).toBe(true);
      expect(renderedText( extSelector(t[1] ,'a')[0] )).toEqual('Second Tab 2');
      expect( extSelector(t[1] ,'tab-heading')[0].innerHtml ).toEqual('<b>Second</b> Tab 2');
    })));

    test('should bind tabs content and set first tab active', async(inject(() {
      Element elems = createElement();
      expectContent(elems, 'first content is 1');
      
      expect(contents(elems)[0]).toHaveClass('active');
      expect(contents(elems)[1]).not.toHaveClass('active');
      //expect(scope.actives.one).toBe(true);
      //expect(scope.actives.two).toBe(false);
    })));
    
    test('should change active on click', async(inject(() {
      Element elems = createElement();
      extSelector(titles(elems)[1] , 'a')[0].click();
      expect(contents(elems)[0]).toHaveClass('active');
      expect(titles(elems)[0]).not.toHaveClass('active');
      expect(titles(elems)[1]).toHaveClass('active');
      //expect($rootScope.actives.one).toBe(false);
      //expect($rootScope.actives.two).toBe(true);
    })));

    /*
    it('should call select callback on select', function() {
      titles().eq(1).find('a').click();
      expect(scope.selectSecond).toHaveBeenCalled();
      titles().eq(0).find('a').click();
      expect(scope.selectFirst).toHaveBeenCalled();
    });

    it('should call deselect callback on deselect', function() {
      titles().eq(1).find('a').click();
      titles().eq(0).find('a').click();
      expect(scope.deselectSecond).toHaveBeenCalled();
      titles().eq(1).find('a').click();
      expect(scope.deselectFirst).toHaveBeenCalled();
    });
**/
  });
}
