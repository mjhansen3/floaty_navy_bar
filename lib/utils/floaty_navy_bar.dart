import 'package:floaty_navy_bar/utils/navy_bar_item.dart';
import 'package:flutter/material.dart';

class FloatyNavyBar extends StatelessWidget {
  /// * TO CHANGE THE HEIGHT OF NAVIGATION BAR
  /// * PREFERRED HEIGHT IS BETWEEN [70-100]
  final double barHeight;

  /// * FOR CHANGING NAV ITEMS ICON SIZE
  final double? iconSize;

  /// * For changing nav items icon color
  final Color? iconColor;

  /// * Background Color or floating navigation bar
  final Color? backgroundColor;

  /// * ALLOWS USER'S TEXT STYLING INPUT
  final TextStyle? textStyle;

  /// * LIST OF TABS TO DISPLAY
  final List<NavyBarItem> items;

  final ValueChanged<int> onChanged;

  /// * FOR CHANGING INDICATOR COLOR
  /// * ... HEIGHT
  /// * ... WIDTH
  final Color indicatorColor;
  final double indicatorHeight;
  final double indicatorWidth;

  /// * FOR CHANGING WIDTH OF THE ITEM
  final double itemWidth;

  /// ! THIS WILL IDENTITFY WHICH TAB IS CURRENTLY ACTIVE
  /// ! USING THIS TO SHOW AND HIDE TAB INDICATOR
  static ValueNotifier<int> notifyIndex = ValueNotifier<int>(0);

  FloatyNavyBar({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.barHeight,
    this.iconColor,
    this.iconSize,
    this.textStyle,
    this.backgroundColor,
    this.indicatorColor = Colors.black,
    this.indicatorHeight = 5.0,
    this.indicatorWidth = 8.0,
    this.itemWidth = 70,
  }) : assert(
    items.length > 1 && items.length < 5,
    "\n******\n NavBarItems can't contain only 1 item and can't exceed 4 items \n******\n"
  ),
  assert(
    indicatorWidth <= 15 || indicatorHeight <= 15,
    "\n******\n Too much height given to tab indicator \n******\n",
  ),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    double barWidth = calculateBarWidth();

    return Positioned(
      bottom: 35.0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: barHeight,
          width: barWidth,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              items.length,
              (i) => Flexible(
                child: GestureDetector(
                  onTap: () => onPressed(i),
                  child: Container(
                    width: itemWidth,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          items[i].icon,
                          size: iconSize,
                          color: iconColor,
                        ),
                        if (items[i].title != null)
                          Text(
                            items[i].title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle,
                          ),
                        ValueListenableBuilder(
                          valueListenable: notifyIndex,
                          builder: (BuildContext context, int value, Widget? child) {
                            return Visibility(
                              visible: value == i,
                              child: Container(
                                height: indicatorHeight,
                                width: indicatorWidth,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: indicatorColor,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// * FUNCTION TO DYNAMICALLY CALCULATE TOTAL WIDTH OF THE NAVBAR
  double calculateBarWidth() {
    double totalWidth = itemWidth * items.length; // TOTAL WIDTH WITH ALL ITEMS
    double paddingWidth = 8.0 * (items.length - 1); // TOTAL WIDTH OF SPACING BETWEEN ITEMS
    double totalBarWidth = totalWidth + paddingWidth; // TOTAL BAR WIDTH

    return totalBarWidth;
  }

  /// * FOR CHANGING NAVIGATION BAR  INDEX
  void onPressed(int index) {
    onChanged(index);
    notifyIndex.value = index;
  }
}
