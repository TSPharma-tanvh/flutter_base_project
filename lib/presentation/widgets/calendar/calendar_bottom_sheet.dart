import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/cubit/app_cubit.dart';
import 'package:flutter_base_project/presentation/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:flutter_base_project/presentation/widgets/button/custom_button.dart';
import 'package:flutter_base_project/presentation/widgets/calendar/calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showCalendarBottomSheet({
  required BuildContext context,
  required DateTime currentDay,
  DateTime? firstDay,
  DateTime? lastDay,
  required Function(DateTime data) onChange,
  Function(DateTime data)? onCloseChange,
  CupertinoDatePickerMode? mode,
  DateTime? initialDateTime,
  int interval = 1,
  String? title,
  bool showButtonClose = true,
  String? closeTitle,
}) async {
  return await showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: DeviceUtilsCore.getHeightWithoutToolbar(context),
      minHeight: DeviceUtilsCore.getHeightWithoutToolbar(context) * 0.5,
    ),
    builder: (BuildContext context) {
      return CalendarBottomSheet(
        currentDay: currentDay,
        onChange: onChange,
        firstDay: firstDay,
        lastDay: lastDay,
        mode: mode,
        initialDateTime: initialDateTime,
        interval: interval,
        title: title,
        showButtonClose: showButtonClose,
        closeTitle: closeTitle,
        onCloseChange: onCloseChange,
      );
    },
  );
}

// ignore: must_be_immutable
class CalendarBottomSheet extends StatefulWidget {
  DateTime currentDay;
  DateTime? firstDay = DateTime(1900, 1, 1);
  DateTime? lastDay = DateTime(2040, 1, 1);
  Function(DateTime) onChange;
  Function(DateTime)? onCloseChange;
  CupertinoDatePickerMode? mode;
  DateTime? initialDateTime;
  int interval = 1;
  String? title;
  bool showButtonClose;
  String? closeTitle;

  CalendarBottomSheet({
    super.key,
    required this.currentDay,
    this.firstDay,
    this.lastDay,
    required this.onChange,
    this.mode,
    this.initialDateTime,
    this.interval = 1,
    this.title,
    this.showButtonClose = true,
    this.closeTitle,
    this.onCloseChange,
  });

  @override
  CalendarBottomSheetState createState() => CalendarBottomSheetState();
}

class CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateTime selected = DateTime.now();
  bool showMonth = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = widget.currentDay;
      showMonth = widget.mode == CupertinoDatePickerMode.dateAndTime ||
          widget.mode == CupertinoDatePickerMode.time;
    });
  }

  void onChangeShowType(bool show) {
    setState(() {
      showMonth = show;
    });
  }

  Widget renderYearMonth(BuildContext context) {
    // final controller = context.watch<AppCubit>();

    // final appState = controller.state;
    // final theme = appState.theme;
    return Container(
      constraints: BoxConstraints(
        maxHeight: DeviceUtilsCore.getHeightWithoutToolbar(context) / 3,
      ),
      margin: const EdgeInsets.all(16),
      child: CupertinoDatePicker(
        initialDateTime: selected,
        mode: widget.mode ?? CupertinoDatePickerMode.date,
        minimumDate: widget.firstDay,
        maximumDate: widget.lastDay,
        // initialDateTime: widget.initialDateTime,
        use24hFormat: true,
        minuteInterval: widget.interval,
        key: const Key("cupertinoCalendar"),
        onDateTimeChanged: (DateTime newTime) {
          selected = newTime;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final lang = DeviceUtilsCore.languageOf(context);
    final appColors = controller.state.theme.colors;
    return BottomSheetWidget(
      title: widget.title ?? lang!.chooseDate,
      key: const Key("bottomSheetCalendar"),
      showIconClose: false,
      child: Column(
        children: [
          showMonth
              ? renderYearMonth(context)
              : CalendarWidget(
                  key: const Key("calendar"),
                  showFocusedDay: true,
                  disableSelectDate: true,
                  focusedDay: selected,
                  callbackOneDate: (selectedDay) {
                    setState(() {
                      selected = selectedDay;
                    });
                  },
                  onHeaderTapped: (date) {
                    setState(() {
                      showMonth = true;
                    });
                  },
                  firstDay: widget.firstDay,
                  lastDay: widget.lastDay,
                ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.showButtonClose
                  ? Flexible(
                      child: CustomButton(
                        onTap: () {
                          if (widget.onCloseChange != null) {
                            widget.onCloseChange!(selected);
                            // Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        content: widget.closeTitle ?? lang!.close,
                        margin: const EdgeInsets.fromLTRB(16, 8, 6, 16),
                        borderWidth: 1,
                        borderColor: appColors.mainGrey,
                        color: appColors.white,
                        textColor: appColors.black,
                      ),
                    )
                  : const SizedBox.shrink(),
              Flexible(
                child: CustomButton(
                  onTap: () {
                    widget.onChange(selected);
                    Navigator.pop(context);
                  },
                  content: lang!.select,
                  margin: const EdgeInsets.fromLTRB(6, 8, 16, 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
