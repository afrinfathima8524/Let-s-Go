import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),

          Row(
            children: [
              Column(children: [
                Text("Mathan Kumar",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.bold)),
                Text("Chennai",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.bold,color:Colors.grey)),
              ],),

              ClipRRect(
                
                borderRadius: BorderRadius.circular(50),
                child: Image.network(""),
              )
            ],
          )
        ],
      )
    );
  }
}