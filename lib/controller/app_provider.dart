import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mis_hospital/constant/consts.dart';
import 'package:mis_hospital/models/patient_model.dart';
import 'package:mis_hospital/views/doctor%20view/doctor%20home%20screen/doctor_bottom%20_nav.dart';
import 'package:mis_hospital/views/patient%20view/home%20screen/patient%20home%20screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/doctor_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AppProvider extends ChangeNotifier {
  bool visible = false;

  /// text editor for patient page
  PatientModel patientModel = PatientModel();
  final TextEditingController patientFullName = TextEditingController();
  final TextEditingController patientEmail = TextEditingController();
  final TextEditingController patientPass = TextEditingController();
  final TextEditingController patientPhone = TextEditingController();
  final TextEditingController patientAddress = TextEditingController();

  /// text editor for doctor page
  DoctorModel doctorModel = DoctorModel();
  final TextEditingController docFullName = TextEditingController();
  final TextEditingController docEmail = TextEditingController();
  final TextEditingController docPass = TextEditingController();
  final TextEditingController docPhone = TextEditingController();
  final TextEditingController docAddress = TextEditingController();

  final List<String> choseSpecialist = [
    'General practitioners',
    'Surgeon',
    'Dentist',
  ]; //
  String? selectedSpecialist;


  Future<void> patientSignUpMethod() async {
    visible = true;

    patientModel.fullName = patientFullName.text;
    patientModel.email = patientEmail.text;
    patientModel.password = patientPass.text;
    patientModel.phone = patientPhone.text;
    patientModel.address = patientAddress.text;
    patientModel.isAdmin = false;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
      await firebaseAuth.createUserWithEmailAndPassword(
        email: patientEmail.text.trim(),
        password: patientPass.text,
      );
      notifyListeners();

      User? user = userCredential.user;
      if (user != null) {
        patientModel.id = user.uid;

        FirebaseFirestore.instance.collection('All_Patients').doc(user.uid).set(
            {
              "id": user.uid,
              "name": patientModel.fullName,
              "email": patientModel.email,
              "password": patientModel.password,
              "phone": patientModel.phone,
              "address": patientModel.address,
              "isAdmin": patientModel.isAdmin,
              "img": patientModel.img,
            });
        final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        await sharedPreferences.setString('uid', user.uid.toString());
        sharedPreferences.setBool('isAdmin', false);


        Get.to(() => Home());
        Get.snackbar("Sign Up", 'Sign Up Successful',backgroundColor: Colors.green,colorText: whiteColor);
        visible = false;
      }
    } on FirebaseAuthException catch (e) {
      visible = false;
      if (e.code == 'weak-password') {
        Get.snackbar("weak password", 'Enter Strong Password');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Email already use", 'Email Already in Use');
      }
    } catch (e) {
      visible = false;
      Get.snackbar("$e", 'Something went wrong $e');
    }
    notifyListeners();
  }

  Future<void> doctorSignUpMethod() async {
    visible = true;

    visible = true;
    notifyListeners();
    doctorModel.fullName = docFullName.text;
    doctorModel.email = docEmail.text;
    doctorModel.phone = docPhone.text;
    doctorModel.address = docAddress.text;
    doctorModel.password = docPass.text;
    doctorModel.isAdmin = false;
    doctorModel.choseSpecialist = selectedSpecialist!;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
      await firebaseAuth.createUserWithEmailAndPassword(
        email: docEmail.text.trim(),
        password: docPass.text,
      );
      notifyListeners();

      User? user = userCredential.user;
      if (user != null) {
        doctorModel.id = user.uid;

        FirebaseFirestore.instance.collection('All_Doctors').doc(user.uid).set({
          "id": user.uid,
          "fullName": doctorModel.fullName,
          "email": doctorModel.email,
          "password": doctorModel.password,
          "phone": doctorModel.phone,
          "address": doctorModel.address,
          "isAdmin": doctorModel.isAdmin,
          "choseSpecialist": doctorModel.choseSpecialist,
          "img": doctorModel.img,
        });
        final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        await sharedPreferences.setString('uid', user.uid.toString());
        sharedPreferences.setBool('isAdmin', false);

        Get.to(() => DoctorBottomNav());
        Get.snackbar("Sign Up", 'Sign Up Successful',backgroundColor: Colors.green,colorText: whiteColor);
        visible = false;
      }
    } on FirebaseAuthException catch (e) {
      visible = false;
      if (e.code == 'weak-password') {
        Get.snackbar("weak password", 'Enter Strong Password');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Email already use", 'Email Already in Use');
      }
    } catch (e) {
      visible = false;
      Get.snackbar("$e", 'Something went wrong $e');
    }
    notifyListeners();
  }

  Future<void> patientLogin({
    String? emails,
    String? passwords,
  }) async {
    var email = emails!;
    var password = passwords!;

    if (email.isNotEmpty && password.isNotEmpty) {
      visible = true;
      notifyListeners();

      final data1 = FirebaseFirestore.instance.collection('All_Patients');

      data1.get().then((snapshot) async {
        final name = snapshot.docs.map((doc) {
          return doc["email"];
        }).toList();

        UserCredential? userCredential;
        try {
          if (name.contains(email)) {
            FirebaseAuth firebaseAuth = FirebaseAuth.instance;
            UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
                email: email.trim(), password: password);

            User? user = userCredential.user;
            if (user != null) {
              final data = await FirebaseFirestore.instance
                  .collection("All_Patients")
                  .doc(user.uid)
                  .get();

              if (data.exists) {
                // userData = UserModels.fromJson(data.data());
                patientModel = PatientModel.fromJson(data.data());
                // modelData.salloonowner = SaloonOwner.fromjson(data.data());
              }
              final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
              await sharedPreferences.setBool('isAdmin', false);

              await sharedPreferences.setString('uid', user.uid.toString());

              Get.to(() => Home(),);
              visible = false;
              Get.snackbar(
                "Login",
                'Successfully',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              notifyListeners();
            }
          } else {
            visible = false;
            notifyListeners();
            Get.snackbar(
              "Error",
              'Patient user not found',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } on FirebaseAuthException catch (e) {
          visible = false;
          if (e.code == 'user-not-found') {
            visible = false;
            notifyListeners();

            Get.snackbar("user", 'User not found');
          } else if (e.code == 'wrong-password') {
            visible = false;
            notifyListeners();
            Get.snackbar(
                "password", 'wrong password', backgroundColor: Colors.red);
          }
        }
      });
    }
  }


  Future<void> doctorLogin({
    String? emails,
    String? passwords,
  }) async {
    visible = true;
    notifyListeners();
    final data1 = await FirebaseFirestore.instance.collection('All_Doctors');

    data1.get().then((snapshot) async {
      final name = snapshot.docs.map((doc) {
        return doc["email"];
      }).toList();

      UserCredential? userCredential;
      try {
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;

        if (name.contains(emails)) {
          UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: emails!.trim(), password: passwords!);

          User? user = userCredential.user;
          if (user != null) {
            final data = await FirebaseFirestore.instance
                .collection("All_Doctors")
                .doc(user.uid)
                .get();

            if (data.exists) {
              // userData = UserModels.fromJson(data.data());
              // modelData.appuser = AppUser.fromJson(data.data());
              patientModel = PatientModel.fromJson(data.data());
            }
            final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
            await sharedPreferences.setBool('isAdmin', true);

            await sharedPreferences.setString('uid', user.uid.toString());

            Get.offAll(() => const DoctorBottomNav());
            visible = false;
            notifyListeners();
          }
        } else {
          visible = false;
          notifyListeners();
          Get.snackbar(
            "Error",
            'Doctor not found',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } on FirebaseAuthException catch (e) {
        visible = false;
        // progressDialog.dismiss();
        if (e.code == 'user-not-found') {
          visible = false;
          notifyListeners();

          Get.snackbar("user", 'User not found');
        } else if (e.code == 'wrong-password') {
          visible = false;
          notifyListeners();

          Get.snackbar("password", 'wrong password', colorText: whiteColor,
              backgroundColor: Colors.red);
        }
      }
    });

    notifyListeners();
  }


  final picker  = ImagePicker();
  XFile? _image;
  XFile? get image => _image;

  Future pickGalleryImage ( context)async{
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
    if(pickedFile!=null){
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }

  }
  Future pickCameraImage ( context)async{
    final pickedFile =
    await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    if(pickedFile!=null){
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }

  }


  void pickImage(context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Container(
              height: 120,
              child: Column(
                children:  [
                  ListTile(
                    onTap: (){
                      pickCameraImage(context);
                      Get.back();
                    },
                    leading: Icon(Icons.camera,color: blueColor,),
                    title: Text('Camera'),
                  ),
                  ListTile(
                    onTap: (){
                      pickGalleryImage(context);
                    },
                    leading: Icon(Icons.image,color: blueColor,),
                    title: Text('Gallery'),
                  )
                ],
              ),
            ),
          );
        }

    );
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;
  void uploadImage (BuildContext context) async{

    String currentUserId =  await FirebaseAuth.instance.currentUser!.uid;
    print(currentUserId);
    firebase_storage.Reference  storageRef = firebase_storage.FirebaseStorage.instance.ref().child('/img'+currentUserId);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();
    CollectionReference imagesCollection = _firestore.collection('img');
        await imagesCollection.add({
          'img': newUrl.toString(),
        }).then((value) =>
        Get.snackbar('Profile', 'Updated')
        ).onError((error, stackTrace) =>
            Get.snackbar('Error', '...')
        );

  }

}