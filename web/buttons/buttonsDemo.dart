part of bootstrap_ui_demo;

@NgController(
    selector: '[buttons-demo-controller]',
    publishAs: 'btnCtrl')
class ButtonsDemoController {
  
    int singleModel = 1;
    
    String radioModel = 'Middle';
    
    Object checkModel = {
                         'left': false,
                         'middle': true,
                         'right': false
    };
  
}