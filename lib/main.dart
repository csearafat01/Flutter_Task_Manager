
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_project/screen/onboarding/emailVarificationScreen.dart';
import 'package:task_manager_project/screen/onboarding/loginScreen.dart';
import 'package:task_manager_project/screen/onboarding/pinVarificationScreen.dart';
import 'package:task_manager_project/screen/onboarding/registrationScreen.dart';
import 'package:task_manager_project/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager_project/screen/onboarding/splashScreen.dart';
import 'package:task_manager_project/screen/task/taskCreateScreen.dart';

/*main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp( MyApp("/login"));
  }
  else{
    runApp( MyApp("/"));
  }
}*/

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: '/pinVerification',
      routes: {
        '/':(context)=> splashScreen(),
        '/login':(context)=> loginScreen(),
        '/registration':(context)=> registrationScreen(),
        '/emailVerification':(context)=> emailVerificationScreen(),
        '/pinVerification':(context)=> pinVerificationScreen(),
        '/setPassword':(context)=> setPasswordScreen(),
        '/taskCreate':(context)=> taskCreateScreen()
      },
    );
  }
}