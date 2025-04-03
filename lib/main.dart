import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants/constants.dart';

import 'cubits/addNote/add_note_cubit.dart';
import 'notes_app.dart';

void main() async {

  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);

  Hive.registerAdapter(NoteModelAdapter()); // To register the created type adapter

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AddNoteCubit()),
  ],
  child: const NotesApp()));
}


