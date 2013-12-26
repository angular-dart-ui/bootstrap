library _specs_spec;

import '_specs.dart';

main() {
  group('renderedText', () {
    test('should work on regular DOM nodes', () {
      expect(renderedText($('<span>A<span>C</span></span><span>B</span>'))).toEqual('ACB');
    });

    test('should work with shadow DOM', () {
      var elt = $('<div>DOM content</div>');
      var shadow = elt[0].createShadowRoot();
      shadow.setInnerHtml(
          '<div>Shadow content</div><content>SHADOW-CONTENT</content>',
          treeSanitizer: new NullTreeSanitizer());
      expect(renderedText(elt)).toEqual('Shadow contentDOM content');
    });

    test('should ignore comments', () {
      expect(renderedText($('<!--e--><span>A<span>C</span></span><span>B</span>'))).toEqual('ACB');
    });
  });


  group('jquery', () {
    group('html', () {
      test('get', (){
        var div = $('<div>');
        expect(div.html()).toEqual('');
      });

      test('set', (){
        var div = $('<div>');
        expect(div.html('text')).toBe(div);
        expect(div.html()).toEqual('text');
      });
    });
  });
}
