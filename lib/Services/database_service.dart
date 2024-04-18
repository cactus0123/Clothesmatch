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

  Stream<QuerySnapshot> getListings() {
    return _listingsRef.snapshots();
  }

  Future<void> addListing(Listing listing) async {
    await _listingsRef.add(listing);
  }
}