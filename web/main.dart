// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap_ui_demo;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
import '../lib/bootstrap.dart';
import 'dart:html';

part 'alert/alertDemo.dart';
part 'buttons/buttonsDemo.dart';
part 'collapse/collapseDemo.dart';
part 'dropdown_toggle/dropdownToggleDemo.dart';
part 'tabs/tabsDemo.dart';

@NgController(
    selector: '[bootstrap-ui-demo]',
    publishAs: 'mainCtrl')
class BootstrapUiController {

  List<ModuleDefinition> modules = [];
  
  BootstrapUiController() {
    modules.add(new ModuleDefinition('alert', 'Alert', 'alert/alertDemo'));
    modules.add(new ModuleDefinition('buttons', 'Buttons', 'buttons/buttonsDemo'));
    modules.add(new ModuleDefinition('collapse', 'Collapse', 'collapse/collapseDemo'));
    modules.add(new ModuleDefinition('dropdown', 'Dropdown Toggle', 'dropdown_toggle/dropdownToggleDemo'));
    modules.add(new ModuleDefinition('tabs', 'Tabs', 'tabs/tabsDemo'));
  }
  
}

@NgComponent(
    selector: 'module-section',
    templateUrl: 'moduleSection.html',
    publishAs: 'ctrl',
    applyAuthorStyles: true,
    map: const {
      'module': '=>moduleDef'
    }
)
class ModuleSectionComponent implements NgShadowRootAware {
  
  ModuleDefinition module;
  Http http;
  String demoCode;
  String demoHTML;
  
  ModuleSectionComponent(this.http) {
  }
  
  set moduleDef(ModuleDefinition moduleDef) {
    module = moduleDef;
    
  }
  

  void onShadowRoot(ShadowRoot shadowRoot) {
    http(method: 'GET', url: module.url + '.dart')
    .then((HttpResponse res) {
      demoCode = res.data.toString();
      //js.context.prettyPrint(shadowRoot.activeElement);
    });
    
    http(method: 'GET', url: module.url + '.html')
    .then((HttpResponse res) {
      demoHTML = res.data.toString();
      //js.context.prettyPrint(shadowRoot.activeElement);
     });
  }
}

class ModuleDefinition {
  String name;
  String title;
  String url;
  
  ModuleDefinition(this.name, this.title, this.url) {}
  
}

class MyAppModule extends Module {
  MyAppModule() {
    install(new BootstrapUI());
    type(BootstrapUiController);
    type(ModuleSectionComponent);
    
    type(AlertDemoController);
    type(ButtonsDemoController);
    type(CollapseDemoController);
    type(DropdownToggleDemoController);
    type(TabsDemoController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
