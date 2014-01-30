// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui.alert;

import 'package:angular/angular.dart';
import 'dart:html';
import 'package:angular_dart_ui_bootstrap/core/core_component.dart';

class AlertModule extends Module {
  AlertModule() {
    type(AlertComponent);
  }
}

@NgComponent(
    selector: 'alert',
    //templateUrl: 'packages/angular_dart_ui_bootstrap_ui/alert/alert.html',
    template:
      '''<div class='alert' ng-class="'alert-' + (alertCtrl.type!=null ? alertCtrl.type : 'warning')">
          <content></content>
          <button ng-if='alertCtrl.closeable' type='button' class='close' ng-click='alertCtrl.onClose()'>&times;</button>
      </div>''',
    publishAs: 'alertCtrl',
    applyAuthorStyles: true,
    map: const {
      'type': '=>type',
      'close': '&closeCallback'
    }
)
class AlertComponent extends BaseComponent {
  
  String type;
  bool closeable = false;
  var closeCallback;
  
  AlertComponent(Element element) : super(element) {
    closeable = element.attributes.containsKey('close');
  }
  
  void onClose() {
    if(closeCallback!=null){
      closeCallback();
    }
  }
  
}
