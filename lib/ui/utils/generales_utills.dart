import 'package:flutter/material.dart';

Future<DateTime> pickDate(BuildContext context,DateTime pickedDate,DateTime firstDate,DateTime lastDate) async{
  DateTime? date=await showDatePicker(
    context: context, 
    initialDate: pickedDate, 
    firstDate: firstDate,
    lastDate: lastDate,
    confirmText: "Ok",
    cancelText: "Cancelar",
  ); 
  
  return date!;
}
Future<TimeOfDay> pickTime(context,TimeOfDay? time) async{
    TimeOfDay? date=await showTimePicker(
      context: context,
      initialTime: time!,
      cancelText: "Cancelar"
      confirmText: "Ok",
    );
    return date!;
  }