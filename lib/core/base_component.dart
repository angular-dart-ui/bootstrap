library bootstrap.ui.core.test;

import 'dart:html';

abstract class BaseComponent {
  
  static final String BOOTSTRAP_COMPONENT_ATTR = 'bootstrap-component';
  final Element element;
  
  BaseComponent(this.element) {
    element.attributes.putIfAbsent(BOOTSTRAP_COMPONENT_ATTR, () => '');
  }
  
}