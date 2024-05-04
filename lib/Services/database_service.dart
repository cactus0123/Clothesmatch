import 'package:clothesmatch/Model/listing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String listingCollection = 'Listings';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _listingsRef;

  DatabaseService() {
    _listingsRef = _firestore
        .collection(listingCollection)
        .withConverter<Listing>(
            fromFirestore: (snapshot, _) => Listing.fromJson(snapshot.data()!),
            toFirestore: (listing, _) => listing.toJson());
  }

  Future<List<Listing>> getAllListings() async {
    final snapshot = await _listingsRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList().cast<Listing>();
  }

  Stream<QuerySnapshot> getListings() {
    return _listingsRef.snapshots();
  }

  Future<void> addListing(Listing listing) async {
    await _listingsRef.add(listing);
  }

  void updateListing(String id, Listing listing) {
    _listingsRef.doc(id).set(listing);
  }
}
