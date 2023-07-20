import 'package:flutter/material.dart';
import 'package:movie_app/utils/strings.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        MovieStrings.errorLoadingMessage,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
