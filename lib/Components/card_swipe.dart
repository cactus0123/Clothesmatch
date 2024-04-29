import 'package:clothesmatch/Components/big_card.dart';
import 'package:clothesmatch/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:clothesmatch/Services/database_service.dart';

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
  late List listings;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: 2,
                onSwipe: _onSwipe,
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
                  return BigCard(pair: appState.current);
                },
              ),
            ),
          ],
        ),
      ),
    );
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
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
