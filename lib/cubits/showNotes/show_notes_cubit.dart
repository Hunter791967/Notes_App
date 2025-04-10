import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/showNotes/show_notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import '../../utils/constants/constants.dart';

class ShowNotesCubit extends Cubit<ShowNotesState> {
  ShowNotesCubit() : super(ShowNotesInitial()); // Pass the initial state here

  fetchNotes() {
    var notesBox =
        Hive.box<NoteModel>(kNotesBox); // Access the Box with proper type
    List<NoteModel> notes =
        notesBox.values.toList(); // Add the note to the box.
    emit(ShowNotesSuccess(notes)); // Emit Success Here
  }
}
