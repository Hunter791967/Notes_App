
import 'package:flutter/material.dart';
import 'package:notes_app/themes/app_themes.dart';
import 'package:notes_app/views/edit_note.dart';
import 'package:notes_app/views/notes_view.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return Placeholder();
    return MaterialApp(
      title: 'Notes Application',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark, // i can use .system to make automatic switching by Toggle Button
      routes: {
        'notesView': (context) => const NotesView(),
        'editNote': (context) => const EditNote(),
      //   'showCategories': (context) => const ShowCategories(),
      //   'productDetails': (context) => const ProductDetails(),
      //   'addProduct': (context) => const AddProduct(),
      //   //'addProduct': (context) => TestScreen(),
      //   'addCategory': (context) => const AddCategory(),
      //   'updateProduct': (context) => const UpdateProduct(),
      //   'updateCategory': (context) => const UpdateCategory(),
      //   'deleteProduct': (context) => const DeleteProduct(),
      //   'deleteCategory': (context) => const DeleteCategory(),
      },
      // debugShowCheckedModeBanner: false,
      initialRoute: 'notesView',
      // home: HomePage(),
    );
  }
}
