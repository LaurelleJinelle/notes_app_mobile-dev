import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/notes_screen.dart';
import 'repository/notes_repository.dart';
import 'cubit/notes_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          return RepositoryProvider(
            create: (_) => NotesRepository(),
            child: BlocProvider(
              create: (_) => NotesCubit(snapshot.data!.uid, NotesRepository())..fetchNotes(),
              child: NotesScreen(),
            ),
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
