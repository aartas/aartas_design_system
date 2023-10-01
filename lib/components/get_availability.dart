import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/functions/get_days.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget getAvailability(context, String date) {
  int latestDate = DateFormat("yyyy-MM-dd").parse(date).weekday;
  int todaysDate = DateTime.now().weekday;

  if (latestDate == todaysDate) {
    return Text(
      "Available Today",
      style: textTheme(context).titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.green[300],
          ),
    );
  }
  if (latestDate == (todaysDate == 7 ? 1 : todaysDate + 1)) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Available",
          style: textTheme(context).titleSmall?.copyWith(
                color: fawnColor,
                fontWeight: FontWeight.w600,
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          " Tomorrow",
          style: textTheme(context).titleSmall?.copyWith(
                color: fawnColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  return Text(
    "Available ${getWeekDays(latestDate, true)}",
    style: textTheme(context)
        .titleSmall
        ?.apply(color: fawnColor, fontWeightDelta: 2),
  );
}

Widget getAvailabilityOnly(context, String date) {
  int latestDate = DateFormat("yyyy-MM-dd").parse(date).weekday;
  int todaysDate = DateTime.now().weekday;

  if (latestDate == todaysDate) {
    return Text("Today",
        style: textTheme(context).titleMedium?.apply(fontWeightDelta: 2));
  }
  if (latestDate == (todaysDate == 7 ? 1 : todaysDate + 1)) {
    return Text("Tomorrow",
        style: textTheme(context).titleMedium?.apply(fontWeightDelta: 2));
  }

  return Text(getWeekDays(latestDate, true),
      style: textTheme(context).titleMedium?.apply(fontWeightDelta: 2));
}

String getAvailabilityString(context, String date) {
  int latestDate = DateFormat("yyyy-MM-dd").parse(date).weekday;
  int todaysDate = DateTime.now().weekday;

  if (latestDate == todaysDate) {
    return "Today";
  }
  if (latestDate == (todaysDate == 7 ? 1 : todaysDate + 1)) {
    return "Tomorrow";
  }

  return getWeekDays(latestDate, true);
}
