
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///@author Isiyemi Joseph
///
typedef DataBindingBuilder<T, R> = Widget Function(
    BuildContext context, R value, T viewModel
    );

///Factory class to assist in binding specific ui data changes to the view
class UiStateBinding {

  UiStateBinding._();

  static Selector<T, R> bind<T, R>({
    required R Function(T) value,
    required DataBindingBuilder<T, R> to, Key? key,
  }) {
    return Selector<T, R>(
      key: key,
      selector: (ctx, viewModel) => value(viewModel),
      builder: (ctx, value, _) => to(ctx, value, ctx.read<T>()),
    );
  }
}
