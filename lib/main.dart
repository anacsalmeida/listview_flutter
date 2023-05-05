import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'my-app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey:
            'AIzaSyA25dzAtNKoxIyfWu66Xc4URtJXFv9Fbhk', //LOCALIZADA NO GOOGLE-SERVICE.json => api_key['current_key']
        appId:
            '1:735247829413:android:49adb73804e2f2a5bd804c', //ID DO APLICATIVO
        messagingSenderId: '735247829413', // NÚMERO DO PROJETO
        projectId: '735247829413' // NÚMERO DO PROJETO
        ),
  );
  runApp(const MyApp());
}
