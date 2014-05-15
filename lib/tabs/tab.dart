// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.tabs;

@Component(
    selector: 'tab',
    visibility: Directive.CHILDREN_VISIBILITY,
    template:
'''
<div ng-if="tabCtrl.active" class="tab-pane" ng-class="{active: tabCtrl.active}">
  <content></content>
</div>
''',
    publishAs: 'tabCtrl',
    applyAuthorStyles: true,
    map: const {
      'disabled' : '<=>disabled',
      'active' : '<=>active',
      'heading': '@heading',
      'select': '&onSelectCallback', //This callback is called in contentHeadingTransclude
                          //once it inserts the tab's content into the dom
      'deselect': '&onDeselectCallback'
    }
)
class TabComponent implements DetachAware {
  
  final TabsetComponent tabsetCtrl; 
  final Element element;
  var heading;
  var onSelectCallback;
  var onDeselectCallback;
  bool _active = false;
  bool disabled = false;
  
  TabComponent(this.element, this.tabsetCtrl, Scope scope) {
    this.tabsetCtrl.addTab(this);
  }

  get active => _active;
  
  set active(var newValue) {
    if (newValue!=null && newValue==true) {
      tabsetCtrl.select(this);
    }
  }
  
  set select(bool newValue) {
    if (newValue) {
      if(onSelectCallback!=null) {
        onSelectCallback();
      }
    } else {
      if(_active && onDeselectCallback!=null) {
        onDeselectCallback();
      }
    }
    _active = newValue;
  }

  void detach() {
    this.tabsetCtrl.removeTab(this);
  }
}

