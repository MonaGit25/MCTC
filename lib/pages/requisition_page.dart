import 'package:flutter/material.dart';

import '../utilities/requisite_state.dart';

class RequisitionPage extends StatelessWidget {
  final VoidCallback goToShopTab;

  const RequisitionPage({
    super.key,
    required this.goToShopTab,
  });

// class RequisitionPage extends StatefulWidget {
//   const RequisitionPage({super.key});
//
//   @override
//   State<RequisitionPage> createState() => _RequisitionPageState();
// }
//
  final List _requistate = const[
    'state1',
    'state2',
    'state3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF3F2F6FF),

      appBar: AppBar(
        title: const Text("Requisitions"),
        backgroundColor: const Color(0xF3F2F6FF),
        leading: Builder(builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset('lib/images/MCTC-logo.png', scale: 1.5,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white,),
                    title: Text("About", style: TextStyle(color: Colors.white),),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    leading: Icon(Icons.question_mark, color: Colors.white,),
                    title: Text("How to use", style: TextStyle(color: Colors.white),),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    leading: Icon(Icons.support, color: Colors.white,),
                    title: Text("Support", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 12),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text("Logout", style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),

      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),

                child: GestureDetector(
                  onTap: goToShopTab,
                  child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFDE7311),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.only(
                          left: 75.0,
                          top: 10.0,
                          right: 75.0,
                          bottom: 10.0,
                        ),
                        child: const Text(
                          "+ Create New Requisition",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                ),
                ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _requistate.length,
                itemBuilder: (context, index){
                  return MyState(
                  child: _requistate[index],
                  );
                }
              )
          ),
        ],
      ),
    );
  }
}
