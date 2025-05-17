import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter { glutenfree, lactosefree, vegeterian, vegen }

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider()
    : super({
        Filter.glutenfree: false,
        Filter.lactosefree: false,
        Filter.vegen: false,
        Filter.vegeterian: false,
      });

  void setActiveFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> choosenFilter) {
    state = choosenFilter;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
      (ref) => FiltersProvider(),
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.read(meals_provider);
  final activefilter = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activefilter[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilter[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilter[Filter.vegen]! && !meal.isVegan) {
      return false;
    }
    if (activefilter[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
