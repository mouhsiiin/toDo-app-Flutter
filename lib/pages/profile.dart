import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
} 



class _ProfileState extends State<Profile> {

   String username = "Mariwa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
               child:const Image(
                  image: AssetImage('assets/p2.png'),
                  width: 100,
                ),
                onTap: () {
                    
                },
            ),
            Text("username : $username",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            )
            ),

          ],
          
        )
      ),
    );
  }
} 