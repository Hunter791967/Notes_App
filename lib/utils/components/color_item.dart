// utils/constants/color_item.dart
class ColorItem {
  static final List<int> noteColors = [
    0xff049472,
    0xff046e94,
    0xff947204,
  ];

  static int getColorByIndex(int index) {

    return noteColors[index % noteColors.length];

    //return (index % 2 == 0) ? 0xff046e94 : 0xff049472;
  }
}
