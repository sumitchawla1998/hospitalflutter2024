import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmsbysumit/models/appointmentmodel.dart';
class AppointmentStatusCard extends StatelessWidget {
  AppointmentModel appointment;
  AppointmentStatusCard(this.appointment);

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
                  FontAwesomeIcons.calendarCheck,
                  size: 155,
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

                            "Doctor Fees:${appointment.fees}",
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
                          RichText(
                            text: TextSpan(
                              text: 'Status:',
                              style:
                              TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold,),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "${appointment.status}",
                                    style: TextStyle(

                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1a3d7d))),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminAddPrescription(appointment.id)));
                              }, child:Text("Cancel Appointment"),style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1a3d7d)),),

                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )),
    );;
  }
}
