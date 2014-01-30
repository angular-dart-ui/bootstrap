// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.test;

void dropdownToggleTest() {
  describe('DropdownToggle', () {
    TestBed _;
    beforeEach(setUpInjector);
    beforeEach(module((Module module) {
      module.install(new BootstrapUI());
    }));
    beforeEach(inject((TestBed tb) => _ = tb));

    afterEach(tearDownInjector);

    Element dropdown() {
      return _.compile('<li class="dropdown"><a class="dropdown-toggle"></a><ul class="dropdown-menu"><li>Hello</li></ul></li>');
    }

    it('should toggle on `a` click', () {
      Element elm = dropdown();
      expect(elm.classes.contains('open')).toBe(false);
      elm.querySelector('a').click();
      expect(elm.classes.contains('open')).toBe(true);
      elm.querySelector('a').click();
      expect(elm.classes.contains('open')).toBe(false);
    });

    /* To be enable when a proper way to trigger keyboard events is found 
    it('should close on escape key', () {
      Element elm = dropdown();
      elm.querySelector('a').click();
      expect(elm.classes.contains('open')).toBe(true);
      KeyboardEvent event = new KeyboardEvent("keydown");
      event.keyCode = 27;
      window.dispatchEvent(event);
      expect(elm.classes.contains('open')).toBe(false);
    });
    */

    it('should close on document click', () {
      Element elm = dropdown();
      elm.querySelector('a').click();
      document.body.click();
      expect(elm.classes.contains('open')).toBe(false);
    });

    it('should only allow one dropdown to be open at once', () {
      Element elm1 = dropdown();
      Element elm2 = dropdown();
      elm1.querySelector('a').click();
      elm2.querySelector('a').click();
      expect(elm1.classes.contains('open')).toBe(false);
      expect(elm2.classes.contains('open')).toBe(true);
    });
  });
}
