import 'package:flutter/material.dart';

import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/shared/widgets/ripple_button.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    Key? key,
    required this.data,
    required this.voidCallback,
    required this.activeItemName,
  }) : super(key: key);

  final Categories data;
  final Function voidCallback;
  final String activeItemName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.list.length,
        itemBuilder: (context, index) {
          final listData = data.list[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppValues.margin_4,
            ),
            child: RippleButton(
              onTap: () {
                voidCallback(listData);
              },
              child: Chip(
                backgroundColor: (activeItemName == listData)
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).cardColor,
                label: Text(
                  listData,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
