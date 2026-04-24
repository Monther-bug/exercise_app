import 'package:flutter/foundation.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/di/injection_container.dart';

class AuthRemoteDataSource {  
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async{
    try{
      if (kIsWeb) {
        final provider = GoogleAuthProvider();
        //return await locator<FirebaseAuth>().signInWithPopup(provider);
        return await locator<FirebaseAuth>().signInWithPopup(provider);
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      return await locator<FirebaseAuth>().signInWithCredential(credential);
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
      final credential = await locator<FirebaseAuth>().createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      return locator<FirebaseAuth>().currentUser;
    }
    on FirebaseAuthException catch(e){
      throw Exception('${AppMessageKey.signUpFailed} [${e.code}]: [${e.message}]');
    }   
  }


  Future <User?> login(String email, String password) async{
    try{
      await locator<FirebaseAuth>().signInWithEmailAndPassword(
        email: email, 
        password: password
      );    
      return locator<FirebaseAuth>().currentUser;
    }
    on FirebaseAuthException catch(e){
      throw Exception('${AppMessageKey.loginFailed} [${e.code}]: [${e.message}]');
    }   
  }

  Future <void> logout() async{
    await locator<FirebaseAuth>().signOut();

    // Ensure native Google session is also cleared so next sign-in can switch accounts.
    if (!kIsWeb) {
      await googleSignIn.signOut();
    }
  }

  User? getCurrentUSer(){
    return locator<FirebaseAuth>().currentUser;
  }
}

