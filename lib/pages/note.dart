import 'package:flutter/material.dart';

import '../res/color.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final List<String> _notes = [];
  void _addNote(String note){
    setState((){
      _notes.add(note);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: AppColors.appbarColor,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(_notes[index]),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context){
                return AddNoteForm((note){
                  _addNote(note);
                  Navigator.pop(context);
                });
              }
          );
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  final Function(String) onNoteAdd;
  const AddNoteForm( this.onNoteAdd,
      {Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();
  String _note = "";

  void _submitForm(){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      widget.onNoteAdd(_note);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(labelText: "Note"),
            validator: (value){
              if(value!.isEmpty){
                return 'Please enter a note';
              }
              return null;
            },
            onSaved: (value)=> _note = value!,
          ),
          const SizedBox(height: 25,),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Add',style:TextStyle(fontSize:20)),
          )
        ],
      ),
    );
  }
}
