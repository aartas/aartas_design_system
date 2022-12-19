<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

<!-- TODO: List what your package can do. Maybe include images, gifs, or videos. -->

This Package is a solution for Api Integration, Reusable Components, State Mangement according to the aartas' design system.

## Getting started

<!-- TODO: List prerequisites and provide or point to information on how to start using the package. -->

Step 1:
Add provider to the project dependencies.
NOTE: This package will not work without provider package.

```dart
dependencies:
  provider: any
```

Step 2:
Add AartasApiProvider to the top level functions.

```dart
const AartasApiProvider(
    child: MaterialApp(),
);
```

Step 3:
Fetch & Get API Response.

```dart
// This is a Future Response.

// Fetch APIs
// use {listen: false} if the provider called inside the functions.
Provider.of<[PROVIDER_NAME]>(context, listen: false).fetchList(baseURL, patientID);


// Get APIs
// No listen parameter required for the get function as it will always called inside override BuildContext.
Provider.of<[PROVIDER_NAME]>(context).getList();
```

## Usage

```dart
// This is a example to an optimized code for performance point of view and its include techniques like DRY(Don't Repeat Yourself) & Guard Clauses Technique.
class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool isLoading = true;
  @override
  void initState() {
    customApi();
    super.initState();
  }
  // ---- Example of DRY(Don't Repeat Yourself). ----
  Future<void> customApi() {
    var patientID =
        Provider.of<PatientProvider>(context, listen: false).getData().id;
    return Provider.of<DoctorProvider>(context, listen: false)
        .fetchList(baseURL, "$patientID")
        .then((value) {
      isLoading = false;
      setState(() {});
    });
  }
  // ---- Example of DRY(Don't Repeat Yourself). ----

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<DoctorProvider>(context).getList();
    // ----- Example of Guard Clauses Technique. ------

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (list.isEmpty) {
      return const Center(child: Text("Nothing to show"));
    }

    // ----- Example of Guard Clauses Technique. ------

    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: customApi,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: list.length,
            itemBuilder: (_, i) {
              var random = Random().nextInt(99) + 99;
              return CusWidg(random: random);
            }),
      ),
    );
  }
}

class CusWidg extends StatelessWidget {
  const CusWidg({
    Key? key,
    required this.random,
  }) : super(key: key);

  final int random;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: mediaQuery(context).size.width,
      alignment: Alignment.center,
      child: Text(
        "$random",
        style:
            textTheme(context).headline5?.apply(fontWeightDelta: 2),
      ),
    );
  }
}

```

## IMPORTANT NOTE : This is private project which only associates with aartas, using or sharing of any of the code outside the aartas ecosystem might came under an offensive action.

## List Of Providers/Models

1. Models:
   base url for models:
   lib/models/
   |

   - address_model.dart
   - appointment_model.dart

2. Providers:
   base url for providers:
   lib/providers/
   |

   - address_provider.dart
   - appointment_provider.dart
