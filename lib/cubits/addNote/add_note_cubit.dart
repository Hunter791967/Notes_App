import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/addNote/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';

import '../../utils/constants/constants.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(super.initialState);

  addNote(NoteModel noteModel) async {
    
    emit(AddNoteLoading());
    
    try {
      var notesBox = Hive.box(kNotesBox);

      emit(AddNoteSuccess());
      await notesBox.add(noteModel);
    } catch (e) {
      emit(AddNoteError(e.toString()));
    }
  }
}
