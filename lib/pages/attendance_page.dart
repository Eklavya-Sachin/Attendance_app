import 'package:attendance_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth / 20,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    icon: const Icon(Icons.logout))
              ],
            ),
            Text(
              'Student',
              style: TextStyle(
                fontSize: screenWidth / 16,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Today's Status",
                style: TextStyle(
                  fontSize: screenWidth / 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SlideAction(
              outerColor: Colors.white,
              innerColor: const Color.fromARGB(255, 89, 12, 38),
              text: "Present",
              onSubmit: () async {
                QuerySnapshot snap = FirebaseFirestore.instance
                    .collection("users")
                    .where('email', isEqualTo: UserBoy.userName)
                    .get() as QuerySnapshot<Object?>;

                DocumentSnapshot snap2 = FirebaseFirestore.instance
                    .collection("users")
                    .doc(snap.docs[0].id)
                    .collection('record')
                    .doc(DateFormat("dd MMMM yyyy").format(DateTime.now()))
                    .get() as DocumentSnapshot<Object?>;
                try {
                  String present = snap2["present"];
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(snap.docs[0].id)
                      .collection('record')
                      .doc(DateFormat("dd MMMM yyyy").format(DateTime.now()))
                      .update({"Present": present});
                } catch (e) {
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(snap.docs[0].id)
                      .collection('record')
                      .doc(DateFormat("dd MMMM yyyy").format(DateTime.now()))
                      .set({
                    "Present": DateFormat("hh:mm a").format(DateTime.now())
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            SlideAction(
              outerColor: Colors.white,
              innerColor: const Color.fromARGB(255, 89, 12, 38),
              text: "Absent",
              onSubmit: () {},
            ),
            const SizedBox(height: 20),
            Text(
              DateFormat("dd MMMM yyyy").format(DateTime.now()),
              style: TextStyle(
                fontSize: screenWidth / 18,
              ),
            ),
            Text(
              DateFormat("hh:mm a").format(DateTime.now()),
              style: TextStyle(
                fontSize: screenWidth / 19,
                color: Colors.black38,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
