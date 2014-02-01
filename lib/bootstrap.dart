// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui;

import 'package:angular/angular.dart';
import 'package:angular_dart_ui_bootstrap/accordion/accordion.dart';
import 'package:angular_dart_ui_bootstrap/alert/alert.dart';
import 'package:angular_dart_ui_bootstrap/buttons/buttons.dart';
import 'package:angular_dart_ui_bootstrap/collapse/collapse.dart';
import 'package:angular_dart_ui_bootstrap/dropdown_toggle/dropdown_toggle.dart';
import 'package:angular_dart_ui_bootstrap/tabs/tabset.dart';

class BootstrapUI extends Module {
  
  BootstrapUI() {
    install(new AccordionModule());
    install(new AlertModule());
    install(new ButtonsModule());
    install(new CollapseModule());
    install(new DropdownToggleModule());
    install(new TabsetModule());
  }

}