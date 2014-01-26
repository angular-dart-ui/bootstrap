// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui.core;

import 'dart:html';

abstract class BaseComponent {
  
  static final String BOOTSTRAP_COMPONENT_ATTR = 'bootstrap-component';
  final Element element;
  
  BaseComponent(this.element) {
    element.attributes.putIfAbsent(BOOTSTRAP_COMPONENT_ATTR, () => '');
  }
  
}