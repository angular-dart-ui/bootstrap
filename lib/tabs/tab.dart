part of bootstrap.ui.tabs;

@NgComponent(
    selector: 'tab',
    visibility: NgDirective.DIRECT_CHILDREN_VISIBILITY,
    template:
'''
<div ng-if="tabCtrl.active" class="tab-pane" ng-class="{active: tabCtrl.active}">
  <content></content>
</div>
''',
    publishAs: 'tabCtrl',
    applyAuthorStyles: true,
    map: const {
      'heading': '@heading',
      'onSelect': '&onSelectCallback', //This callback is called in contentHeadingTransclude
                          //once it inserts the tab's content into the dom
      'onDeselect': '&onDeselectCallback'
    }
)
class TabComponent extends BaseComponent {
  
  final TabsetComponent tabsetCtrl; 
  var heading;
  BoundExpression onSelectCallback;
  BoundExpression onDeselectCallback;
  bool _active = false;
  bool disabled = false;
  
  TabComponent(Element element, this.tabsetCtrl, Scope scope) : super(element) {
    this.tabsetCtrl.addTab(this);
  }

  get active => _active;
  
  set active(bool newValue) {
    _active = newValue;
    if (newValue) {
      if(onSelectCallback!=null) {
        onSelectCallback();
      }
    } else {
      if(onDeselectCallback!=null) {
        onDeselectCallback();
      }
    }
  }
}

