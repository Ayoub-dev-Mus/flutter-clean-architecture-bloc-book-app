import 'package:book_app/home_screen.dart';
import 'package:book_app/injection_container.dart';
import 'package:book_app/presentation/bloc/remote_book_bloc.dart';
import 'package:book_app/presentation/bloc/remote_book_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteBooksBloc>(
      create: (context) => sl()..add(const GetBooks()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
