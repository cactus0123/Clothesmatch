import 'package:clothesmatch/Model/listing.dart';
import 'package:clothesmatch/Services/database_service.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class BigCard extends StatelessWidget {
  BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Center(
      child: Card(
        color: theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/new-afg.appspot.com/o/red_shirt.jpg?alt=media&token=d38da817-0f1a-4a58-994d-91db409520e2'),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.6),
            Expanded(
              child: StreamBuilder(
                  stream: databaseService.getListings(),
                  builder: (context, snapshot) {
                    List listings = snapshot.data?.docs ?? [];
                    if (listings.isEmpty) {
                      return Text('No listings found');
                    }
                    return ListView.builder(
                      itemCount: listings.length,
                      itemBuilder: (context, index) {
                        Listing listing = listings[index].data();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(listing.name,
                              style: style.merge(GoogleFonts.josefinSans())),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
