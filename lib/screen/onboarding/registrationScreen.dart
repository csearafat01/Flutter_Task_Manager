import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);
  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  Map<String,String> FormValues={"email":"", "firstName":"","lastName":"","mobile":"","password":"","photo":"","cpassword":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{

    if(FormValues['email']!.isEmpty){
      ErrorToast('Email Required !');
    }

    else if(FormValues['firstName']!.isEmpty){
      ErrorToast('First Name Required !');
    }

    else if(FormValues['lastName']!.isEmpty){
      ErrorToast('Last Name Required !');
    }

    else if(FormValues['mobile']!.isEmpty){
      ErrorToast('Mobile No Required !');
    }

    else if(FormValues['password']!.isEmpty){
      ErrorToast('Mobile No Required !');
    }
    else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast('Confirm password should be same!');
    }
    else{
      setState(() {Loading=true;});
      bool res=await RegistrationRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      else{
        setState(() {Loading=false;});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child:Loading?(const Center(child: CircularProgressIndicator())):(
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Join With Us", style: Head1Text(colorDarkBlue)),
                          const SizedBox(height: 1),
                          Text("Learn with rabbil hasan", style: Head6Text(colorLightGray)),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Email Address"),
                              onChanged: (Textvalue){
                                InputOnChange("email",Textvalue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("First Name"),
                              onChanged: (Textvalue){
                                InputOnChange("firstName",Textvalue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Last Name"),
                              onChanged: (Textvalue){
                                InputOnChange("lastName",Textvalue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Mobile"),
                              onChanged: (Textvalue){
                                InputOnChange("mobile",Textvalue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Password"),
                              onChanged: (Textvalue){
                                InputOnChange("password",Textvalue);
                              }
                          ),


                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Confirm Password"),
                              onChanged: (Textvalue){
                                InputOnChange("cpassword",Textvalue);
                              }
                          ),

                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Registration'),
                            onPressed: (){
                              FormOnSubmit();
                            },
                          )

                        ],
                      ),
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}