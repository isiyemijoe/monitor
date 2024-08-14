import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

///==============================ViewModelProvider==============================
class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelProvider(
      {required this.create, super.key, this.child, this.builder});

  final Create<T>? create;
  final Widget? child;
  final Widget Function(BuildContext context, T viewModel)? builder;

  Widget _builder(BuildContext context, Widget? child) {
    final viewModel = context.read<T>();
    return (null != builder)
        ? builder!.call(context, viewModel)
        : child ?? const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create!,
      builder: _builder,
      child: child,
    );
  }
}
