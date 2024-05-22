import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PatientService{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future register(String? nm,String email,String pwd,String? gender) async {
    try{
      UserCredential credentials =await auth.createUserWithEmailAndPassword(email: email, password: pwd);
      if(credentials.user != null){
        await credentials.user!.updateDisplayName(nm);
        await firestore.collection("patients").add({
          "nm":nm,
          "email":email,
          "gender":gender,
        });
      }
      return credentials.user;
    }catch(e){
      print(e);
    }

  }

  Future login(String email,String pwd)async{
    try{
      UserCredential credentials = await auth.signInWithEmailAndPassword(email: email, password: pwd);
      return credentials.user;
    }catch(e){
      print(e);
    }
  }

}