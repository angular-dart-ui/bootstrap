library alert_test;

import '../_specs.dart';
import '../../web/main.dart';

main() {
  
  setUp(() {
   setUpInjector();
   module((Module m) => m.install(new MyAppModule()));
  });
  
  tearDown(tearDownInjector);
  
  group('ngRepeat', () {
    TestBed _;
    setUp(inject((TestBed tb) => _ = tb));

    test('should x', () {
      _.compile("<div>" + 
          "<alert ng-repeat='alert in alerts' type='alert.type'" +
            "close='removeAlert(\$index)'>{{alert.msg}}" +
          "</alert>" +
        "</div>");
      _.rootScope.alerts = [
                             { 'msg':'foo', 'type':'success'},
                             { 'msg':'bar', 'type':'error'},
                             { 'msg':'baz'}
                             ];
      _.rootScope.$digest();
      
      expect(_.rootElement.querySelectorAll("alert").length).toEqual(3);

    });
  });
  
}

