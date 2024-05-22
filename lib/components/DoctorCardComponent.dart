import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmsbysumit/patient/PatientBookAppointment.dart';
import '../models/doctormodel.dart';

class DoctorCardComponent extends StatelessWidget {
  DoctorModel doctor;
  DoctorCardComponent(this.doctor);

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
          color: Color(0xff28b6f6),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.userDoctor,
                  size: 140,
                  color: Colors.white,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${doctor.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Colors.white),
                      ),
                      Text(
                        "Speciality:${doctor.speciality}",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${doctor.fees}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          ),

                          auth.currentUser == null
                              ? IconButton(
                                  onPressed: () {
                                    // BookService().deleteBook(book?.id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PatientBookAppointment(
                                                    doctor)));
                                  },
                                  icon: Icon(
                                    Icons.today,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )

                          // ElevatedButton(onPressed: (){},
                          //   child: Text("Edit",style: TextStyle(color: Colors.white),),
                          // ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
