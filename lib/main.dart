import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants/constants.dart';

import 'cubits/addNote/add_note_cubit.dart';
import 'notes_app.dart';

void main() async {
  await Hive.initFlutter();

  // ✅ Register the adapter BEFORE opening the box
  Hive.registerAdapter(NoteModelAdapter());

  // Safe Box Opening Logic
  try {
    if (!Hive.isBoxOpen(kNotesBox)) {
      print("Opening the Hive box...");
      await Hive.openBox<NoteModel>(kNotesBox);
    } else {
      print("Hive box is already open.");
    }
  } catch (e) {
    print("Error opening Hive box: $e");
  }

  // // ✅ Register the adapter BEFORE opening the box
  // Hive.registerAdapter(NoteModelAdapter());
  //
  // // ✅ Open box after registering the adapter
  // if (!Hive.isBoxOpen(kNotesBox)) {
  //   await Hive.openBox<NoteModel>(kNotesBox); // Open only if not already opened
  // }


// Use Bloc Observer for Testing & Debugging The States
  Bloc.observer = SimpleBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AddNoteCubit()),
    ],
    child: const NotesApp(),
  ));

  // runApp(MultiBlocProvider(providers: [
  //   BlocProvider(create: (context) => AddNoteCubit()),
  // ], child: const NotesApp())); //runApp
}
