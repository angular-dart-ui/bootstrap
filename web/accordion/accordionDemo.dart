part of bootstrap_ui_demo;

@Controller(
    selector: '[accordion-demo-controller]',
    publishAs: 'accCtrl')
class AccordionDemoController {
  
  bool oneAtATime = true;
  
  bool isopen = false;

  List groups = [
    {
      'title': "Dynamic Group Header - 1",
      'content': "Dynamic Group Body - 1"
    },
    {
      'title': "Dynamic Group Header - 2",
      'content': "Dynamic Group Body - 2"
    }
  ];

  List items = ['Item 1', 'Item 2', 'Item 3'];

  void addItem() {
    int newItemNo = items.length + 1;
    items.add('Item ' + newItemNo.toString());
  }
  
}