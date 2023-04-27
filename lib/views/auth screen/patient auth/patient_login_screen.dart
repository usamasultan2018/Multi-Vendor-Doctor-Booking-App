import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/views/auth%20screen/patient%20auth/patient_signup_screen.dart';
import 'package:mis_hospital/widgets/button_widget.dart';
import 'package:mis_hospital/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../controller/app_provider.dart';
import '../../patient view/home screen/patient home screen/home.dart';
class PatientLoginScreen extends StatelessWidget {
  const PatientLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final appPro  =  Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
              color: whiteColor,
              child: Image.asset(
                appLogo,
                height: 200,
                width: 400,
              )),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 480,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: blueColor,
                        spreadRadius: 3,
                        offset: Offset(1, 4),
                        blurRadius: 9)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: blueColor),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child:Column(
                  children: [
                    login.text.white.fontFamily(bold).size(25).makeCentered(),
                    20.heightBox,
                    customTextField(
                      controller: emailController,
                      title: email,
                      hint: emailHint,
                    ),
                    10.heightBox,
                    customTextField(
                      controller: passController,
                      title: password,
                      hint: passwordHint,
                    ),
                    5.heightBox,
                   Align(
                     alignment: Alignment.centerRight,
                     child: TextButton(onPressed: (){},
                         child: Text('Forgot password',style: TextStyle(color: whiteColor),)),
                   ),
                    10.heightBox,
                    buttonWidgets(
                      click: appPro.visible,
                      height: 60.0,
                      width: double.infinity,
                      title: login,
                      textColor: darkFontGrey,
                      color: whiteColor,
                      onPress: ()async {
                        if (emailController.text.isEmpty ||
                            passController.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                "Please fill all the fields"),
                          ));
                        } else {
                          await appPro.patientLogin(
                            emails: emailController.text,
                            passwords: passController.text,
                          );
                          print('Login Succesfully');
                        }
                      },
                    ),
                    Spacer(),
                    "Or".text.white.size(17).bold.makeCentered(),
                    5.heightBox,
                    "Register a new account".text.white.size(17).underline.bold.makeCentered().onTap(() {
                      Get.to(()=>PatientSignupScreen());
                    }),



                  ],
                )
              ),
            )),
      ]),
    );
  }
}
