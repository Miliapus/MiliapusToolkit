import 'dart:async';

import 'package:flutter/widgets.dart';

class PrepareWidget extends StatefulWidget {
  final FutureOr<Widget> Function(BuildContext context) builder;
  final Widget loading;

  const PrepareWidget({
    Key? key,
    required this.builder,
    required this.loading,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrepareWidgetState();
}

class PrepareWidgetState extends State<PrepareWidget> {
  Widget? child;

  @override
  void initState() {
    super.initState();
    () async {
      child = widget.loading;
      child = await widget.builder(context);
      setState(() {});
    }();
  }

  @override
  Widget build(BuildContext context) => child!;
}
