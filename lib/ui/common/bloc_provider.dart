import 'package:flutter/material.dart';

abstract class BlocBase{
  void dispose();
}

class BlocProvider extends StatefulWidget{

  final Widget child;
  final BlocBase bloc;

  BlocProvider({Key key, @required this.child, @required this.bloc}):super(key :key);

  static _BlocProviderInherited of(BuildContext context) {
    _BlocProviderInherited provider = context.dependOnInheritedWidgetOfExactType();
    return provider;
  }

  @override
  State<StatefulWidget> createState() {
    return _BlocProviderState();
  }

}

class _BlocProviderState extends State<BlocProvider>{

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited(
        bloc: widget?.bloc,
        child: widget.child);
  }

  @override
  void dispose() {
    widget?.bloc?.dispose();
    super.dispose();
  }

}

class _BlocProviderInherited extends InheritedWidget{

  final BlocBase bloc;

  _BlocProviderInherited({
    @required this.bloc,
    @required Widget child,
    Key key}) :super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}