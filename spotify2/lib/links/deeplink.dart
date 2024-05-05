import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uri? _deepLinkUri;

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  void initDeepLinks() async {
    try {
      Uri? initialUri = await getInitialUri();
      if (initialUri != null) {
        handleDeepLink(initialUri);
      }
    } on PlatformException {
      // Handle exception
    }

    linkStream.listen((Uri? uri) {
      if (uri != null) {
        handleDeepLink(uri);
      }
    } as void Function(String? event)?, onError: (err) {
      // Handle error
    });
  }

  void handleDeepLink(Uri uri) {
    setState(() {
      _deepLinkUri = uri;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Deep Linking Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_deepLinkUri != null)
                Text('Deep Link: ${_deepLinkUri.toString()}'),
              // Outros widgets da sua interface de usuário aqui
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// import 'package:uni_links/uni_links.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _deepLink = '';

//   @override
//   void initState() {
//     super.initState();
//     initDeepLinks();
//   }

//   void initDeepLinks() async {
//     try {
//       Uri? initialUri = await getInitialUri();
//       if (initialUri != null) {
//         handleDeepLink(initialUri);
//       }
//     } on PlatformException {
//       // Handle exception
//     }

//     linkStream.listen((Uri? uri) {
//       if (uri != null) {
//         handleDeepLink(uri);
//       }
//     } as void Function(String? event)?, onError: (err) {
//       // Handle error
//     });
//   }

//   void handleDeepLink(Uri uri) {
//     setState(() {
//       _deepLink = uri.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Deep Linking Demo'),
//         ),
//         body: Center(
//           child: Text('Deep Link: $_deepLink'),
//         ),
//       ),
//     );
//   }
// }
