import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category,required this.selectCategory});
  final Category category;
  final void Function() selectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.55),
            ],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
