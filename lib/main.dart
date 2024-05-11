import 'package:clothesmatch/Pages/home_page.dart';
import 'package:clothesmatch/Pages/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clothesmatch/Pages/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Model/listing.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: "Clothesmatch",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 156, 142, 219)),
          primarySwatch: Colors.purple,
        ),
        home: LandingPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  void getNext() {
    notifyListeners();
  }

  List<Listing> favorites = [];
  void togglefavorite(Listing listing) {
    if (!(favorites.contains(listing))) {
      print(favorites);
      favorites.add(listing);
    }
    notifyListeners();
  }

  void swipedRight() {
    getNext();
  }

  Scaffold centerPage(Widget element) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        element,
      ])),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var navindex = 0;
  final _pages = [MyHomePage(), FavoritesPage(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clothesmatch',
          style: GoogleFonts.josefinSans(
              textStyle: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 48,
          )),
        ),
      ),
      body: _pages.elementAt(navindex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
        currentIndex: navindex,
        onTap: (index) {
          setState(() {
            navindex = index;
          });
        },
      ),
    );
  }
}
