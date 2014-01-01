library bootstrap_ui.tabs;

import 'package:angular/angular.dart';
import 'dart:html';

part 'tab.dart';

class TabsetModule extends Module {
  TabsetModule() {
    type(TabsetComponent);
    type(TabComponent);
  }
}

@NgComponent(
    selector: 'tabset',
    visibility: NgDirective.DIRECT_CHILDREN_VISIBILITY,
    template:
'''
<div class="tabbable">
  <ul class="nav nav-tabs" ng-class="{'nav-stacked': tabsetCtrl.vertical, 'nav-justified': tabsetCtrl.justified}">
    <content></content>
  </ul>
  <div class="tab-content">
    <div class="tab-pane" 
         ng-repeat="tab in tabsetCtrl.tabs" 
         ng-class="{active: tab.active}"
         tab-content-transclude="tab">
    </div>
  </div>
</div>
''',
    publishAs: 'tabsetCtrl',
    applyAuthorStyles: true,
    map: const {
      'vertical': '=>vertical',
      'justified': '=>justified'
    }
)
class TabsetComponent {
  
  final Element element;
  bool justified = false;
  bool vertical = false;
  List tabs = [];
  
  TabsetComponent(this.element) {
  }

  void select(tab) {
    tabs.forEach((tab) {
      tab.active = false;
    });
    tab.active = true;
  }

  void addTab(tab) {
    tabs.add(tab);
    if (tabs.length == 1 || tab.active) {
      select(tab);
    }
  }

  void removeTab(tab) {
    int index = tabs.indexOf(tab);
    //Select a new tab if the tab to be removed is selected
    if (tab.active && tabs.length > 1) {
      //If this is the last tab, select the previous tab. else, the next tab.
      int newActiveIndex = index == tabs.length - 1 ? index - 1 : index + 1;
      select(tabs[newActiveIndex]);
    }
    tabs.remove(tab);
  }
  
}
