library bootstrap.ui.alert;

import 'package:angular/angular.dart';
import 'dart:html';
import 'package:angular_dart_ui_bootstrap/core/BaseComponent.dart';

class AlertModule extends Module {
  AlertModule() {
    type(AlertComponent);
  }
}

@NgComponent(
    selector: 'alert',
    //templateUrl: 'packages/angular_dart_ui_bootstrap_ui/alert/alert.html',
    template:
      '''<div class='alert' ng-class="'alert-' + alertCtrl.type">
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
