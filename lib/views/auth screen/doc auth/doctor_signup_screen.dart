import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/controller/app_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_textfield.dart';
class DoctorSignupScreen extends StatefulWidget {
  const DoctorSignupScreen({Key? key}) : super(key: key);

  @override
  State<DoctorSignupScreen> createState() => _DoctorSignupScreenState();
}

class _DoctorSignupScreenState extends State<DoctorSignupScreen> {
  String dropValue = "Dentist";
  String _selectedGender = 'male';
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
                          registerDoc.text.white.fontFamily(bold).size(25).makeCentered(),
                          20.heightBox,
                          customTextField(
                            validator: (value) {
                              return !(value!.isNotEmpty)
                                  ? "Please enter full name"
                                  : null;
                            },
                            controller: appPro.docFullName,
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
                            controller: appPro.docEmail,
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
                            controller: appPro.docPass,
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
                            controller: appPro.docPhone,
                            title: phoneNum,
                            hint: phoneHint,
                          ),
                          customTextField(
                            validator: (value) {
                              return !(value!.isNotEmpty)
                                  ? "Please enter address"
                                  : null;
                            },
                            controller: appPro.docAddress,
                            title: address,
                            hint: addressHint,
                          ),
                          choseSpecialist.text.color(whiteColor).fontFamily(semibold).size(16).make(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: blueColor)),
                            child: DropdownButton(
                              hint: Row(
                                children: const [
                                  Text(
                                    'Choose Specialist',
                                    style: TextStyle(color: textfieldGrey),
                                  ),
                                ],
                              ),
                              //
                              isExpanded: true,
                              value: appPro.selectedSpecialist,

                              underline: Container(),

                              items: appPro.choseSpecialist.map((item) {
                                return DropdownMenuItem<String>(
                                    value: item,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          item,
                                          style: const TextStyle(color: darkFontGrey),
                                        ),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  appPro.selectedSpecialist = newValue.toString();
                                });
                              },
                            ),
                          ),
                          10.heightBox,
                          buttonWidgets(
                            click: appPro.visible,
                            height: 60.0,
                            width: double.infinity,
                            title: signup,
                            textColor: whiteColor,
                            color: green,
                            onPress: ()async{
                              if (
                              appPro.docFullName.text.isEmpty ||
                                  appPro.docEmail.text.isEmpty  ||
                                  appPro.docPass.text.isEmpty  ||
                                  appPro.docPhone.text.isEmpty ||
                                  appPro.docAddress.text.isEmpty||
                                  appPro.selectedSpecialist == null
                              ){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Please fill all the fields")));
                              } else {
                                await appPro.doctorSignUpMethod();
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
    );
  }
}
