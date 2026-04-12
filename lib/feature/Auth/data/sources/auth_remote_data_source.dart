import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async{
    try{
      if (kIsWeb) {
        final provider = GoogleAuthProvider();
        return await _firebaseAuth.signInWithPopup(provider);
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      return await _firebaseAuth.signInWithCredential(credential);
    }on FirebaseAuthException catch (e) {
    final code = e.code.toLowerCase();        
    if (code.contains('closed') || 
        code.contains('cancel') || 
        code.contains('abort')) {
      return null; 
    }
    rethrow; 
  } catch (e) {
    final err = e.toString().toLowerCase();
    if (err.contains('cancel') || err.contains('closed')) {
      return null;
    }
    rethrow;
  }
  }

  Future <User?> singnUp(String name , String email, String password) async{
    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      return _firebaseAuth.currentUser;
    }
    on FirebaseAuthException catch(e){
      throw Exception('Sign up failed [${e.code}]: [${e.message}]');
    }   
  }


  Future <User?> login(String email, String password) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );    
      return _firebaseAuth.currentUser;
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

