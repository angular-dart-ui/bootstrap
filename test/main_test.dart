library main_test;

import './_specs.dart';
import '../web/main.dart';

main() {
  setUp(() {
   setUpInjector();
   module((Module m) => m.install(new MyAppModule()));
  });
  tearDown(tearDownInjector);

  group('alert', () {
    
    test('Should create an alert box', inject((Compiler $compile, Scope $rootScope, Injector injector){
      JQuery element = $('<div ng-bind="name"></div>');
      $compile(element); 
    }));
    
    test('Should compile fine', inject((TestBed _){
      JQuery element = $('<div ng-cloak></div>');
      expect(element.attr('ng-cloak')).toEqual('');
      Element elem = _.compile(element);
      expect(element.attr('ng-cloak')).toBeNull();
    }));
    
    
    /**
    test('should load recipes', async(inject((Injector injector,
                                              MockHttpBackend backend) {
      backend.expectGET('recipes.json').respond('[{"name": "test1"}]');
      backend.expectGET('categories.json').respond('["c1"]');

      var recipesController = injector.get(RecipeBookController);
      expect(recipesController.allRecipes, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      expect(recipesController.allRecipes, isNot(isEmpty));
    })));
    **/

    /**
    test('should select recipe', async(inject((Injector injector,
                                               MockHttpBackend backend) {
      backend.expectGET('recipes.json').respond('[{"name": "test1"}]');
      backend.expectGET('categories.json').respond('["c1"]');

      var recipesController = injector.get(RecipeBookController);
      expect(recipesController.allRecipes, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      var recipe = recipesController.allRecipes[0];
      recipesController.selectRecipe(recipe);
      expect(recipesController.selectedRecipe, same(recipe));
    })));
      **/
  });

}

