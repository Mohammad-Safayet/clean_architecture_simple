import 'package:chuck_norris/src/modules/shared/widgets/loading.dart';
import 'package:flutter/material.dart';

abstract class BaseView<T extends Object> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        } else {
          if(snapshot.hasData) {
            return body(context, snapshot);
          } else {
            return errorBody(context, snapshot);
          }
        }
      },
    );
  }

  Widget body(BuildContext context, AsyncSnapshot<T> snapshot);

  Widget errorBody(BuildContext context, AsyncSnapshot<T> snapshot);

  Future<T> getData();
}
