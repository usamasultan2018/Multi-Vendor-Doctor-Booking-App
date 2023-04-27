import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/views/patient%20view/patient%20book%20appointment%20screen/patient_book_now_screen.dart';

import '../../../widgets/button_widget.dart';


class PatientBookAppointScreen extends StatelessWidget {
  final String? img,name,type;

  const PatientBookAppointScreen({Key? key, this.img, this.name, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buttonWidgets(
          color: Color(0xff04AED3),
          textColor: whiteColor,
          width: double.infinity,
          height: 50.0,
          title: 'Book Appointment',
          onPress: (){
            print('suucces');
            Get.to(()=>PatientBookNowScreen());
          }
        ),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              10.heightBox,
              Center(
                child: Container(
                  height: 126,
                  width: 126,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:  DecorationImage(
                      image: AssetImage(img!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              10.heightBox,
              name!.text.fontFamily(bold).size(20).makeCentered(),
              type!
                  .text
                  .fontFamily(bold)
                  .color(Color(0xff04AED3))
                  .size(20)
                  .makeCentered(),
              40.heightBox,
              'Overview'.text.bold.size(22).make(),
              5.heightBox,
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut purus sed cursus ultrices platea. Vitae tempus justo, aliquam ipsum velit tincidunt bibendum mattis. Sollicitudin auctor tristique gravida viverra sed leo urna.'
                  .text
                  .size(18)
                  .color(Color(0xff838383))
                  .fontFamily(semibold)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
