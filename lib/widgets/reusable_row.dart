import 'package:mis_hospital/constant/consts.dart';
class ReusableRow extends StatelessWidget {
  final String title,value;
  final IconData iconData;
  const ReusableRow({Key? key, required this.title, required this.value, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData,color: blueColor,),
          title: title.text.fontFamily(semibold).size(17).make(),
          trailing: value.text.fontFamily(semibold).size(17).make(),
        ),
        2.heightBox,
        Divider(color: Colors.blueAccent,),
      ],
    );
  }
}
