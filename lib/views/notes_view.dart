import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/showNotes/show_notes_cubit.dart';
import 'package:notes_app/customWidgets/custom_app_bar.dart';
import 'package:notes_app/customWidgets/custom_container.dart';
import 'package:notes_app/customWidgets/custom_list_tile.dart';
import 'package:notes_app/customWidgets/custom_list_view_builder.dart';
import 'package:notes_app/customWidgets/custom_tapped_widget.dart';
import 'package:notes_app/utils/helpers/show_dynamic_modal_bottom_sheet.dart';
import '../cubits/showNotes/show_notes_state.dart';
import '../customWidgets/custom_modal_bottom_sheet.dart';
import '../models/note_model.dart';
import '../utils/components/app_colors.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backGround: AppColors.dMedGreen,
          foreGround: AppColors.antiFlashWhite,
          title: 'Notes',
          dFontSize: 36,
          dFontWeight: FontWeight.w900,
          dElevation: 0,
          dFontFamily: 'RushfordPrinted',
          textColor: AppColors.antiFlashWhite,
          lSpacing: 3,
          toolbarHeight: 76,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDynamicModalBottomSheet(
              context: context,
              child: BlocProvider.value(
                value: context.read<ShowNotesCubit>(),
                child: const CustomModalBottomSheet(),
              ),
              isScrollControlled: true,
            );
          },
          backgroundColor: AppColors.dMedGreen,
          foregroundColor: AppColors.antiFlashWhite,
          shape: const CircleBorder(), // Make sure it's circular
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,

        /// ✅ BlocBuilder to listen to state changes
        body: BlocBuilder<ShowNotesCubit, ShowNotesState>(
          builder: (BuildContext context, ShowNotesState state) {
            if (state is ShowNotesSuccess) {
              final notes = state.notes;
              print("Notes loaded: ${notes.length}");
              return CustomListViewBuilder<NoteModel>(
                items: notes,
                itemBuilder: (context, note, index) {
                  return CustomTappedWidget(
                    onTap: () {
                      Navigator.pushNamed(context, 'editNote');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16.0),
                      child: CustomContainer(
                        boxShadowColor: AppColors.dGrey,
                        opacity: 0.5.toInt(),
                        offsetOne: 12,
                        offsetTwo: 12,
                        blurRadius: 4,
                        spreadRadius: -10,
                        borderRadius: 16,
                        containerBgColor: AppColors.dGreen,
                        widget: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 24),
                          child: Column(
                            children: [
                              CustomListTile(
                                title: note.title,
                                subTitle: note.content,
                                textColorOne: AppColors.antiFlashWhite,
                                dFontSizeOne: 20,
                                dFontWeightOne: FontWeight.w900,
                                textColorTwo: AppColors.antiFlashWhite,
                                dFontSizeTwo: 13,
                                dFontWeightTwo: FontWeight.w400,
                                trailing: IconButton(
                                  onPressed: () {
                                    // add delete logic
                                  },
                                  icon: const Icon(FontAwesomeIcons.trash,
                                      size: 40),
                                ),
                                topPadding: 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    note.date,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
