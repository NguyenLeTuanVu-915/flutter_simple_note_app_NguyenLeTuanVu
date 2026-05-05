import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../widgets/note_card.dart';
import 'note_editor_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => context.read<NoteProvider>().loadNotes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = context.watch<NoteProvider>();
    final notes = noteProvider.notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Note App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: notes.isEmpty
          ? const Center(child: Text('Chưa có ghi chú nào'))
          : ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(note: notes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const NoteEditorScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}