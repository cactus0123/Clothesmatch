import 'package:clothesmatch/Components/big_card.dart';
import 'package:clothesmatch/Model/listing.dart';
import 'package:clothesmatch/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:clothesmatch/Services/database_service.dart';
import 'package:provider/provider.dart';

class CardSwipe extends StatefulWidget {
  final Function() onSwipeRight;
  final Function() onSwipeLeft;
  CardSwipe({
    Key? key,
    required this.onSwipeRight,
    required this.onSwipeLeft,
  }) : super(key: key);

  @override
  State<CardSwipe> createState() => _CardSwipeState();
}

class _CardSwipeState extends State<CardSwipe> {
  final CardSwiperController controller = CardSwiperController();
  final DatabaseService databaseService = DatabaseService();
  List<Listing>? listings;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadListings();
  }

  void loadListings() async {
    List<Listing> docs = await databaseService.getAllListings();
    setState(() {
      listings = docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listings == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: CardSwiper(
                  controller: controller,
                  cardsCount: listings!.length,
                  onSwipe: (previousIndex, currentIndex, direction) {
                    _onSwipe(previousIndex, currentIndex, direction);
                    if (direction == CardSwiperDirection.right) {
                      addListing(listings![previousIndex]);
                    }
                    return true;
                  },
                  onUndo: _onUndo,
                  numberOfCardsDisplayed: 2,
                  backCardOffset: const Offset(40, 40),
                  padding: const EdgeInsets.all(24.0),
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) {
                    Listing listing = listings![index];
                    return BigCard(
                      listing: listing,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void addListing(Listing listing) {
    var appState = context.read<MyAppState>();
    appState.togglefavorite(listing);
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (direction == CardSwiperDirection.right) {
      widget.onSwipeRight();
      debugPrint(
        'The card $currentIndex was swiped to the ${direction.name}',
      );
    } else {
      widget.onSwipeLeft();
      debugPrint(
        'The card $currentIndex was swiped to the ${direction.name}',
      );
    }
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undid from the ${direction.name}',
    );
    return true;
  }
}
