
import 'package:notes_app/models/note_model.dart';

abstract class ShowNotesState {}

class ShowNotesInitial extends ShowNotesState {}

class ShowNotesLoading extends ShowNotesState {}

class ShowNotesSuccess extends ShowNotesState {
  final List<NoteModel> notes;

  ShowNotesSuccess(this.notes);
}

// class ShowNotesError extends ShowNotesState {
//   final String errMessage;
//
//   ShowNotesError(this.errMessage);
// }
