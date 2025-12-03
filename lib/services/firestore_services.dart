import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes_1/models/anime.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference _userCollection() {
    return _firestore.collection('user');
  }

  Stream<List<Anime>> getFavoritesStream(String userId) {
    return _userCollection()
      .doc(userId)
      .collection('favorites')
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          return Anime.fromFavoritesJson(doc.data());
        }). toList();
      });
  }

  Future<void> addFavorite(String userId, Anime anime)async {
    await _userCollection()
      .doc(userId)
      .collection('favorites')
      .doc(anime.malId.toString())
      .set(anime.toJson());
  }

   Future<void> removieFavorite(String userId, int animeId)async {
    await _userCollection()
      .doc(userId)
      .collection('favorites')
      .doc(animeId.toString())
      .delete();
  }
}