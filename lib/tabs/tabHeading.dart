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