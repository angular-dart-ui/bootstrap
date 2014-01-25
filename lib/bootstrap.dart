library bootstrap.ui;

import 'package:angular/angular.dart';
import 'package:angular_dart_ui_bootstrap/alert/alert.dart';
import 'package:angular_dart_ui_bootstrap/buttons/buttons.dart';
import 'package:angular_dart_ui_bootstrap/dropdown_toggle/dropdown_toggle.dart';
import 'package:angular_dart_ui_bootstrap/tabs/tabset.dart';

class BootstrapUI extends Module {
  
  BootstrapUI() {
    install(new AlertModule());
    install(new ButtonsModule());
    install(new DropdownToggleModule());
    install(new TabsetModule());
  }

}