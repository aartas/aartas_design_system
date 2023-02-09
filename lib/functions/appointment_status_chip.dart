import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/functions/custom_chip.dart';
import 'package:flutter/cupertino.dart';

// return Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Expanded(
//       child: Text(
//         "Confirmation Pending",
//         style: textTheme(context).subtitle1?.apply(color: pearlColor),
//       ),
//     ),
//     Icon(
//       CupertinoIcons.check_mark_circled,
//       color: pearlColor,
//       size: textTheme(context).headline6?.apply().fontSize,
//     ),
//   ],
// );

Widget getAppointmentStatusChip(context, int status) {
  if (status == 1) {
    return CustomChip(
      child: Text(
        "Confirmation Pending",
        style: textTheme(context).subtitle2!.apply(
              color: charcoalColor,
            ),
      ),
      backgroundColor: buffColor,
    );
  }
  if (status == 2) {
    return CustomChip(
      child: Text(
        "Confirm",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: cadetGreyColor,
    );
  }
  if (status == 3) {
    return CustomChip(
      child: Text(
        "Cancelled",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: copperRedColor,
    );
  }
  if (status == 4) {
    return const SizedBox();
    // return CustomChip(
    //   child: Text(
    //     "QR Code Generated",
    //     style: textTheme(context).subtitle2!.apply(
    //           color: seaShellColor,
    //         ),
    //   ),
    //   backgroundColor: cadetBlueColor,
    // );
  }
  if (status == 5) {
    return CustomChip(
      child: Text(
        "Check in",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: cadetBlueColor,
    );
  }
  if (status == 6) {
    return CustomChip(
      child: Text(
        "Vitals Done",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: cadetBlueColor,
    );
  }
  if (status == 7) {
    return CustomChip(
      child: Text(
        "Currently Consulting...",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: cadetBlueColor,
    );
  }
  if (status == 8) {
    return CustomChip(
      child: Text(
        "Completed",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: cadetGreyColor,
    );
  }
  if (status == 9) {
    return CustomChip(
      child: Text(
        "unattended",
        style: textTheme(context).subtitle2!.apply(
              color: seaShellColor,
            ),
      ),
      backgroundColor: quickSilverColor,
    );
  }
  if (status == 10) {
    return CustomChip(
      child: Text(
        "Payment Pending",
        style: textTheme(context).subtitle2!.apply(
              color: charcoalColor,
            ),
      ),
      backgroundColor: buffColor,
    );
  }
  return CustomChip(
    child: Text(
      "...",
      style: textTheme(context).subtitle2!.apply(
            color: charcoalColor,
          ),
    ),
    backgroundColor: buffColor,
  );
}

String getAppointmentStatusString(context, int status) {
  if (status == 1) {
    return "Confirmation Pending";
  }
  if (status == 2) {
    return "Booked";
  }
  if (status == 3) {
    return "Cancelled";
  }
  if (status == 4) {
    return "Booked";
    // return CustomChip(
    //   child: Text(
    //     "QR Code Generated",
    //     style: textTheme(context).subtitle2!.apply(
    //           color: seaShellColor,
    //         ),
    //   ),
    //   backgroundColor: cadetBlueColor,
    // );
  }
  if (status == 5) {
    return "Check in";
  }
  if (status == 6) {
    return "Vitals Done";
  }
  if (status == 7) {
    return "Currently Consulting...";
  }
  if (status == 8) {
    return "Completed";
  }
  if (status == 9) {
    return "Unattended";
  }
  if (status == 10) {
    return "Payment Pending";
  }
  return "...";
}
