import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({@required this.bloc, @required this.child });

  static Type _providerType<T>() => T;

  static T of <T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider _provider = context.ancestorWidgetOfExactType(type);
    return _provider.bloc;
  }

  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {

   @override
  Widget build(BuildContext context) => widget.child;

   @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}