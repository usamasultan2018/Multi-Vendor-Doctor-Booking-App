import 'package:get/get.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/views/patient%20view/home%20screen/patient%20home%20screen/patient_home_screen.dart';
import '../../../../controller/home_controller.dart';
import '../../patient active appointment screen/patient_active_appoint_screen.dart';
import '../../patient profile screen/patient_profile_screen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());
  var navbarIem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home" ),
    const BottomNavigationBarItem(icon:Icon(Icons.access_time_outlined),label:'Appointment' ),
    const BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile' ),
  ];
  var navBody = [
    const PatientHomeScreen(),
    const PatientAppointmentScreen(),
    const PatientProfileScreen(),
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
