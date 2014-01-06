library bootstrap.ui.core;

import 'package:angular_dart_ui_bootstrap/alert/alert.dart';
import 'package:angular_dart_ui_bootstrap/tabs/tabset.dart';
import 'package:angular/angular.dart';

class BootstrapUI extends Module {
  
  BootstrapUI() {
    install(new AlertModule());
    install(new TabsetModule());
  }

}