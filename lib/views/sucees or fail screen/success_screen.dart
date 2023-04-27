import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';

import '../patient view/home screen/patient home screen/patient_home_screen.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onDoubleTap: (){
          Get.to(()=>PatientHomeScreen());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(success,height: 100,width: 100,)),
            10.heightBox,
            'Appointment book successfully'.text.size(15).fontFamily(semibold).makeCentered()
          ],
        ),
      ),
    );
  }
}
