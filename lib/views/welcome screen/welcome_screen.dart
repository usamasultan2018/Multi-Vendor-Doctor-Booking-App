import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/views/auth%20screen/doc%20auth/doctor_login_screen.dart';
import 'package:mis_hospital/views/auth%20screen/patient%20auth/patient_login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Welcome".text.white.fontFamily(bold).size(23).make(),
                    5.heightBox,
                    "Now it easier for patients who want to consultant with a doctor without having to leave a home"
                        .text
                        .size(16)
                        .white
                        .make(),
                    30.heightBox,
                    "Choose".text.white.fontFamily(bold).size(20).make(),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(patientLogo,),
                            ),
                            5.heightBox,
                            "Patient".text.white.size(18).makeCentered(),
                          ],
                        ).onTap(() {
                          Get.to(()=>PatientLoginScreen());
                        }),
                        20.widthBox,
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(docLogo,),
                            ),
                            5.heightBox,
                            "Doctor".text.white.size(18).makeCentered(),
                          ],
                        ).onTap(() {
                          Get.to(()=>DoctorLoginScreen());
                        }),
                      ],
                    )

                  ],
                ),
              ),
            )),
      ]),
    );
  }
}
