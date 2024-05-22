import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmsbysumit/models/appointmentmodel.dart';
class PrescriptionCard extends StatelessWidget {
  AppointmentModel appointment;
  PrescriptionCard(this.appointment);

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
                  FontAwesomeIcons.briefcaseMedical,
                  size: 140,
                  color: Color(0xffffffff),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),

                          Text(

                            "Doctor:${appointment.name}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 17.0,color: Colors.white,),
                          ),

                          Text(
                            "Date:${appointment.date}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 17.0,color: Colors.white,),
                          ),
                          Text(
                            "Time:${appointment.time}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17.0,color: Colors.white),
                          ),
                          Text(
                            "Dieases:${appointment.diseases}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17.0,color: Colors.white),
                          ),
                          Text(
                            "Allergies:${appointment.allergies}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17.0,color: Colors.white),
                          ),
                          Text(
                            "Prescription:${appointment.prescription}",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17.0,color: Colors.white),
                          ),




                        ],
                      ),
                    ))
              ],
            ),
          )),
    );;
  }
}
