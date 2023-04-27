import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mis_hospital/constant/consts.dart';

import '../../../widgets/button_widget.dart';
import '../../sucees or fail screen/success_screen.dart';
class PatientBookNowScreen extends StatefulWidget {
  const PatientBookNowScreen({Key? key}) : super(key: key);

  @override
  State<PatientBookNowScreen> createState() => _PatientBookNowScreenState();
}

class _PatientBookNowScreenState extends State<PatientBookNowScreen> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  String? _selectedTime;

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color(0xffE5E5E5),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: buttonWidgets(
            color: green,
            textColor: whiteColor,
            width: double.infinity,
            height: 50.0,
            title: 'Book Now',
            onPress: (){
              Get.to(()=>SuccessScreen());
            }
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             'Select Appointment Date '.text.size(22).fontFamily(bold).make(),
        Container(
          height: MediaQuery.of(context).size.width / 3,
          child: Center(
              child: TextField(
                controller: dateInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate);
                    //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ))),
    Text(
    _selectedTime != null ? _selectedTime! : 'No time selected!',
    style: const TextStyle(fontSize: 20),
    ),
    ElevatedButton(
    onPressed: _show, child: const Text('Select Time'),
    ),

           ],
        ),
      ),
    );
  }
}
