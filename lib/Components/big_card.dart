import 'package:clothesmatch/Model/listing.dart';
import 'package:clothesmatch/Services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigCard extends StatelessWidget {
  BigCard({
    super.key,
    required this.listing,
  });

  final Listing listing;
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
                image: NetworkImage(listing.image),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.6),
            Text(listing.name, style: style.merge(GoogleFonts.josefinSans()))
          ],
        ),
      ),
    );
  }
}
