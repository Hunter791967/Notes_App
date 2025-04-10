
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/themes/app_themes.dart';
import 'package:notes_app/views/edit_note.dart';
import 'package:notes_app/views/notes_view.dart';

import 'cubits/showNotes/show_notes_cubit.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Notes Application',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark, // i can use .system to make automatic switching by Toggle Button
      routes: {
        'notesView': (context) => BlocProvider.value(
          value: context.read<ShowNotesCubit>(),
          child: const NotesView(),
        ),
        'editNote': (context) => const EditNote()
    // (context) => BlocProvider.value(
    // value: context.read<ShowNotesCubit>(),
    // child: const EditNote(),
        ,

      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'notesView',
      // home: HomePage(),
    );
  }
}
