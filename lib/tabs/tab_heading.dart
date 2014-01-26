// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.tabs;

@NgComponent(
    selector: 'tab-heading-transclude',
    applyAuthorStyles: true,
    map: const {
      'tab': '=>tab'
    }
)
class TabHeadingTranscludeComponent extends BaseComponent implements NgShadowRootAware {
  
  TabComponent tab;
  
  TabHeadingTranscludeComponent(Element element) : super(element) {
  }

  void onShadowRoot(ShadowRoot shadowRoot) {
    Element tabHeading = tab.element.querySelector('tab-heading');
    if (tabHeading!=null) {
      shadowRoot.append(tabHeading);
    } else {
      shadowRoot.appendText(tab.heading);
    }
  }
}