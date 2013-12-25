library main_test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import '../web/main.dart';


main() {
  setUp(() {
   setUpInjector();
   module((Module m) => m.install(new MyAppModule()));
  });
  tearDown(tearDownInjector);

  group('recipe-book', () {
    
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
