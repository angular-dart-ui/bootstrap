// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.test;

void accordionTest() {
  
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
  
  group('Accordion', () {
  
    group('Controller', () {
        AccordionComponent ctrl = new AccordionComponent(new DivElement()  );
        AccordionGroupComponent group1, group2, group3;
        
        setUp(() {
          group1 = new AccordionGroupComponent(new DivElement(),ctrl);
          group1.isOpen = true;
          group2 = new AccordionGroupComponent(new DivElement(),ctrl);
          group2.isOpen = true;
          group3 = new AccordionGroupComponent(new DivElement(),ctrl);
          group3.isOpen = true;
        });
        
        test('adds a the specified panel to the collection', async(inject(() {
          expect(ctrl.groups.length).toBe(3);
          expect(ctrl.groups[0]).toBe(group1);
          expect(ctrl.groups[1]).toBe(group2);
          expect(ctrl.groups[2]).toBe(group3);
          group2.detach();
          expect(ctrl.groups.length).toBe(2);
          expect(ctrl.groups[0]).toBe(group1);
          expect(ctrl.groups[1]).toBe(group3);
        })));
        
        test('should close other panels if close-others attribute is not defined', async(inject(() {
          group2.isOpen = true;
          expect(group1.isOpen).toBe(false);
          expect(group2.isOpen).toBe(true);
          expect(group3.isOpen).toBe(false);
        })));

        
        test('should close other panels if close-others attribute is true', async(inject(() {
          ctrl.closeOthers = true;
          group3.isOpen = true;
          expect(group1.isOpen).toBe(false);
          expect(group2.isOpen).toBe(false);
          expect(group3.isOpen).toBe(true);
        })));

        
        test('should not close other panels if close-others attribute is false', async(inject(() {
          ctrl.closeOthers = false;
          group1.isOpen = true;
          group2.isOpen = true;
          group3.isOpen = true;
          expect(group1.isOpen).toBe(true);
          expect(group2.isOpen).toBe(true);
          expect(group3.isOpen).toBe(true);
        })));

    });
    
  });
}


