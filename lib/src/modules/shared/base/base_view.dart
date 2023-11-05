import 'package:chuck_norris/src/modules/shared/widgets/loading.dart';
import 'package:flutter/material.dart';

abstract class BaseView<T extends Object> extends StatefulWidget {
  Widget body(
    BuildContext context,
    T data,
    VoidCallback setState,
  );

  Widget errorBody(
    BuildContext context,
    Object error,
    VoidCallback setState,
  );

  Future<T> getData();

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Object> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        } else {
          if (snapshot.hasData) {
            return widget.body(
              context,
              snapshot.data!,
              () {
                setState(() {});
              },
            );
          } else {
            return widget.errorBody(
              context,
              snapshot.error!,
              () {
                setState(() {});
              },
            );
          }
        }
      },
    );
  }
}
