import 'package:flutter/material.dart';

class myelevatedbutton extends StatelessWidget {
  const myelevatedbutton({super.key, required this.btntext, required this.onPressed,this.loading=false});
  final String btntext;
  final VoidCallback onPressed;
  final loading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 0.0,horizontal: 16.0),
      width: double.infinity,
      child: ElevatedButton(style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.blueAccent, // Change as needed
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),onPressed: onPressed
      ,
          child: loading
              ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              //color: Colors.white,
            ),
          )
              : Text(btntext),),
    );
  }
}
