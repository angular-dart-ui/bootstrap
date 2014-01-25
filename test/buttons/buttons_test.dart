part of bootstrap.ui.test;

void buttonsTest() {
  
  Compiler $compile;
  Scope $rootScope;
  Injector injector;
  
  setUp(() {
    setUpInjector();
    module((Module module) {
      module.install(new BootstrapUI());
    });
    inject((
        Compiler _compile, Scope _rootScope, Injector _injector) {
      $compile = _compile; $rootScope = _rootScope; injector = _injector;
    });
  });
  
  tearDown(tearDownInjector);
  
  group('radio buttons', () {

    List<Element> compileButtons(String markup) {
      Element elem = compileComponent('<div>'+markup+'</div>', $compile, $rootScope, injector);
      return elem.querySelectorAll('button');
    };

    //model -> UI
    test('should work correctly set active class based on model', async(inject(() {
      List<Element> btns = compileButtons('<button ng-model="model" btn-radio="1">click1</button><button ng-model="model" btn-radio="2">click2</button>');
      expect(btns[0]).not.toHaveClass('active');
      expect(btns[1]).not.toHaveClass('active');

      $rootScope.model = 2;
      $rootScope.$digest();
      expect(btns[0]).not.toHaveClass('active');
      expect(btns[1]).toHaveClass('active');
    })));

    
    //UI->model
    test('should work correctly set active class based on model', async(inject(() {
      List<Element> btns = compileButtons('<button ng-model="model" btn-radio="1">click1</button><button ng-model="model" btn-radio="2">click2</button>');
      expect($rootScope.model).toBeNull();

      btns[0].click();
      expect($rootScope.model).toEqual(1);
      expect(btns[0]).toHaveClass('active');
      expect(btns[1]).not.toHaveClass('active');

      btns[1].click();
      expect($rootScope.model).toEqual(2);
      expect(btns[1]).toHaveClass('active');
      expect(btns[0]).not.toHaveClass('active');
    })));

    test('should watch btn-radio values and update state accordingly', async(inject(() {
      $rootScope.myValues = ["value1", "value2"];

      List<Element> btns = compileButtons('<button ng-model="model" btn-radio="myValues[0]">click1</button><button ng-model="model" btn-radio="myValues[1]">click2</button>');
      expect(btns[0]).not.toHaveClass('active');
      expect(btns[1]).not.toHaveClass('active');

      $rootScope.model = "value2";
      $rootScope.$digest();
      expect(btns[0]).not.toHaveClass('active');
      expect(btns[1]).toHaveClass('active');

      $rootScope.myValues[1] = "value3";
      $rootScope.model = "value3";
      $rootScope.$digest();
      expect(btns[0]).not.toHaveClass('active');
      expect(btns[1]).toHaveClass('active');
    })));
    
  });
  
  
  group('checkbox', () {

    Element compileButton(String markup) {
      return compileComponent(markup, $compile, $rootScope, injector);
    };

    //model -> UI
    test('should work correctly with default model values', async(inject(() {
      $rootScope.model = false;
      Element btn = compileButton('<button ng-model="model" btn-checkbox>click</button>');
      expect(btn).not.toHaveClass('active');

      $rootScope.model = true;
      $rootScope.$digest();
      expect(btn).toHaveClass('active');
    })));

    test('should bind custom model values', async(inject(() {
      $rootScope.model = 1;
      Element btn = compileButton('<button ng-model="model" btn-checkbox btn-checkbox-true="1" btn-checkbox-false="0">click</button>');
      expect(btn).toHaveClass('active');

      $rootScope.model = 0;
      $rootScope.$digest();
      expect(btn).not.toHaveClass('active');
    })));
    
    //UI-> model
    test('should toggle default model values on click', async(inject(() {
      $rootScope.model = false;
      Element btn = compileButton('<button ng-model="model" btn-checkbox>click</button>');

      btn.click();
      expect($rootScope.model).toEqual(true);
      expect(btn).toHaveClass('active');

      btn.click();
      expect($rootScope.model).toEqual(false);
      expect(btn).not.toHaveClass('active');
    })));

    test('should toggle custom model values on click', async(inject(() {
      $rootScope.model = 0;
      var btn = compileButton('<button ng-model="model" btn-checkbox btn-checkbox-true="1" btn-checkbox-false="0">click</button>');

      btn.click();
      expect($rootScope.model).toEqual(1);
      expect(btn).toHaveClass('active');

      btn.click();
      expect($rootScope.model).toEqual(0);
      expect(btn).not.toHaveClass('active');
    })));

    
    test('should monitor true / false value changes - issue 666', async(inject(() {

      $rootScope.model = 1;
      $rootScope.trueVal = 1;
      Element btn = compileButton('<button ng-model="model" btn-checkbox btn-checkbox-true="trueVal">click</button>');

      expect(btn).toHaveClass('active');
      expect($rootScope.model).toEqual(1);

      $rootScope.model = 2;
      $rootScope.trueVal = 2;
      $rootScope.$digest();

      expect(btn).toHaveClass('active');
      expect($rootScope.model).toEqual(2);
    })));
    
  });
  
}

