import 'package:flutter/material.dart';

import '../res/color.dart';

class EventPage extends StatelessWidget {
  EventPage({Key? key}) : super(key: key);

  final List<Event> event = [
    Event(
      name: 'Agriculture Workshop',
      location: 'Butawal',
      date: DateTime(2023, 3, 20, 1, 25,30),
    ),
    Event(
      name: 'Awareness Program',
      location: 'NawalParasi',
      date: DateTime(2023, 4, 15, 1, 25,30),
    ),
    Event(
      name: 'Agriculture Development Conference',
      location: 'Bhairahawa',
      date: DateTime(2023, 5, 10, 1, 25,30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          title: const Text('Events',style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          foregroundColor: Colors.black
      ),
      body: ListView.builder(
        itemCount: event.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(event[index].name),
            subtitle: Text('${event[index].location} - ${event[index].date}'),
          );
        },
      ),
    );
  }
}

class Event {
  final String name;
  final String location;
  final DateTime date;

  Event({
    required this.name,
    required this.location,
    required this.date,
  });
}