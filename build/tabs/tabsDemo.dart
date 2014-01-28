part of bootstrap_ui_demo;

@NgController(
    selector: '[tabs-demo-controller]',
    publishAs: 'tabsCtrl')
class TabsDemoController {
  
    List tabs = [
                 { 'title':'Dynamic Title 1', 'content':'Dynamic content 1', 'active':false, 'disabled': false },
                 { 'title':'Dynamic Title 2', 'content':'Dynamic content 2', 'active':false, 'disabled': true }
            ];
    
    void alertMe() {
      window.alert('You\'ve selected the alert tab!');
    }
  
}
