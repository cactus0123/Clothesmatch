import 'package:clothesmatch/Pages/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 152, 89, 220),
          title: Center(
            child: Text(
              'My Profile',
              style: GoogleFonts.josefinSans(
                  textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 152, 89, 220),
                      Color.fromARGB(255, 185, 155, 231)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://assets-global.website-files.com/6586ad1766809383c71cd41e/65890a233344f1816429ec35_National-Flower-Day.jpeg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'John Doe',
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 20,
                        )),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '@johnnydoe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ]))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Placeholder();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UploadPage()));
          },
          backgroundColor: Colors.purple,
          child: Icon(Icons.add),
        ));
  }
}
