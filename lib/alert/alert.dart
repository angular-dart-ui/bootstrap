library bootstrap_ui.alert;

import 'package:angular/angular.dart';
import 'dart:html';

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
          <button ng-if='alertCtrl.closeable' type='button' class='close' ng-click='alertCtrl.closeCallback()'>&times;</button>
      </div>''',
    publishAs: 'alertCtrl',
    applyAuthorStyles: true,
    map: const {
      'type': '=>type',
      'close': '&closeCallback'
    }
)
class AlertComponent {
  
  final Element element;
  String type;
  bool closeable = false;
  BoundExpression closeCallback;
  
  AlertComponent(this.element) {
    closeable = element.attributes.containsKey('close');
  }
  
}
