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

// String iconImageURL = "$baseURL/../assets/icons";
// String doctorImageURL = "$baseURL/../assets/doctor";
// String homeFeedImageURL = "$baseURL/../assets/home_feed";
// String onBoardingImageURL = "$baseURL/../assets/onboarding";
// String bundlesImageURL = "$baseURL/../assets/bundles";
// String membershipImageURL = "$baseURL/../assets/membership";

//-----------------URLS--------------------
String rupeeIcon = "₹";

//? Primary Colors ---------------------------------

// Primary Color - Aartas Design System
// Pearl: 0xffffffff
Color pearlColor = const Color(0xffffffff);

// Primary Color - Aartas Design System
// Burnt Umber: 0xff96351e
Color burntUmberColor = const Color(0xff96351e);

// Primary Color - Aartas Design System
// Brandy: 0xffdbb98f
Color brandyColor = const Color(0xffdbb98f);

// Primary Color - Aartas Design System
// Raffia: 0xffddc6a8
Color raffiaColor = const Color(0xffddc6a8);

// Primary Color - Aartas Design System
// Sea Shell: 0xfff2f2f2
Color seaShellColor = const Color(0xfff2f2f2);

// Primary Color - Aartas Design System
// Graphite: 0xff29272B
Color graphiteColor = const Color(0xff29272B);

// Primary Color - Aartas Design System
// Charcoal:0xff222023
Color charcoalColor = const Color(0xff222023);

// Primary Color - Aartas Design System
// Charcoal :0xff222023 50% Opacity
Color greyColor = const Color(0xff222023).withOpacity(0.5);

//? Secondary Colors ------------------------------

// Secondary Color - Aartas Design System
// CoppercopperRedColor Red: 0xffC57857
Color copperRedColor = const Color(0xffC57857);

// Secondary Color - Aartas Design System
// Pastel Pink: 0xffE8AD9B
Color pastelPinkColor = const Color(0xffE8AD9B);

// Secondary Color - Aartas Design System
// Silver Pink: 0xffC2B1A1
Color silverPinkColor = const Color(0xffC2B1A1);

// Secondary Color - Aartas Design System
// Cadet Blue: 0xffA2B9C9
Color cadetBlueColor = const Color(0xffA2B9C9);

// Secondary Color - Aartas Design System
// Cadet Grey: 0xff95B3AB
Color cadetGreyColor = const Color(0xff95B3AB);

// Secondary Color - Aartas Design System
// Dark Vanilla: 0xffDEC7A8
Color darkVanillaColor = const Color(0xffDEC7A8);

// Secondary Color - Aartas Design System
// Pale Taupe: 0xffB9967A
Color paleTaupeColor = const Color(0xffB9967A);

// Secondary Color - Aartas Design System
// Quick Silver:0xffA9AC9B
Color quickSilverColor = const Color(0xffA9AC9B);

// Secondary Color - Aartas Design System
// fawn: 0xffD5AD70
Color fawnColor = const Color(0xffD5AD70);

// Secondary Color - Aartas Design System
// buff: 0xffEFD78D
Color buffColor = const Color(0xffEFD78D);

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
            defaultPadding / 2,
          )
        : i == length - 1
            ? EdgeInsets.fromLTRB(
                defaultPadding / 4,
                defaultPadding / 2,
                defaultPadding,
                defaultPadding / 2,
              )
            : EdgeInsets.fromLTRB(
                defaultPadding / 3,
                defaultPadding / 2,
                defaultPadding / 3,
                defaultPadding / 2,
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
      messageStyle == MessageStyle.success ? cadetGreyColor : copperRedColor;
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
              subtitle != null && subtitle.isNotEmpty
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

//
Color getMembershipColor(int membershipTypeId) {
  if (membershipTypeId == 1) {
    return greyColor;
  }
  if (membershipTypeId == 2) {
    return buffColor;
  }
  if (membershipTypeId == 3) {
    return greyColor;
  }
  return cadetBlueColor;
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
            style: textTheme(context).subtitle1?.apply(color: pearlColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: pearlColor,
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
            style: textTheme(context).subtitle1?.apply(color: pearlColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: pearlColor,
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
            style: textTheme(context).subtitle1?.apply(color: copperRedColor),
          ),
        ),
        Icon(
          CupertinoIcons.clear_circled,
          color: copperRedColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 4) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Confirm",
            style: textTheme(context).subtitle1?.apply(color: cadetGreyColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: cadetGreyColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 5) {
    return Text(
      // "Check In",
      "",
      style: textTheme(context).subtitle1?.apply(color: cadetBlueColor),
    );
  }
  if (status == 6) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Vitals Done",
            style: textTheme(context).subtitle1?.apply(color: cadetBlueColor),
          ),
        ),
        Icon(
          CupertinoIcons.thermometer,
          color: cadetBlueColor,
          size: textTheme(context).headline6?.apply().fontSize,
        ),
      ],
    );
  }
  if (status == 7) {
    return Text(
      // "In Appointment",
      "Currently Consulting...",
      style: textTheme(context).subtitle1?.apply(color: cadetBlueColor),
    );
  }
  if (status == 8) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "Completed",
            style: textTheme(context).subtitle1?.apply(color: cadetGreyColor),
          ),
        ),
        Icon(
          CupertinoIcons.check_mark_circled,
          color: cadetGreyColor,
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

removeFocus(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

// ------------------ String Key Variable Nomenclature -----------------
String doctorDetailsFileName = "doctor_details.json";
String patientDetailsFileName = "patient_details.json";
