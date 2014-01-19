library bootstrap_ui_demo;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
import 'dart:html';
import 'package:angular_dart_ui_bootstrap/core/bootstrap.dart';

part 'buttons/buttonsDemo.dart';

@NgController(
    selector: '[bootstrap-ui-demo]',
    publishAs: 'mainCtrl')
class BootstrapUiController {

  int count = 1;
  Map actives = {};
  
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
    type(ButtonsDemoController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
