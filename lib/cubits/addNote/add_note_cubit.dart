import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/addNote/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';

import '../../utils/constants/constants.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial()); // Pass the initial state here

  addNote(NoteModel noteModel) async {
    
    emit(AddNoteLoading());
    
    try {
      var notesBox = Hive.box(kNotesBox); // Access Hive Box

      emit(AddNoteSuccess()); // Emit Success Here
      await notesBox.add(noteModel); // Add Note to the box.
    } catch (e) {
      emit(AddNoteError(e.toString())); // Emit error state if something goes wrong
    }
  }
}
