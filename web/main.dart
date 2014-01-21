library bootstrap_ui_demo;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
import 'package:angular_dart_ui_bootstrap/core/bootstrap.dart';
import 'package:js/js.dart' as js;
import 'dart:html';

part 'alert/alertDemo.dart';
part 'buttons/buttonsDemo.dart';

@NgController(
    selector: '[bootstrap-ui-demo]',
    publishAs: 'mainCtrl')
class BootstrapUiController {

  List<ModuleDefinition> modules = [];
  
  BootstrapUiController() {
    modules.add(new ModuleDefinition('alert', 'Alert', 'alert/alertDemo'));
    modules.add(new ModuleDefinition('buttons', 'Buttons', 'buttons/buttonsDemo'));
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
      js.context.prettyPrint(shadowRoot.activeElement);
    });
    
    http(method: 'GET', url: module.url + '.html')
    .then((HttpResponse res) {
      demoHTML = res.data.toString();
      js.context.prettyPrint(shadowRoot.activeElement);
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
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
