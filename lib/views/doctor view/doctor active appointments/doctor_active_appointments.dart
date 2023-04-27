import 'package:mis_hospital/constant/consts.dart';
class DoctorActiveAppointments extends StatelessWidget {
  const DoctorActiveAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'My Appointments'.text.fontFamily(bold).size(22).make(),
              20.heightBox,
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(doc1),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      20.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Appointment Date:'.text.fontFamily(bold).size(20).make(),
                          10.heightBox,
                          '2023-04-20'.text.fontFamily(semibold).size(17).make(),

                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );;
  }
}
