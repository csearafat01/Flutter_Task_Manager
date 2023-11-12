import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class SetPasswordScreen extends StatefulWidget {

  const SetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();

}


class _SetPasswordScreenState extends State<SetPasswordScreen> {


  Map<String,String> FormValues={"email":"", "OTP":"","password":"","cpassword":""};
  bool Loading=false;

  @override
  initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? OTP= await ReadUserData("OTPVerification");
    String? Email= await ReadUserData("EmailVerification");
    InputOnChange("email", Email);
    InputOnChange("OTP", OTP);
  }

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['password']!.isEmpty){
      ErrorToast('Password Required !');
    }
    else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast('Confirm password should be same!');
    }
    else{
      setState(() {Loading=true;});
      bool res=await SetPasswordRequest(FormValues);
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
            child: Loading?(const Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Set Password", style: Head1Text(colorDarkBlue)),
                  const SizedBox(height: 1),
                  Text("Minimum length password 8 character with Latter and number combination ", style: Head7Text(colorLightGray)),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("password",Textvalue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("cpassword",Textvalue);
                    },
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Confirm'),
                    onPressed: (){
                      FormOnSubmit();
                    },
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}