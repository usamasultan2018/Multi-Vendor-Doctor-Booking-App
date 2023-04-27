import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:provider/provider.dart';

import '../../../controller/app_provider.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/reusable_row.dart';
import '../../auth screen/doc auth/doctor_login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      body: mRef != null ? body(context) : Container(child: Center(child: CircularProgressIndicator()),),
    );
  }
  Widget body(BuildContext context) {
    var appPro = Provider.of<AppProvider>(context);
    return Scaffold(
        backgroundColor:Color(0xffE5E5E5),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.heightBox,
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: blueColor,width: 3)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:appPro.image==null?mRef!["img"] ==null?Icon(Icons.person,size: 35,):
                              Image(
                                fit: BoxFit.cover,
                                image:NetworkImage(mRef!["img"]),
                                loadingBuilder: (context,child,loadingProgress){
                                  if(loadingProgress == null) return child;
                                  return Center(child: CircularProgressIndicator());
                                },
                                // errorBuilder:(context,object,stack){
                                //   return Container(
                                //     child: Icon(Icons.error,color: Colors.red,size: 35,),
                                //   );
                                // }
                              ):Image.file(File(appPro.image!.path).absolute
                              )
                            ),
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 14,
                        backgroundColor: blueColor,
                        child: Icon(Icons.add,size: 18,),
                      ).onTap(() {
                        appPro.pickImage(context);
                      })
                    ],
                  ),
                  ReusableRow(
                    title: 'Name',
                    value: mRef!["fullName"],
                    iconData: Icons.person,

                  ),
                  ReusableRow(
                    title: 'Email',
                    value: mRef!["email"],
                    iconData: Icons.email,

                  ),
                  ReusableRow(
                    title: 'Phone Number',
                    value: mRef!["phone"],
                    iconData: Icons.phone,

                  ),
                  ReusableRow(
                    title: 'Address',
                    value: mRef!["address"],
                    iconData: Icons.location_city_outlined,

                  ),
                  ReusableRow(
                    title: 'Specialist',
                    value: mRef!["choseSpecialist"],
                    iconData: Icons.medical_services_rounded,

                  ),
                  10.heightBox,
                  buttonWidgets(
                      color:Colors.red,
                      title: "LogOut",
                      textColor: whiteColor,
                      height: 50.0,
                      width: double.infinity,
                      onPress: (){
                        signOut();
                      }
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
  DocumentSnapshot? mRef;

  void initState() {
    // TODO: implement initState
    super.initState();
    getMyInfo();

    setState(() {
    });
  }
  getMyInfo() async{
    String currentUserId = (await FirebaseAuth.instance.currentUser!).uid;
    print(currentUserId);
    mRef =await FirebaseFirestore.instance
        .collection("All_Doctors")
        .doc(currentUserId)
        .get();
    setState(() {

    });

  }
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.to(()=>DoctorLoginScreen());
    Get.snackbar('Logout',"Succesfully",backgroundColor: Colors.green,colorText: whiteColor);
  }


}
