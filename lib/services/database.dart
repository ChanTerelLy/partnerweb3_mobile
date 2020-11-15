import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partnerweb3_mobile/model/user.dart';

class DatabaseService {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final String operator;

  DatabaseService({this.operator});

  Future<void> createOrUpdateUser(String operator, String password, int account_type) async {
    return await userCollection.doc(operator).set(
        {
          'operator': operator,
          'password': password,
          'account_type': account_type,
        }
    );
  }

  // user data from snapshots
  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
        operator: snapshot.get('operator'),
        password: snapshot.get('password'),
        account_type: snapshot.get('account_type'),
    );
  }

  Stream<User> get userData {
    return userCollection.doc(operator).snapshots().map(_userDataFromSnapshot);
  }

}