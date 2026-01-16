import 'package:flutter/material.dart';

import 'homepage.dart';



class IntroPage extends StatelessWidget {
  const IntroPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
              backgroundColor: Color(0xFF060606),
              flexibleSpace: SafeArea(
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0,top: 30.0,right: 0.0,bottom: 0.0),
                    child:Image.asset('lib/images/MCTC-logo.png',height: 90, fit: BoxFit.contain,
              )
                ),
            ),

        ),
      ),
      backgroundColor: Color(0xFFF3F2F6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
              Image.asset('lib/images/boat.png', height:150,),

            const SizedBox(height: 40,),

            //title
            Text("SUPPLY CHAIN",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 44),
            ),

            //subtitle
            Text("Smart Provisioning for Life at Sea",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 40,),

            //start button
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Login"),
                      content: const Text("Please login to continue."),
                      actions: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                          ),
                        ),
                        const SizedBox(width: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) => homePage(),
                                            ),
                                       );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFDE7311),
                                foregroundColor: Colors.white,),
                              child: const Text("Continue"),
                            ),
                            ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDE7311),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.only(
                  left: 100.0,
                  top: 10.0,
                  right: 100.0,
                  bottom: 10.0,
                ),
                child: const Text(
                  "Explore Now",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),


        ],
      ),
    ),
    );
  }
}
