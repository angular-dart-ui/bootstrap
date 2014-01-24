part of bootstrap.ui.tabs;

@NgComponent(
    selector: 'tab',
    visibility: NgDirective.CHILDREN_VISIBILITY,
    template:
'''
<div ng-if="tabCtrl.active" class="tab-pane" ng-class="{active: tabCtrl.active}">
  <content></content>
</div>
''',
    publishAs: 'tabCtrl',
    applyAuthorStyles: true,
    map: const {
      'disabled' : '<=>disabled',
      'active' : '<=>active',
      'heading': '@heading',
      'select': '&onSelectCallback', //This callback is called in contentHeadingTransclude
                          //once it inserts the tab's content into the dom
      'deselect': '&onDeselectCallback'
    }
)
class TabComponent extends BaseComponent {
  
  final TabsetComponent tabsetCtrl; 
  var heading;
  var onSelectCallback;
  var onDeselectCallback;
  bool _active = false;
  bool disabled = false;
  
  TabComponent(Element element, this.tabsetCtrl, Scope scope) : super(element) {
    this.tabsetCtrl.addTab(this);
  }

  get active => _active;
  
  set active(var newValue) {
    if (newValue!=null && newValue==true) {
      tabsetCtrl.select(this);
    }
  }
  
  set select(bool newValue) {
    if (newValue) {
      if(onSelectCallback!=null) {
        onSelectCallback();
      }
    } else {
      if(_active && onDeselectCallback!=null) {
        onDeselectCallback();
      }
    }
    _active = newValue;
  }
}

