import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/controller/app_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_textfield.dart';
class PatientSignupScreen extends StatefulWidget {
  const PatientSignupScreen({Key? key}) : super(key: key);

  @override
  State<PatientSignupScreen> createState() => _PatientSignupScreenState();
}

class _PatientSignupScreenState extends State<PatientSignupScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final appPro = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: blueColor,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(25),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start
              ,
              children: [
                20.heightBox,
                patientRegister.text.white.fontFamily(bold).size(25).makeCentered(),
                20.heightBox,
                customTextField(
                  validator: (value) {
                    return !(value!.isNotEmpty)
                        ? "Please enter full name"
                        : null;
                  },
                  controller: appPro.patientFullName,
                  title: fullName,
                  hint: Fname,
                ),
                10.heightBox,
                customTextField(
                  validator: (value){
                    EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email";
                  },
                  controller: appPro.patientEmail,
                  title: email,
                  hint: emailHint,
                ),
                10.heightBox,
                customTextField(
                  validator: (value) {
                    return !(value!.length > 5)
                        ? 'Password should be 6 digits long'
                        : null;
                  },
                  controller: appPro.patientPass,
                  title: password,
                  hint: passwordHint,
                ),
                10.heightBox,
                customTextField(
                  validator:  (value) {
                    return !(value!.length > 10 && value.length < 12)
                        ? 'Phone number should be 11 digits long'
                        : null;
                  },
                  controller: appPro.patientPhone,
                  title: phoneNum,
                  hint: phoneHint,
                ),
                customTextField(
                  validator: (value) {
                    return !(value!.isNotEmpty)
                        ? "Please enter address"
                        : null;
                  },
                  controller: appPro.patientAddress,
                  title: address,
                  hint: addressHint,
                ),
                10.heightBox,
                buttonWidgets(
                  click: appPro.visible,
                  height: 60.0,
                  width: double.infinity,
                  title: signup,
                  textColor: whiteColor,
                  color: green,
                  onPress: () async{
                    if (
                        appPro.patientFullName.text.isEmpty ||
                        appPro.patientAddress.text.isEmpty  ||
                        appPro.patientEmail.text.isEmpty  ||
                        appPro.patientPhone.text.isEmpty ||
                        appPro.patientPass.text.isEmpty ){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  "Please fill all the fields")));
                    } else {
                      await appPro.patientSignUpMethod();
                      log("hii");
                    }
                  },
                ),
                10.heightBox,
                alreadyHaveAcc.text.white.underline.size(16).makeCentered().onTap(() {
                  Get.back();
                }),


              ],
            )
        ),
      ),
    );;
  }
}
