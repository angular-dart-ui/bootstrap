// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.accordion;

@NgComponent(
    selector: 'accordion-group',
    visibility: NgDirective.CHILDREN_VISIBILITY,
    template:
'''
<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title">
      <a class="accordion-toggle" ng-click="accGroupCtrl.toggleOpen()">
        <span ng-class="{'text-muted': accGroupCtrl.isDisabled}">
          <accordion-heading-transclude></accordion-heading-transclude>
        </span>
      </a>
    </h4>
  </div>
  <div class="panel-collapse" collapse="!accGroupCtrl.isOpen">
    <div class="panel-body">
      <content></content>
    </div>
  </div>
</div>
''',
    publishAs: 'accGroupCtrl',
    applyAuthorStyles: true,
    map: const {
      'isOpen' : '<=>isOpen',
      'heading' : '@heading'
    }
)
class AccordionGroupComponent extends BaseComponent implements NgDetachAware {
  
  final AccordionComponent accCtrl;
  String heading;
  bool isDisabled = false;
  bool _open = false;
  
  AccordionGroupComponent(Element element, this.accCtrl) : super(element) {
    this.accCtrl.addGroup(this);
  }

  get isOpen => _open;
  
  set isOpen(var newValue) {
    _open = utils.toBool(newValue);
    if (_open) {
      accCtrl.onOpenGroup(this);
    }
  }
  
  void toggleOpen() {
    isOpen = !isOpen;
  }

  void detach() {
    this.accCtrl.removeGroup(this);
  }
}

