import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
 String task2result= await task2();
  task3(task2result);
}

void task1() {
  String result = 'task1 data';
  print('task1complete');
}

Future task2()  async{
  Duration threeSeconds =  Duration(seconds: 3);
  String result ='';

  await Future.delayed(threeSeconds,() {
     result = 'task2 data';
    print('task2complete');
  }, );
  return result;

}

void task3(String task2Data) {
  String result = 'task3 data';
  print('task3complete with $task2Data');
}
