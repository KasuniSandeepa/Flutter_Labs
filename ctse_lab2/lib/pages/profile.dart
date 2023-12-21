import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/flower.jpg",
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 40,
          ),
          Text("Kasuni Kuruppuarachchi",
              style: GoogleFonts.iceberg(fontSize: 30)),
          const Text(
            "Undergraduate Student",
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.red, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook_rounded),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.email),
            ],
          )
        ],
      ),
    );
  }
}
