// Copyright 2014 Francesco Cina
// http://angular-dart-ui.github.io/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0

part of bootstrap.ui.accordion;

@NgComponent(
    selector: 'accordion-heading-transclude',
    applyAuthorStyles: true,
    map: const {
      'group': '=>group'
    }
)
class AccordionHeadingTranscludeComponent extends BaseComponent implements NgShadowRootAware {
  
  AccordionGroupComponent group;
  
  AccordionHeadingTranscludeComponent(Element element, this.group) : super(element) {
  }

  void onShadowRoot(ShadowRoot shadowRoot) {
    Element tabHeading = group.element.querySelector('accordion-heading');
    if (tabHeading!=null) {
      shadowRoot.append(tabHeading);
    } else {
      shadowRoot.appendText(group.heading);
    }
  }
}