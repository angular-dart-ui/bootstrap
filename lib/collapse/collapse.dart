// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui.collapse;

import 'package:angular/angular.dart';
import 'package:angular/utils.dart' as utils;
import 'dart:html';
import 'package:angular_dart_ui_bootstrap/core/core_component.dart';

class CollapseModule extends Module {
  CollapseModule() {
    type(CollapseDirective);
  }
}

@NgDirective(
    selector: '[collapse]',
    map: const {
      'collapse': '=>collapseValue'
    }
)
class CollapseDirective extends BaseComponent {
  
  CollapseDirective(Element element) : super(element);
  
  set collapseValue(var collapseValue) {
    if (utils.toBool(collapseValue)) {
      collapse();
    } else {
      expand();
    }
  }
  
  void expand() {
    element.classes.remove('collapse');
    element.classes.add('collapse-in');
    element.style.height = 'auto';
  }
  
  void collapse() {
    element.classes.remove('collapse-in');
    element.classes.add('collapse');
    element.style.height = "0px";
  }
  
}
