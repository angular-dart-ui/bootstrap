part of bootstrap_ui_demo;

@NgController(
    selector: '[alert-demo-controller]',
    publishAs: 'alertCtrl')
class AlertDemoController {
  
  List alerts = [
    { 'type': 'danger', 'msg': 'Oh snap! Change a few things up and try submitting again.' },
    { 'type': 'success', 'msg': 'Well done! You successfully read this important alert message.' }
  ];

  void addAlert() {
    alerts.add({'msg': "Another alert!"});
  }

  void closeAlert(index) {
    alerts.removeAt(index);
  }
  
}