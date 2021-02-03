import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/constants.dart';
import 'package:flutter_app_expensetracker/models/database_helper.dart';
import 'package:flutter_app_expensetracker/models/task_model.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {

  final Task task;
  final Function taskUpdateFunction;

  AddTaskScreen({this.task, this.taskUpdateFunction});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  String _title = '';
  String _priority;
  DateTime _date = DateTime.now();

  final DateFormat _formatter = DateFormat("MMM dd, yyyy");
  final List<String> priorities = ['High', 'Medium', 'Low'];
  TextEditingController _dateController = TextEditingController();

  _handleDatePicker() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _formatter.format(_date);
    }
  }

  _submit() {
    if(formKey.currentState.validate()) {
      formKey.currentState.save();

      Task task = Task(title: _title, date: _date, priority: _priority);
      if(widget.task == null) {
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
      } else {
        task.status = widget.task.status;
        task.id = widget.task.id;

        DatabaseHelper.instance.updateTask(task);
      }
      widget.taskUpdateFunction();
    Navigator.pop(context);
    }
  }

  _deleteTask() {
    DatabaseHelper.instance.deleteTask(widget.task);

    widget.taskUpdateFunction();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = _formatter.format(_date);

    if(widget.task != null) {
      _title = widget.task.title;
      _date = widget.task.date;
      _priority = widget.task.priority;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backArrow(context),
                Text(
                  widget.task == null ?'Add Task' : 'Update Task',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: CustomTextStyle.inputDecoration('Title'),
                          validator: (input) => input.trim().isEmpty
                              ? 'Please enter task title'
                              : null,
                          initialValue: _title,
                          onSaved: (input) => _title = input,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration: CustomTextStyle.inputDecoration('Date'),
                          onTap: _handleDatePicker,
                          controller: _dateController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField(
                          isDense: true,
                          items: priorities
                              .map((priority) => DropdownMenuItem(
                                  value: priority,
                                  child: Text(
                                    priority,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  )))
                              .toList(),
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconSize: 22,
                          iconEnabledColor: Colors.white,
                          iconDisabledColor: primaryColor,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          decoration:
                              CustomTextStyle.inputDecoration('Priority'),
                          validator: (input) => input == null
                              ? 'Please enter task priority'
                              : null,
                          onSaved: (input) => _priority = input,
                          value: _priority,
                          onChanged: (value) => setState(() {
                            _priority = value;
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: _submit,
                            child: Text(
                              widget.task != null? 'Update' : 'Add',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ), SizedBox(
                          height: 20,
                        ),
                        widget.task != null? Container(
                          height: 60,
                          width: double.infinity,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: _deleteTask,
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ):Container()
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector backArrow(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.arrow_back, color: Colors.white),
      onTap: () => Navigator.pop(context),
    );
  }
}
