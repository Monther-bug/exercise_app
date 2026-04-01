import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future <User?> singnUp(String name , String email, String password) async{
    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      credential.user?.updateDisplayName(name);
      credential.user?.reload();
      return credential.user;
    }
    on FirebaseAuthException catch(e){
      throw Exception('Sign up failed [${e.code}]: [${e.message}]');
    }   
  }


  Future <User?> login(String email, String password) async{
    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );    
      return credential.user;
    }
    on FirebaseAuthException catch(e){
      throw Exception('login failed [${e.code}]: [${e.message}]');
    }   
  }

  Future <void> logout() async{
    await _firebaseAuth.signOut();
  }

  User? getCurrentUSer(){
    return _firebaseAuth.currentUser;
  }
}

