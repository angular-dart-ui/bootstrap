library bootstrap_ui;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
import 'dart:html';

import 'package:angular_dart_ui_bootstrap/bootstrap.dart';

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
    install(new BootstrapUI());
    type(BootstrapUiController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
