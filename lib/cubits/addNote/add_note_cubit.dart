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
      await Future.delayed(const Duration(
          milliseconds: 300)); // 👈 Gives UI time to show spinner
      var notesBox =
          Hive.box<NoteModel>(kNotesBox); // Access the Box with proper type
      await notesBox.add(noteModel); // Add the note to the box.

      // Print all notes to verify if the note is added
      //print('Notes in Hive Box: ${notesBox.values.toList()}');

      emit(AddNoteSuccess()); // Emit Success Here
    } catch (e) {
      emit(AddNoteError(
          e.toString())); // Emit error state if something goes wrong
    }
  }
}
