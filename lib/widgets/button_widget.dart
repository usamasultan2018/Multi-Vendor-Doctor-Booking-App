import 'package:mis_hospital/constant/consts.dart';
Widget buttonWidgets({onPress,color,textColor,width ,height,String? title, bool click=false}){
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: click!?CircularProgressIndicator():Text(title!,style: TextStyle(fontFamily: bold,color: textColor),)),
    ),
  );
}