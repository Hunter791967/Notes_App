import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants/constants.dart';
import 'cubits/showNotes/show_notes_cubit.dart';
import 'notes_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  final notesBox = await Hive.openBox<NoteModel>(kNotesBox);

  runApp(
    BlocProvider(
      create: (context) => ShowNotesCubit()..fetchNotes(),
      child: const NotesApp(),
    ),
  );
}


