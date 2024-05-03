import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/profile/data/profile_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
           
           children: [
             
                const CircleAvatar(
                radius: 55,
               //backgroundColor: Colors.black,
               backgroundImage:NetworkImage("https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3407.jpg",),),
          
              Text("Mathan Kumar",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.bold)),
              Text("Chennai",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.bold,color:Colors.blue)),
                      
            const SizedBox(height: 10,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
               
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(child: Column(
                        children: [
                           Text("Reward Points",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.bold,)),
                            Text("422",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.bold,color:Colors.blue)),
                        ],
                      ),),
                      
                      Expanded(child: Column(
                        children: [
                           Text("Travel Trips",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.bold,)),
                            Text("242",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.bold,color:Colors.blue)),
                        ],
                      ),),
                  
                      Expanded(child: Column(
                        children: [
                           Text("Bucket Lists",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.bold,)),
                            Text("602",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.bold,color:Colors.blue)),
                        ],
                      ),),
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 310,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: profileItems.length,
                  itemBuilder: (context, index) {
              
                    final item = profileItems[index];
                  
                  return Column(
                    children: [
                      ListTile(
                          leading:  Icon(item.icon),
                          title: Text(item.itemName,style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.bold,color:Colors.black)),
                          trailing: const Icon(Icons.arrow_forward_ios,),
                        ),
                       item.itemName != "Version"?
                        Divider():Container(),
                      
                        
                    ],
                  );
                },)
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}