import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileService {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<String?> getUsername() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid) // Use the UID of the current user
          .get();

      if (userDoc.exists) {
        return userDoc['UserName'];
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error getting username: $e');
      return null;
    }
  }
}
