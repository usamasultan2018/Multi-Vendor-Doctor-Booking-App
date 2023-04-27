import 'package:mis_hospital/constant/consts.dart';

import '../../../../widgets/doc_listtile.dart';
class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                docList.text.size(22).fontFamily(bold).make(),
                20.heightBox,
               docListTile(
                 img: doc1,
                 name: 'Dr. Rumana Hauqe',
                 type: 'Cardiologist',
               ),
               10.heightBox,
               docListTile(
                 img: doc1,
                 name: 'Dr. Rumana Hauqe',
                 type: 'Cardiologist',
               ),
               10.heightBox,
               docListTile(
                 img: doc1,
                 name: 'Dr. Rumana Hauqe',
                 type: 'Cardiologist',
               ),
               10.heightBox,
               docListTile(
                 img: doc1,
                 name: 'Dr. Rumana Hauqe',
                 type: 'Cardiologist',
               ),
               10.heightBox,
               docListTile(
                 img: doc1,
                 name: 'Dr. Rumana Hauqe',
                 type: 'Cardiologist',
               ),

             ],
           ),
         ),
       ),
     ),
    );
  }
}
