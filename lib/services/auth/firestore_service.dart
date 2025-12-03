import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/anime.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference _userCollection() {
    return _firestore.collection('users');
  }

// get favorite stream
  Stream<List<Anime>> getFavouriteStream(String userId) {
    return _userCollection()
    .doc(userId)
    .collection('favourites')
    .snapshots()
    .map((snapshot){
      return snapshot.docs.map((doc) {
        return Anime.fromFavoritesJson(doc.data());
      }).toList();
    });
  }

// add favorite
  Future<void> addFavourite(String userId, Anime anime) async {
    return _userCollection()
        .doc(userId)
        .collection('favourites')
        .doc(anime.malId.toString())
        .set(anime.toJson());
  }

  // remove favorite
  Future<void> removeFavourite(String userId, int malId) async {
    return _userCollection()
        .doc(userId)
        .collection('favourites')
        .doc(malId.toString())
        .delete();
  }
}
