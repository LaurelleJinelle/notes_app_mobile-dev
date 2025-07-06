import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../cubit/notes_cubit.dart';
import '../widgets/note_dialog.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotesCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          )
        ],
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state.isLoading) return Center(child: CircularProgressIndicator());
          if (state.notes.isEmpty) return Center(child: Text('Nothing here yet—tap ➕ to add a note.'));
          return ListView(
            children: state.notes
                .map(
                  (note) => ListTile(
                    title: Text(note.text),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => showNoteDialog(context, note: note),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Delete Note'),
                              content: Text('Are you sure you want to delete this note?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context), 
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); 
                                    cubit.deleteNote(note.id).then(
                                      (_) => ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Note deleted')),
                                      ),
                                    );
                                  },
                                  child: Text('Delete', style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showNoteDialog(context),
      ),
    );
  }
}
