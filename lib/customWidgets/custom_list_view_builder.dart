
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/components/app_colors.dart';
import 'custom_container.dart';
import 'custom_list_tile.dart';

class CustomListViewBuilder<T> extends StatelessWidget {
  const CustomListViewBuilder({super.key,
    required this.items,
    required this.itemBuilder,
    this.padding,
    this.physics,
    this.shrinkWrap = false,});

  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap; // <— make sure this is non-nullable and has a default value!

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding ?? const EdgeInsets.all(8.0),
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: CustomContainer(
            boxShadowColor: AppColors.dGrey,
            opacity: 0.5.toInt(),
            offsetOne: 12,
            offsetTwo: 12,
            blurRadius: 4,
            spreadRadius: -10,
            borderRadius: 16,
            containerBgColor: AppColors.dGreen,
            widget: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24),
              child: Column(
                children: [
                  CustomListTile(
                    title: 'DART & Flutter',
                    subTitle: 'Med Level',
                    textColorOne: AppColors.antiFlashWhite,
                    dFontSizeOne: 20,
                    dFontWeightOne: FontWeight.w900,
                    textColorTwo: AppColors.antiFlashWhite,
                    dFontSizeTwo: 13,
                    dFontWeightTwo: FontWeight.w400,
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        size: 40,
                      ),
                    ),
                    topPadding: 6,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'March23, 2025',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

        //return itemBuilder(context, items[index], index);
      },
    );
  }
}
