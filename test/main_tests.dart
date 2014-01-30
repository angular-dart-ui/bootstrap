// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui.test;

import 'dart:html' ;
import 'package:unittest/html_enhanced_config.dart';
import '_specs.dart';

import 'package:angular_dart_ui_bootstrap/core/core_component.dart';
import 'package:angular_dart_ui_bootstrap/bootstrap.dart';

part 'alert/alert_test.dart';
part 'buttons/buttons_test.dart';
part 'collapse/collapse_test.dart';
part 'core/core_component_test.dart';
part 'dropdown_toggle/dropdown_toggle_test.dart';
part 'tabs/tabs_test.dart';

void main() {
  print('Test Suite for Angular-Dart-UI');
  try {
    useHtmlEnhancedConfiguration(); 
  } catch (exception, stackTrace) {
    //if the tests are launched in karma an exception is thrown here. Ignore it.
  }
  group('All Tests for Angular-Dart-UI', () {
    test('Alert', () => alertTest());
    test('Buttons', () => buttonsTest());
    test('Collapse', () => collapseTest());
    test('Core', () => coreTest());
    test('Dropdown Toggle', () => dropdownToggleTest());
    test('Tabs', () => tabsTest());
  });
}


Element compileComponent(String html, Compiler $compile, Scope $rootScope, Injector injector, {int repeatDigest:1}) {
  JQuery element = $(html.trim());
  $compile(element)(injector, element);
  for (int i=0; i<repeatDigest; i++) {
    microLeap();
    $rootScope.$digest();
  }
  return element[0];
}

List<Element> extSelector(var element, String selector) {
  List<Element> elements = new List();
  //print("outo for each " + element.innerHtml);
  //print("search: " + element.querySelector("[" + BaseComponent.BOOTSTRAP_COMPONENT_ATTR + "]").toString());
  elements.addAll( element.querySelectorAll(selector) );
  element.querySelectorAll("[" + BaseComponent.BOOTSTRAP_COMPONENT_ATTR + "]").forEach((Element e) {
    elements.addAll( extSelector(e.shadowRoot, selector) );
  });
  return elements;
}

