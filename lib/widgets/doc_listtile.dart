import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import '../views/patient view/patient book appointment screen/patient_book_appoint_screen.dart';
Widget docListTile({required String img,required String name,required  String type,}){
  return InkWell(
    onTap: (){
      Get.to(()=> PatientBookAppointScreen(
        img: img,
        name: name,
        type: type,
      ));
    },
    child: Container(
      height: 107,
      width: double.infinity,
      decoration:BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ) ,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(img!,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            20.widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name!.text.fontFamily(semibold).size(16).make(),
                 5.heightBox,
                 type!.text.fontFamily(semibold).size(14).color(Color(0xff04AED3)).make()
              ],
            )
          ],
        ),
      ),
    ),
  );
}