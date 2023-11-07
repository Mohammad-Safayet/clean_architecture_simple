import 'package:chuck_norris/src/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:chuck_norris/src/modules/shared/base/base_widget_mixin.dart';

class ErrorBodyWidget extends StatelessWidget with BaseWidgetMixin {
  ErrorBodyWidget({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  final FailureEntity data;
  final Function onPressed;

  @override
  Widget body(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.error,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.title,
            style: AppTextStyles.errorTitle,
          ),
          Text(
            data.message,
            style: AppTextStyles.errorDesc,
          ),
          OutlinedButton(
            onPressed: () {
              onPressed();
            },
            child: const Text(
              "Reload",
              style: AppTextStyles.errorButton,
            ),
          ),
        ],
      ),
    );
  }
}
