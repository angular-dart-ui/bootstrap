part of bootstrap_ui_demo;

@NgController(
    selector: '[dropdown-demo-controller]',
    publishAs: 'ddCtrl')
class DropdownToggleDemoController {
  
  List<String> items = [
           "The first choice!",
           "And another choice for you.",
           "but wait! A third!"
           ];
  
}