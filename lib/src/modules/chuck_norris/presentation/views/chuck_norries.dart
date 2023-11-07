import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/joke.dart';
import 'package:flutter/material.dart';

class ChuckNorrisView extends StatefulWidget {
  const ChuckNorrisView({Key? key}) : super(key: key);

  @override
  State<ChuckNorrisView> createState() => _ChuckNorrisViewState();
}

class _ChuckNorrisViewState extends State<ChuckNorrisView> {
  String category = "random";

  void setCategory(String value) {
    setState(() {
      category = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppValues.margin,
      ),
      child: Column(
        children: [
          CategoriesView(
            activeItemName: category,
            voidCallback: setCategory,
          ),
          Expanded(
            child: JokesView(),
          ),
        ],
      ),
    );
  }
}
