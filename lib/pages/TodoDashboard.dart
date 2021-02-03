import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/constants.dart';
import 'package:flutter_app_expensetracker/models/database_helper.dart';
import 'package:flutter_app_expensetracker/models/task_model.dart';
import 'package:flutter_app_expensetracker/pages/add_task_screen.dart';
import 'package:intl/intl.dart';

class TodoDashboard extends StatefulWidget {
  @override
  _TodoDashboardState createState() => _TodoDashboardState();
}

class _TodoDashboardState extends State<TodoDashboard> {
  Future<List<Task>> _taskList;
  final DateFormat _formatter = DateFormat("MMM dd, yyyy");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTaskList();
  }

  updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    AddTaskScreen(taskUpdateFunction: updateTaskList))),
      ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final int completedTaskCount = snapshot.data
              .where((Task task) => task.status == 1)
              .toList()
              .length;

          return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 1 + snapshot.data.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildFirstItem(
                      completedTaskCount, snapshot.data.length);
                }
                return buildTask(snapshot.data[index - 1]);
              });
        },
      ),
    );
  }

  Widget buildTask(Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddTaskScreen(
                            task: task,
                            taskUpdateFunction: updateTaskList,
                          )));
            },
            title: Text(
              '${task.title}',
              style: task.status == 1
                  ? TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough)
                  : CustomTextStyle.defaultBoldStyle,
            ),
            subtitle: Text(
              '${_formatter.format(task.date)} * ${task.priority}',
              style: task.status == 1
                  ? TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.lineThrough)
                  : CustomTextStyle.defaultRegularStyle12,
            ),
            trailing: Checkbox(
              activeColor: Colors.white.withOpacity(.5),

              value: task.status == 1 ? true : false,
              onChanged: (checked) {
                task.status = checked ? 1 : 0;
                DatabaseHelper.instance.updateTask(task);
                updateTaskList();
              },
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Padding buildFirstItem(completedCount, totalCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Task',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$completedCount of $totalCount',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(.7),
                fontSize: 18),
          )
        ],
      ),
    );
  }
}
