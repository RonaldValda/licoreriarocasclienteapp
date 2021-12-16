import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/ui/utils/generales_utills.dart';
import 'package:licoreriarocasclienteapp/ui/widgets/text_fields.dart';
Future<String> dialogFechaNacimiento(
  BuildContext context,
)async{
  TextEditingController controllerFechaNacimiento=TextEditingController(text: "");
  DateTime pickedDate=DateTime(DateTime.now().year-18);
  String fechaNacimiento="";
 return await showDialog(
    barrierLabel: "",
    barrierDismissible: true,
    context: context,
    useRootNavigator: true,
    builder: (BuildContext ctx){
      return StatefulBuilder(
        builder: (BuildContext ctx,StateSetter setState){
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.all(5),
            titlePadding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
            title: Center(child: 
              Column(
                children: [
                  Text("Fecha de nacimiento",style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            children: [
              Container(
                padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 0),
                child: Column(
                  children: [
                    TextFFOnTap(
                      controller: controllerFechaNacimiento, 
                      label: "Fecha de nacimiento", 
                      onTap: ()async{
                        DateTime firstDate= DateTime(DateTime.now().year-100);
                        DateTime lastDate= DateTime(DateTime.now().year-15);
                        await pickDate(context,pickedDate,firstDate,lastDate);
                        setState(() {
                          controllerFechaNacimiento.text="${pickedDate.day.toString().padLeft(2,'0')}-${pickedDate.month.toString().padLeft(2,'0')}-${pickedDate.year.toString()}";
                          fechaNacimiento=controllerFechaNacimiento.text;
                        });
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Container(
                padding:EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  )
                ),
                child: MaterialButton(
                  child: Text("Aceptar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context,fechaNacimiento);
                  }
                ),
              )
            ],
          );
        }
      );
    }
  ); 
}