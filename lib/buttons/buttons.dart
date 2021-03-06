// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

library bootstrap.ui.buttons;

import 'package:angular/angular.dart';
import 'dart:html';

class ButtonsModule extends Module {
  ButtonsModule() {
    type(ButtonCheckboxDirective);
    type(ButtonRadioDirective);
  }
}

@NgDirective(
    selector: '[btn-radio][ng-model]',
    map: const {
      'btnRadio': '=>buttonValue'
    }
)
class ButtonRadioDirective {
  
  final Element inputElement;
  NgModel ngModel;
  var currentValue;
  
  ButtonRadioDirective(this.inputElement, this.ngModel, Scope scope) {
    ngModel.render = (value) {
      evaluateValue(value);
    };
    inputElement.onClick.listen((value) {
      scope.$apply(() => ngModel.viewValue = this.currentValue);
    });
  }
  
  set buttonValue(var value) {
    this.currentValue = value;
    evaluateValue(ngModel.modelValue);
  }
  
  void evaluateValue(var modelValue) {
    if (modelValue!=null && modelValue == this.currentValue) {
      inputElement.classes.add('active');
    } else {
      inputElement.classes.remove('active');
    }
  }
  
}


@NgDirective(
    selector: '[btn-checkbox][ng-model]'
)
class ButtonCheckboxDirective {
  
  final Element element;
  final Scope scope;
  bool checked;
  
  ButtonCheckboxDirective(this.element, NgModel ngModel, this.scope) {
    
    ngModel.render = (value) {
      checked = (value == getTrueValue());
      if( checked ) {
        element.classes.add('active');
      } else {
        element.classes.remove('active');
      }
    };
    
    element.onClick.listen((value) {
      checked = !checked;
      scope.$apply(() {
        if (checked) {
          ngModel.viewValue = getTrueValue();
        } else {
          ngModel.viewValue = getFalseValue();
        }
      });
    });
  }
  
  getTrueValue() {
    return getCheckboxValue(element.attributes['btn-checkbox-true'], true);
  }

  getFalseValue() {
    return getCheckboxValue(element.attributes['btn-checkbox-false'], false);
  }
  
  getCheckboxValue(String attributeValue, bool defaultValue) {
    dynamic val = scope.$eval(attributeValue);
    return val != null ? val : defaultValue;
  }
  
}
