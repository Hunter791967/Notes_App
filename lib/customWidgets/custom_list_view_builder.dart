

import 'package:flutter/material.dart';

class CustomListViewBuilder<T> extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding ?? const EdgeInsets.all(8.0),
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemBuilder(context, items[index], index); // ✅ use the passed-in builder
      },
    );
  }
}
