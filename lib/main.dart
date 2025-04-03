import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants/constants.dart';

import 'notes_app.dart';

void main() async {

  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);

  Hive.registerAdapter(NoteModelAdapter()); // To register the created type adapter

  runApp(const NotesApp());
}


