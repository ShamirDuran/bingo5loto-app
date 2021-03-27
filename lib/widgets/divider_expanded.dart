import 'package:flutter/material.dart';

class DividerExpanded extends StatelessWidget {
  const DividerExpanded({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.maybeOf(context).size;
    return Expanded(
      child: Container(
        width: size.width * 0.8,
        child: Divider(
          height: 30.0,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
