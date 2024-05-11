import 'package:clothesmatch/Pages/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clothesmatch/main.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
                        builder: (context) => ContactPage(item: listing),
                      ),
                    );
                  },
                  child: ListTile(
                      title: Text(listing.name),
                      leading: Icon(Icons.favorite),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          setState(() {
                            appState.favorites.remove(listing);
                          });
                        },
                      )),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
