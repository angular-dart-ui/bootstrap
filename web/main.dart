library bootstrap_ui;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
import 'dart:html';

import '../lib/alert/alert.dart';

@NgController(
    selector: '[bootstrap-ui-demo]',
    publishAs: 'mainCtrl')
class BootstrapUiController {

  int count = 1;
  
  BootstrapUiController() {
  }
  
  void increaseCount() {
    count++;
  }
  
  void closeAlert() {
    window.alert("closing alert");
  }

}

class MyAppModule extends Module {
  MyAppModule() {
    type(BootstrapUiController);
    type(AlertComponent);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
