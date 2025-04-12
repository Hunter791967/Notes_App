import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/themes/app_themes.dart';
import 'package:notes_app/views/edit_note.dart';
import 'package:notes_app/views/notes_view.dart';

import 'cubits/showNotes/show_notes_cubit.dart';
import 'models/note_model.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes Application',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: 'notesView',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'notesView':
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: context.read<ShowNotesCubit>(),
                child: const NotesView(),
              ),
            );
          case 'editNote':
            final note = settings.arguments as NoteModel;
            return MaterialPageRoute(
              builder: (context) => EditNote(noteModel: note),
            );
          default:
            return null;
        }
      },
    );
  }
}
