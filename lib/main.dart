import 'package:flutter/material.dart';
import 'stateManagment/matematika_state.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';
import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Matematika>(
          builder: (context)=> Matematika(),
        ),
      ],
      child: MaterialApp(
          onGenerateRoute: router.generateRoute,
        initialRoute: "/",
        theme: ThemeData.dark(),
            home: HomePage(),


      ),
    );
  }
}
