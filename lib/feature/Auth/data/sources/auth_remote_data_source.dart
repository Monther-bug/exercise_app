import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      return await _firebaseAuth.signInWithCredential(credential);
    }on FirebaseAuthException catch (e) {
    throw Exception('Google Sign-In failed [${e.code}]: ${e.message}');
    }catch (e) {
    throw Exception('An unknown error occurred: $e');
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
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
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

