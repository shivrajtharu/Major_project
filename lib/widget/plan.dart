import 'package:flutter/material.dart';

import '../res/color.dart';

class Plan extends StatefulWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  List<String> plannedActivities = [];

  void _addActivity(String activityName) {
    setState(() {
      plannedActivities.add(activityName);
    });
  }

  void _removeActivity(int index) {
    setState(() {
      plannedActivities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: const Text('Plan Your Day'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: plannedActivities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(plannedActivities[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeActivity(index);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final activityName = await _showAddActivityDialog();
              if (activityName != null) {
                _addActivity(activityName);
              }
            },
            child: const Text('Add Activity'),
          ),
        ],
      ),
    );
  }

  Future<String?> _showAddActivityDialog() async {
    TextEditingController activityNameController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Activity'),
          content: TextField(
            controller: activityNameController,
            decoration: const InputDecoration(hintText: 'Enter activity name'),
            onChanged: (value) {
              setState(() {
                // You can update the dialog's state here if needed
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(activityNameController.text);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}