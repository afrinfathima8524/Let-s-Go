import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_go/features/home/ui/home.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://wallpapers.com/images/hd/travel-hd-axhrsecphqby11wk.jpg",
                fit: BoxFit.cover,
                height: constraints.maxHeight * 0.6,
                width: constraints.maxWidth * 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Life Is Short And The",
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " World Is ",
                              style: GoogleFonts.poppins(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Wide",
                              style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange.shade700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Traveling unlocks new worlds, cultures, and insights, enriching our lives with unforgettable experiences and memories.",
                      style:
                          GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            )),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.blue.shade300,
                          ),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Get Started",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
