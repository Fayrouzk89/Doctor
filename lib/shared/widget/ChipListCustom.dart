library chip_list;

import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
typedef OnToggle = void Function(int index);

/// Creates a list of [ChoiceChips] with
/// all logic handled.
///
///
/// Set the names of chips and boom !
/// Use [supportsMultiSelect] if
/// multiple chips can be selected at once.
class ChipListCustom extends StatefulWidget {
  const ChipListCustom({
    Key? key,
    required this.listOfChipNames,
    required this.listOfChipIndicesCurrentlySeclected,
    this.activeTextColorList = const [Colors.white],
    this.inactiveTextColorList = const [Colors.blue],
    this.activeBgColorList = const [Colors.blue],
    this.inactiveBgColorList = const [Colors.white],
    this.style,
    this.inactiveBorderColorList = const [Colors.white],
    this.activeBorderColorList = const [Colors.white],
    this.borderRadiiList = const [15],
    this.supportsMultiSelect = false,
    this.extraOnToggle,
    this.shouldWrap = false,
    this.scrollPhysics,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.axis = Axis.horizontal,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.spacing = 0.0,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  /// In case you chain some *more* logic to this widget's
  /// onTap event (maybe trigger updation of other UI components).
  /// If this is used, ensure you call
  /// setState at the end of the function.
  final OnToggle? extraOnToggle;

  /// List of ChoiceChip names in order of building them.
  final List listOfChipNames;

  /// If multiple [ChoiceChips] can be selected at once.
  ///
  /// Defaults to [false].
  final bool supportsMultiSelect;

  /// The background color of an inactive [ChoiceChip].
  ///
  // If you want to customize the inactive
  /// background color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.white].
  final List<Color> inactiveBgColorList;

  /// The background color of an active [ChoiceChip].
  ///
  // If you want to customize the
  /// active background color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.blue].
  final List<Color> activeBgColorList;

  /// The text color of an active [ChoiceChip].
  ///
  /// // If you want to customize the
  /// active text color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.white].
  final List<Color> activeTextColorList;

  /// The text color of an inactive [ChoiceChip].
  ///
  /// If you want to customize the
  /// inactive text color of each [ChoiceChip], then set
  /// the color of each one here in order.
  ///
  /// If you want to use a single color
  /// for all chips, then set only one color here.
  ///
  /// Defults to [Colors.blue].
  final List<Color> inactiveTextColorList;

  /// Initial `index` that must be selected.
  /// Useful to sync this widget with
  /// others if need be.
  final List<int> listOfChipIndicesCurrentlySeclected;

  /// For any text styling needs.
  ///
  /// Using [color] here is pointless
  /// as it will be overwritten by
  /// the value of [activeTextColorList]
  /// and [inactiveTextColorList].
  final TextStyle? style;

  /// Determines if the chip_list should be wrapped.
  ///
  /// If you set it to [true],
  /// ensure that you wrap the [ChipList]
  /// within a [SizedBox] and define the [width]
  /// property.
  ///
  /// Defaults to false.
  final bool shouldWrap;

  /// If you wish to change the [ScrollPhysics]
  /// of the widget.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? scrollPhysics;

  /// MainAxisAlignment for the parent [Row] or [Column] of
  /// the [ChipList], which is used in case of
  /// [Axis.horizontal] or [Axis.vertical] being passed in
  /// to [axis].
  ///
  /// Defaults to [MainAxisAlignment.center]
  final MainAxisAlignment mainAxisAlignment;

  /// [WrapAlignment] used, if [shouldWrap] is [true].
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment wrapAlignment;

  /// [WrapCrossAlignment] used, if [shouldWrap] is [true]
  ///
  /// Defaults to [WrapCrossAlignment.start].
  final WrapCrossAlignment wrapCrossAlignment;

  /// [Axis] used, if [shouldWrap] is [true].
  ///
  /// Defaults to [Axis.horizontal].
  final Axis axis;

  /// [WrapAlignment] used, if [shouldWrap] is [true].
  ///
  /// How the runs themselves should
  /// be placed in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment runAlignment;

  /// [runSpacing] used, if [shouldWrap] is [true],
  ///
  /// How much space to place between the
  /// runs themselves in the cross axis.
  ///
  /// Defaults to 0.0.
  final double runSpacing;

  /// [spacing] used, if [shouldWrap] is [true],
  ///
  /// How much space to place between
  /// children in a run in the main axis.
  ///
  /// Defaults to 0.0.
  final double spacing;

  /// [textDirection] used, if [shouldWrap] is [true],
  ///
  /// Determines the order to lay children out
  /// horizontally and how to interpret start
  /// and end in the horizontal direction.
  final TextDirection? textDirection;

  /// [verticalDirection] used, if [shouldWrap] is [true],
  ///
  /// Determines the order to lay children out
  /// vertically and how to interpret start and
  /// end in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  final VerticalDirection verticalDirection;

  /// If you want to customize the
  /// border radii of each [ChoiceChip], then set
  /// the radius of each [ChoiceChip] here in order.
  ///
  /// If you want to use a single radius
  /// for all chips, then set only one radius here.
  ///
  /// Deafults to 15.0.
  final List<double> borderRadiiList;

  /// If you want to customize the
  /// border color of each inactive [ChoiceChip], then set
  /// the color of each here, in order.
  ///
  /// If you want to use a single color
  /// for all chips, whilst they're inactive,
  /// then set only one color here.
  ///
  /// Defaults to [Colors.white].
  final List<Color> inactiveBorderColorList;

  /// If you want to customize the
  /// border color of each active [ChoiceChip], then set
  /// the color of each here, in order.
  ///
  /// If you want to use a single color
  /// for all chips, whilst they're active,
  /// then set only one color here.
  ///
  /// Defaults to [Colors.white].
  final List<Color> activeBorderColorList;

  /// Use this to alter the padding of
  /// widgets in the list of the list,
  ///
  /// If [axis] is set to horizontal, then
  /// this will be the horizontal padding,
  /// and vice versa.
  ///
  /// Defaults to 4.0.
  final double widgetSpacing = 4.0;

  @override
  _ChipListState createState() => _ChipListState();
}

class _ChipListState extends State<ChipListCustom> {
  bool _checkChipSelectionStatus(int _index) {
    if (widget.supportsMultiSelect &&
        widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
      return true;
    } else if (!widget.supportsMultiSelect &&
        widget.listOfChipIndicesCurrentlySeclected.first == _index) {
      return true;
    }

    return false;
  }

  void _handleOnSelected(int _index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        widget.listOfChipIndicesCurrentlySeclected.remove(_index);
        return;
      } else {
        widget.listOfChipIndicesCurrentlySeclected.add(_index);
        return;
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      widget.listOfChipIndicesCurrentlySeclected.first = _index;
    }
  }

  Color _textColorizer(int _index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        if (widget.activeTextColorList.length == 1) {
          return widget.activeTextColorList.first;
        } else {
          return widget.activeTextColorList[_index];
        }
      } else {
        if (widget.inactiveTextColorList.length == 1) {
          return widget.inactiveTextColorList.first;
        } else {
          return widget.inactiveTextColorList[_index];
        }
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (_index == widget.listOfChipIndicesCurrentlySeclected.first) {
        if (widget.activeTextColorList.length == 1) {
          return widget.activeTextColorList.first;
        } else {
          return widget.activeTextColorList[_index];
        }
      } else {
        if (widget.inactiveTextColorList.length == 1) {
          return widget.inactiveTextColorList.first;
        } else {
          return widget.inactiveTextColorList[_index];
        }
      }
    }
  }

  Color _tileColorizer(int _index) {
    // if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        if (widget.activeBgColorList.length == 1) {
          return widget.activeBgColorList.first;
        } else {
          return widget.activeBgColorList[_index];
        }
      } else {
        if (widget.inactiveBgColorList.length == 1) {
          return widget.inactiveBgColorList.first;
        } else {
          return widget.inactiveBgColorList[_index];
        }
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (_index == widget.listOfChipIndicesCurrentlySeclected.first) {
        if (widget.activeBgColorList.length == 1) {
          return widget.activeBgColorList.first;
        } else {
          return widget.activeBgColorList[_index];
        }
      } else {
        if (widget.inactiveBgColorList.length == 1) {
          return widget.inactiveBgColorList.first;
        } else {
          return widget.inactiveBgColorList[_index];
        }
      }
    }
  }

  Color _borderColorizer(int _index) {
// if [supportsMultiSelect] is true
    if (widget.supportsMultiSelect) {
      if (widget.listOfChipIndicesCurrentlySeclected.contains(_index)) {
        if (widget.activeBorderColorList.length == 1) {
          return widget.activeBorderColorList.first;
        } else {
          return widget.activeBorderColorList[_index];
        }
      } else {
        if (widget.inactiveBorderColorList.length == 1) {
          return widget.inactiveBorderColorList.first;
        } else {
          return widget.inactiveBorderColorList[_index];
        }
      }
    }

    // otherwise logic for ensuring only one
    // chip is selected.
    else {
      if (_index == widget.listOfChipIndicesCurrentlySeclected.first) {
        if (widget.activeBorderColorList.length == 1) {
          return widget.activeBorderColorList.first;
        } else {
          return widget.activeBorderColorList[_index];
        }
      } else {
        if (widget.inactiveBorderColorList.length == 1) {
          return widget.inactiveBorderColorList.first;
        } else {
          return widget.inactiveBorderColorList[_index];
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.inactiveBorderColorList.length != 1 &&
        widget.inactiveBorderColorList.length !=
            widget.listOfChipNames.length) {
      throw Exception(
          'Length of inactiveBorderColorList must match the length of listOfChipNames, if overriden.');
    }

    if (widget.activeBorderColorList.length != 1 &&
        widget.activeBorderColorList.length != widget.listOfChipNames.length) {
      throw Exception(
          'Length of activeBorderColorList must match the length of listOfChipNames, if overriden.');
    }

    if (widget.borderRadiiList.length != 1 &&
        widget.borderRadiiList.length != widget.listOfChipNames.length) {
      throw Exception(
          'Length of borderRadiiList must match the length of listOfChipNames, if overriden.');
    }

    if (widget.activeBgColorList.length != 1 &&
        widget.activeBgColorList.length != widget.listOfChipNames.length) {
      throw Exception(
          'Length of activeBgColorList must match the length of listOfChipNames, if overriden.');
    }

    if (widget.inactiveBgColorList.length != 1 &&
        widget.inactiveBgColorList.length != widget.listOfChipNames.length) {
      throw Exception(
          'Length of inactiveBgColorList must match the length of listOfChipNames, if overriden.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.shouldWrap
        ? Wrap(
      children: List.generate(
        widget.listOfChipNames.length,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child:
          /*
          GestureDetector(
            onTap: () {
              // update other chips depending on value of [supportsMultiSelect]
              _handleOnSelected(index);

              if (widget.extraOnToggle != null) {
                widget.extraOnToggle!(index);

                // prevents further execution,
                // thus ensuring setState is not called.
                return;
              }

              // update UI
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(

                //  border: Border.all(color: Color(0xffeeeeee), width: 2.0),
                //color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white10,
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              margin: EdgeInsets.all(1),
              //height: ColorConstants.categoryHeight,
              width: SizeConfig().screenWidth*ColorConstants.categoryWidth,
              height: SizeConfig().screenWidth*ColorConstants.categoryWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  (widget.listOfChipNames[index].name!="")?
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: ColorConstants.greenColor,

                        ),
                        height: SizeConfig().screenWidth*ColorConstants.categoryWidth-8,
                        width: SizeConfig().screenWidth*ColorConstants.categoryWidth-10,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1,right: 1,top: 1,bottom: 1),
                          child: ClipRRect(

                            // radius:SizeConfig().screenWidth*ColorConstants.categoryWidth,
                            child:  Image.network(widget.listOfChipNames[index].name??'images/logo.jpg'),
                            // backgroundColor: Colors.transparent,
                          ),
                        )
                    ),
                  ):
                  (globals.staticPageResponse!.data!.company_image!=null)?
                  Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: ColorConstants.greenColor,

                        ),
                        height: SizeConfig().screenWidth*ColorConstants.categoryWidth-10,
                        width: SizeConfig().screenWidth*ColorConstants.categoryWidth-10,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 1,right: 1,top: 1,bottom: 1),
                            child: ClipRRect(

                              // radius:SizeConfig().screenWidth*ColorConstants.categoryWidth,
                              child:  Image.network((globals.staticPageResponse!.data!.company_image??'images/companies.jpg'),
                                // backgroundColor: Colors.transparent,
                              ),
                            )
                        ),
                      )) :
                  Container(
                    height: SizeConfig().screenWidth*ColorConstants.categoryWidth,
                    child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: SizeConfig().screenWidth*ColorConstants.categoryWidth,
                        child:  CircleAvatar(
                          radius:SizeConfig().screenWidth*ColorConstants.categoryWidth,
                          backgroundImage: AssetImage('images/companies.jpg'),
                          backgroundColor: Colors.transparent,
                        )
                    ),
                  )

                  ,
                  Container(
                    // width: SizeConfig().screenWidth*ColorConstants.categoryWidth-5,
                    child: Text(
                      widget.listOfChipNames[index].name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        //color: flavorColor
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

               */

          ChoiceChip(
            label: Text(
              widget.listOfChipNames[index],
              style: widget.style != null
                  ? widget.style!.copyWith(
                color: _textColorizer(index),
              )
                  : const TextStyle().copyWith(
                color: _textColorizer(index),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                widget.borderRadiiList.length == 1
                    ? widget.borderRadiiList.first
                    : widget.borderRadiiList[index],
              ),
              side: BorderSide(
                color: _borderColorizer(index),
              ),
            ),
            backgroundColor: widget.inactiveBgColorList.length == 1
                ? widget.inactiveBgColorList.first
                : widget.inactiveBgColorList[index],
            selected: _checkChipSelectionStatus(index),
            selectedColor: _tileColorizer(index),
            onSelected: (val) {
              // update other chips depending on value of [supportsMultiSelect]
              _handleOnSelected(index);

              if (widget.extraOnToggle != null) {
                widget.extraOnToggle!(index);

                // prevents further execution,
                // thus ensuring setState is not called.
                return;
              }

              // update UI
              setState(() {});
            },
          ),


        ),
      ),
      alignment: widget.wrapAlignment,
      crossAxisAlignment: widget.wrapCrossAlignment,
      direction: widget.axis,
      runAlignment: widget.runAlignment,
      runSpacing: widget.runSpacing,
      spacing: widget.spacing,
      textDirection: widget.textDirection,
      verticalDirection: widget.verticalDirection,
    )
        : SingleChildScrollView(
      scrollDirection: widget.axis,
      physics: widget.scrollPhysics ?? const ScrollPhysics(),
      child: widget.axis == Axis.horizontal
          ? Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: List.generate(
          widget.listOfChipNames.length,
              (index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.widgetSpacing,
            ),
            child: ChoiceChip(
              label: Text(
                widget.listOfChipNames[index].name,
                style: widget.style != null
                    ? widget.style!.copyWith(
                  color: _textColorizer(index),
                )
                    : const TextStyle().copyWith(
                  color: _textColorizer(index),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    widget.borderRadiiList.length == 1
                        ? widget.borderRadiiList.first
                        : widget.borderRadiiList[index]),
                side: BorderSide(
                  color: _borderColorizer(index),
                ),
              ),
              backgroundColor:
              widget.inactiveBgColorList.length == 1
                  ? widget.inactiveBgColorList.first
                  : widget.inactiveBgColorList[index],
              selected: _checkChipSelectionStatus(index),
              selectedColor: _tileColorizer(index),
              onSelected: (val) {
                // update other chips depending on value of [supportsMultiSelect]
                _handleOnSelected(index);

                if (widget.extraOnToggle != null) {
                  widget.extraOnToggle!(index);

                  // prevents further execution,
                  // thus ensuring setState is not called.
                  return;
                }

                // update UI
                setState(() {});
              },
            ),
          ),
        ),
      )
          : Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: List.generate(
          widget.listOfChipNames.length,
              (index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.widgetSpacing,
            ),
            child: ChoiceChip(
              label: Text(
                widget.listOfChipNames[index].name,
                style: widget.style != null
                    ? widget.style!.copyWith(
                  color: _textColorizer(index),
                )
                    : const TextStyle().copyWith(
                  color: _textColorizer(index),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    widget.borderRadiiList.length == 1
                        ? widget.borderRadiiList.first
                        : widget.borderRadiiList[index]),
                side: BorderSide(
                  color: _borderColorizer(index),
                ),
              ),
              backgroundColor:
              widget.inactiveBgColorList.length == 1
                  ? widget.inactiveBgColorList.first
                  : widget.inactiveBgColorList[index],
              selected: _checkChipSelectionStatus(index),
              selectedColor: _tileColorizer(index),
              onSelected: (val) {
                // update other chips depending on value of [supportsMultiSelect]
                _handleOnSelected(index);

                if (widget.extraOnToggle != null) {
                  widget.extraOnToggle!(index);

                  // prevents further execution,
                  // thus ensuring setState is not called.
                  return;
                }

                // update UI
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
