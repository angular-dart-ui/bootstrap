library bootstrap_ui.alert;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'alert',
    //templateUrl: 'packages/angular_dart_ui_bootstrap_ui/alert/alert.html',
    template:
      '''<div class='alert' ng-class='"alert-" + alertCtrl.type'>
          <content></content>
          <button ng-if='alertCtrl.closeCallback!=null' type='button' class='close' ng-click='alertCtrl.close()'>&times;</button>
      </div>''',
    publishAs: 'alertCtrl',
    applyAuthorStyles: true,
    map: const {
      'type': '@type',
      'close': '&closeCallback'
    }
)
class AlertComponent {
  
  String type;
  Function closeCallback;
  
  void close() {
    if (closeCallback!=null) {
      closeCallback();
    }
  }
  
}
