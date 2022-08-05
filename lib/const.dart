import 'package:aartas_design_system/components/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String rupee = "₹";
double defaultPadding = 16;

TextTheme textTheme(context) {
  return Theme.of(context).textTheme;
}

ThemeData themeData(context) {
  return Theme.of(context);
}

MediaQueryData mediaQuery(context) {
  return MediaQuery.of(context);
}

//-----------------URLS--------------------
String apiKey = "AIzaSyC4wk5k8E6jKkpJClZlXZ8oavuPyi0AMVE";

// REDEV TESTING URL
String redevURL =
    "https://aartas-qaapp-as.azurewebsites.net/aartas_redev/public/api";
// UAT TESTING URL
String uatURL =
    "https://aartas-qaapp-as.azurewebsites.net/aartas_uat/public/api";
// LIVE PRODUCTION URL
String liveURL = "https://aartas.com/v1/public/api";

//? BASE URL
String baseURL = liveURL;

String docImageURL = "$baseURL/../assets/scanned_documents";
String labelImageURL = "$baseURL/../assets/vaccine_labels";
// String iconImageURL = "$baseURL/../assets/icons";
// String doctorImageURL = "$baseURL/../assets/doctor";
// String homeFeedImageURL = "$baseURL/../assets/home_feed";
// String onBoardingImageURL = "$baseURL/../assets/onboarding";
// String bundlesImageURL = "$baseURL/../assets/bundles";
// String membershipImageURL = "$baseURL/../assets/membership";

//-----------------URLS--------------------
String rupeeIcon = "₹";

//! Colors
Color primaryColor = Colors.orange;
Color yellowColor = Colors.orange[300]!;
Color redColor = Colors.red[400]!;
Color blueColor = Colors.blue[400]!;
Color greenColor = Colors.green[400]!;
Color greyColor = Colors.grey[500]!;
// Color backgroundColor = const Color(0xff1c1c1e);
// Color backgroundColor = Colors.grey[900]!;
// Color backgroundColor = const Color(0xff0a0a0a);
// Color cardColor = Colors.grey[900]!;
// Color cardColor = const Color(0xff2c2c2e);
Color whiteColor = Colors.white.withOpacity(0.9);
Color blackColor = Colors.black;

//! EdgeInsets - Padding

EdgeInsets defaultHorizontalPadding =
    EdgeInsets.symmetric(horizontal: defaultPadding);
EdgeInsets defaultVerticalPadding =
    EdgeInsets.symmetric(vertical: defaultPadding);

EdgeInsets listVerticalPadding = EdgeInsets.symmetric(vertical: defaultPadding);
EdgeInsets listHorizontalPadding = EdgeInsets.only(left: defaultPadding);

EdgeInsets subHeadingPadding = EdgeInsets.fromLTRB(
    defaultPadding, defaultPadding / 2, defaultPadding, defaultPadding / 3);
EdgeInsets subHeadingVerticalPadding =
    EdgeInsets.fromLTRB(0, defaultPadding / 2, 0, defaultPadding / 3);

EdgeInsets listPadding(length, i, direction) {
  if (direction == Axis.horizontal) {
    return i == 0
        ? EdgeInsets.fromLTRB(
            defaultPadding,
            defaultPadding / 2,
            defaultPadding / 3,
            defaultPadding,
          )
        : i == length - 1
            ? EdgeInsets.fromLTRB(
                defaultPadding / 4,
                defaultPadding / 2,
                defaultPadding,
                defaultPadding,
              )
            : EdgeInsets.fromLTRB(
                defaultPadding / 3,
                defaultPadding / 2,
                defaultPadding / 3,
                defaultPadding,
              );
  } else {
    return EdgeInsets.fromLTRB(
      defaultPadding,
      i == 0 ? defaultPadding / 2 : defaultPadding / 2,
      defaultPadding,
      i == length - 1 ? defaultPadding / 2 : defaultPadding / 2,
    );
  }
}

//! Border Radius
double borderRadius = 20;
//! Icon Size
double defaultIconSize = 48;
//! Duration
Duration duration = const Duration(milliseconds: 300);
//! Curves
Curve curve = Curves.fastOutSlowIn;
//! Elevation
double elevation = 10;

get24to12(String time) {
  return "${DateFormat.jm().format(
    DateFormat("Hm").parse(time.split("-").first),
  )} - ${DateFormat.jm().format(
    DateFormat("Hm").parse(time.split("-").last),
  )}";
}

getNameInitials(String? name) {
  String finalValue = "";
  List<String> splittedName = name!.split(" ");
  for (var i = 0; i < splittedName.length; i++) {
    finalValue += splittedName[i].characters.first.toUpperCase();
  }
  return finalValue.length <= 1
      ? finalValue.characters.first
      : finalValue.characters.first + finalValue.characters.last;
  // return splittedName[0].characters.first.toUpperCase() +
  //     splittedName[1].characters.first.toUpperCase();
}

Gradient bgGradient(context, bool reverse) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      reverse
          ? themeData(context).scaffoldBackgroundColor
          : themeData(context).cardColor,
      !reverse
          ? themeData(context).scaffoldBackgroundColor
          : themeData(context).cardColor,
    ],
  );
}

// List<dynamic> connect(context) {
//   return [
//     {
//       "id": 0,
//       "name": "Whatsapp",
//       "icon": Icons.whatsapp_rounded,
//       "bg": themeData(context).cardColor,
//       "color": primaryColor,
//       "onTap": () {
//         var message = Uri.encodeComponent("Hi, I need assistance.");
//         var url = "https://wa.me/919810366516?text=$message";
//         openUrls(url);
//       },
//     },
//     {
//       "id": 1,
//       "name": "Call",
//       "icon": CupertinoIcons.phone_fill,
//       "bg": themeData(context).cardColor,
//       "color": primaryColor,
//       "onTap": () {
//         const url = "tel:+919810366516";
//         openUrls(url);
//       },
//     },
//     {
//       "id": 2,
//       "name": "Website",
//       "icon": CupertinoIcons.globe,
//       "bg": themeData(context).cardColor,
//       "color": primaryColor,
//       "onTap": () {
//         var url = "https://www.aartas.com";
//         openUrls(url);
//       },
//     },
//   ];
// }
enum MessageStyle { success, danger }

snackBar(
  context,
  String? title,
  String? subtitle,
  MessageStyle? messageStyle,
) {
  Color _messageStyleColor =
      messageStyle == MessageStyle.success ? greenColor : redColor;
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      width: mediaQuery(context).size.width / 3.5,
      // margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.zero,
      duration: duration * 10,
      backgroundColor: Colors.transparent,
      elevation: 6,
      // backgroundColor: backgroundColor ?? Color(0xFF3C3C3E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius / 2),
      ),
      content: GlassMorphism(
        color: _messageStyleColor,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                child: Text(
                  title ?? "",
                  style: textTheme(context).subtitle1?.apply(
                        fontWeightDelta: 1,
                      ),
                ),
              ),
              subtitle!.isNotEmpty
                  ? Text(
                      subtitle,
                      style: textTheme(context).caption?.apply(),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    ),
  );
}

Color getMembershipColor(int membershipTypeId) {
  if (membershipTypeId == 1) {
    return greyColor;
  }
  if (membershipTypeId == 2) {
    return yellowColor;
  }
  if (membershipTypeId == 3) {
    return Colors.blueGrey;
  }
  return whiteColor;
}

String getMembershipTitle(int membershipTypeId) {
  if (membershipTypeId == 1) {
    return "SILVER";
  }
  if (membershipTypeId == 2) {
    return "GOLD";
  }
  if (membershipTypeId == 3) {
    return "PLATINUM";
  }
  return "TITANIUM";
}

Widget getAppointmentStatus(context, int status) {
  if (status == 1) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Confirmation Pending",
            style: textTheme(context).subtitle1?.apply(color: whiteColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: whiteColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 2) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Confirm",
            style: textTheme(context).subtitle1?.apply(color: whiteColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: whiteColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 3) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Cancelled",
            style: textTheme(context).subtitle1?.apply(color: redColor),
          ),
        ),
        Icon(
          CupertinoIcons.clear_circled,
          color: redColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 4) {
    return Text(
      // "QR",
      "",
      style: textTheme(context).subtitle1?.apply(color: blueColor),
    );
  }
  if (status == 5) {
    return Text(
      // "Check In",
      "",
      style: textTheme(context).subtitle1?.apply(color: blueColor),
    );
  }
  if (status == 6) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Vitals Done",
            style: textTheme(context).subtitle1?.apply(color: blueColor),
          ),
        ),
        Icon(
          CupertinoIcons.thermometer,
          color: blueColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 7) {
    return Text(
      // "In Appointment",
      "Currently Consulting...",
      style: textTheme(context).subtitle1?.apply(color: blueColor),
    );
  }
  if (status == 8) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Completed",
            style: textTheme(context).subtitle1?.apply(color: greenColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: greenColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 9) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Unattainted",
            style: textTheme(context).subtitle1?.apply(color: greyColor),
          ),
        ),
        Icon(
          CupertinoIcons.clear,
          color: greyColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  return const Text("...");
}

// EdgeInsets listPadding(length, i, direction) {
//   if (direction == Axis.horizontal) {
//     return i == 0
//         ? EdgeInsets.fromLTRB(
//             defaultPadding,
//             defaultPadding / 2,
//             defaultPadding / 3,
//             defaultPadding,
//           )
//         : i == length - 1
//             ? EdgeInsets.fromLTRB(
//                 defaultPadding / 4,
//                 defaultPadding / 2,
//                 defaultPadding,
//                 defaultPadding,
//               )
//             : EdgeInsets.fromLTRB(
//                 defaultPadding / 3,
//                 defaultPadding / 2,
//                 defaultPadding / 3,
//                 defaultPadding,
//               );
//   } else {
//     return EdgeInsets.fromLTRB(
//       defaultPadding,
//       i == 0 ? defaultPadding / 2 : defaultPadding / 2,
//       defaultPadding,
//       i == length - 1 ? defaultPadding / 2 : defaultPadding / 2,
//     );
//   }
// }

String getMonths(int? i, bool? full) {
  if (i == 1) {
    return full! ? "January" : "Jan";
  }
  if (i == 2) {
    return full! ? "February" : "Feb";
  }
  if (i == 3) {
    return full! ? "March" : "Mar";
  }
  if (i == 4) {
    return full! ? "April" : "Apr";
  }
  if (i == 5) {
    return full! ? "May" : "May";
  }
  if (i == 6) {
    return full! ? "June" : "Jun";
  }
  if (i == 7) {
    return full! ? "July" : "Jul";
  }
  if (i == 8) {
    return full! ? "August" : "Aug";
  }
  if (i == 9) {
    return full! ? "September" : "Sep";
  }
  if (i == 10) {
    return full! ? "October" : "Oct";
  }
  if (i == 11) {
    return full! ? "November" : "Nov";
  }
  if (i == 12) {
    return full! ? "December" : "Dec";
  }
  return "?";
}

String getDays(int? i, bool? full) {
  if (i == 1) {
    return full! ? "Monday" : "Mon";
  }
  if (i == 2) {
    return full! ? "Tuesday" : "Tue";
  }
  if (i == 3) {
    return full! ? "Wednesday" : "Wed";
  }
  if (i == 4) {
    return full! ? "Thursday" : "Thu";
  }
  if (i == 5) {
    return full! ? "Friday" : "Fri";
  }
  if (i == 6) {
    return full! ? "Saturday" : "Sat";
  }
  if (i == 7) {
    return full! ? "Sunday" : "Sun";
  }
  return "?";
}

removeFocus(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

// ------------------ String Key Variable Nomenclature -----------------
String doctorDetailsFileName = "doctor_details.json";
String patientDetailsFileName = "patient_details.json";
