import 'package:flutter/material.dart';
import 'package:jaguar/http/context/context.dart';
import 'package:jaguar/serve/server.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initServer(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}

void initServer(BuildContext context) async{
  String data = await DefaultAssetBundle.of(context).loadString("assets/response/sample.json");
  final server = Jaguar();  // Serves the API at localhost:8080 by default
  // Add a route handler for 'GET' method at path '/hello'
  server.get('/family', (Context ctx) => data);
  await server.serve();
}
