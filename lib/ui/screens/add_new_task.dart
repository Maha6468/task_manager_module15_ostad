import 'package:flutter/material.dart';
import '../widgets/screen_background.dart';
import '../widgets/tm_app_bar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Text('Add new Task',
                    style: Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Title'
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                ),
                const SizedBox(height: 20,),
                FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined))
              ],
            ),
          )),
    );
  }
}