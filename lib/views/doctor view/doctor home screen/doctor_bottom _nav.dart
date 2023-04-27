import 'package:get/get.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/views/doctor%20view/doc%20profile%20screen/doctor_profile_screen.dart';
import 'package:mis_hospital/views/doctor%20view/doctor%20active%20appointments/doctor_active_appointments.dart';
import '../../../../controller/home_controller.dart';
class DoctorBottomNav extends StatefulWidget {
  const DoctorBottomNav({Key? key}) : super(key: key);

  @override
  State<DoctorBottomNav> createState() => _DoctorBottomNavState();
}

class _DoctorBottomNavState extends State<DoctorBottomNav> {
  var controller = Get.put(HomeController());
  var navbarIem = [
    const BottomNavigationBarItem(icon:Icon(Icons.access_time_outlined),label:'Appointment' ),
    const BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile' ),
  ];
  var navBody = [
    DoctorActiveAppointments(),
    DoctorProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Obx(
            ()=>BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        selectedItemColor: blueColor,
        selectedLabelStyle: const TextStyle(
          fontFamily: semibold,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        items: navbarIem,
        onTap: (value){
          controller.currentIndex.value = value;
        },
      ),
      ),
        body: Obx(()=> Column(
          children: [
            Expanded(child: navBody.elementAt(controller.currentIndex.value)),
          ],
        )),
    );
  }
}
