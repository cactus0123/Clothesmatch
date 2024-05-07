import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clothesmatch/main.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border,
                color:
                    Color.fromARGB(255, 72, 15, 163)), // Heart icon in purple
            SizedBox(width: 8), // Add some spacing
            Text(
              'Matched',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Color.fromARGB(
                      255, 72, 15, 163), // Static text "Matched" in purple
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: appState.favorites
            .map(
              (listing) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactPage(item: listing.name),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(listing.name),
                    leading: Icon(Icons.favorite),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  final String item;

  ContactPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.josefinSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 92, 59, 170),
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.only(left: 60.0, right: 60.0),
            alignment: Alignment.center,
            height: 370,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Image(
                    image: NetworkImage(
                        'https://assets-global.website-files.com/6586ad1766809383c71cd41e/65890a233344f1816429ec35_National-Flower-Day.jpeg'),
                    height: 270,
                    width: 400,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item,
                  style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 30,
                  )),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 198, 185, 230),
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.only(left: 60.0, right: 60.0, top: 30.0),
            alignment: Alignment.center,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                ),
                SizedBox(height: 8),
                Text(
                  item,
                  style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 30,
                  )),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 198, 185, 230),
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.only(
                left: 60.0, right: 60.0, top: 30.0, bottom: 30.0),
            alignment: Alignment.center,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                ),
                SizedBox(height: 8),
                Text(
                  item,
                  style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 30,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
