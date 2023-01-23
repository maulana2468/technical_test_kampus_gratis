import 'package:flutter/material.dart';
import 'package:technical_test_kampus_gratis/models/model_list.dart';

class UserDetail extends StatelessWidget {
  final Datum? data;
  const UserDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "User Data",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Hero(
              tag: "user_profile_photo_${data?.id}",
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  data?.avatar as String,
                ),
                radius: 49,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "${data?.firstName} ${data?.lastName}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "${data?.email}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
