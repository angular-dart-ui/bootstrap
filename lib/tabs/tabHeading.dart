part of bootstrap_ui.tabs;

@NgComponent(
    selector: 'tab-heading-transclude',
    map: const {
      'tab': '=>tab'
    }
)
class TabHeadingTranscludeComponent extends NgShadowRootAware {
  
  final Element element;
  TabComponent tab;
  
  TabHeadingTranscludeComponent(this.element) {
  }

  void onShadowRoot(ShadowRoot shadowRoot) {
    Element tabHeading = tab.element.querySelector('tab-heading');
    if (tabHeading!=null) {
      shadowRoot.append(tabHeading);
    } else {
      shadowRoot.appendHtml(tab.heading);
    }
  }
}