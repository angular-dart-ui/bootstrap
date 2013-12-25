library bootstrap_ui.alert;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'alert',
    templateUrl: 'packages/angular_dart_ui_bootstrap_ui/alert/alert.html',
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
