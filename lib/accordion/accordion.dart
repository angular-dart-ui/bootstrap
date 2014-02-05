// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui.accordion;

import 'package:angular/angular.dart';
import 'package:angular/utils.dart' as utils;
import 'dart:html';
import 'package:angular_dart_ui_bootstrap/core/core_component.dart';

part 'accordion_group.dart';
part 'accordion_heading.dart';

class AccordionModule extends Module {
  AccordionModule() {
    type(AccordionComponent);
    type(AccordionGroupComponent);
    type(AccordionHeadingTranscludeComponent);
  }
}

@NgComponent(
    selector: 'accordion',
    visibility: NgDirective.CHILDREN_VISIBILITY,
    template:
'''
<div class="panel-group">
  <content></content>
</div>
''',
    publishAs: 'accCtrl',
    applyAuthorStyles: true
)
class AccordionComponent extends BaseComponent {
  
  @NgOneWay('closeOthers')
  bool closeOthers = true;
  
  bool justified = false;
  bool vertical = false;
  List<AccordionGroupComponent> groups = [];
  
  AccordionComponent(Element element) : super(element) {
  }

  void onOpenGroup(AccordionGroupComponent openGroup) {
    if (closeOthers) {
      groups.forEach((group) {
        if ( group != openGroup ) {
          group.isOpen = false;
        }
      });
    }
  }

  void addGroup(AccordionGroupComponent group) {
    groups.add(group);
  }

  void removeGroup(AccordionGroupComponent group) {
    int index = groups.indexOf(group);
    groups.remove(group);
  }
  
}
