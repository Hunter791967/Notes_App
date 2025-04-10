import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants/constants.dart';
import 'cubits/showNotes/show_notes_cubit.dart';
import 'notes_app.dart';

void main() async {
  // Use Bloc Observer for Testing & Debugging The States
  Bloc.observer = SimpleBlocObserver();

  // Initialize Hive
  await Hive.initFlutter();

  // ✅ Register the adapter BEFORE opening the box
  Hive.registerAdapter(NoteModelAdapter());

  // Safe Box Opening Logic
  try {
    if (!Hive.isBoxOpen(kNotesBox)) {
      print("Opening the Hive box...");
      final box = await Hive.openBox<NoteModel>(
          kNotesBox); //Open box after registering the adapter
      //   if (box.isEmpty) {
      //     box.add(NoteModel(
      //       title: 'Test Note',
      //       content: 'This is a test note',
      //       date: DateTime.now().toString(),
      //       color: Colors.blue.value,
      //     )
      //     );
      //   }
      // } else {
      //   print("Hive box is already open.");
      //
    }
  } catch (e) {
    print("Error opening Hive box: $e");
  }

  runApp(
    BlocProvider(
      create: (context) => ShowNotesCubit()..fetchNotes(),
      child: const NotesApp(),
    ),
  );
}
