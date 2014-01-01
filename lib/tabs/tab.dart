part of bootstrap_ui.tabs;

@NgComponent(
    selector: 'tab',
    template:
'''
<li ng-class="{active: tabCtrl.active, disabled: tabCtrl.disabled}">
  <a ng-click="tabCtrl.select()" tab-heading-transclude>{{tabCtrl.heading}}</a>
</li>
''',
    publishAs: 'tabCtrl',
    applyAuthorStyles: true,
    map: const {
      'heading': '@heading',
      'onSelect': '&select', //This callback is called in contentHeadingTransclude
                          //once it inserts the tab's content into the dom
      'onDeselect': '&deselect'
    }
)
class TabComponent {
  
  final Element element;
  final TabsetComponent tabsetCtrl; 
  String heading;
  BoundExpression select;
  BoundExpression deselect;
  bool active;
  bool disabled;
  
  TabComponent(this.element, this.tabsetCtrl) {
  }

}
