import 'package:flutter/material.dart';

import '../enum.dart';
import '../services/api_services.dart';
import '../widget/item_list.dart';
import 'user_detail.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.5,
                vertical: 16,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                "List User",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Color(0xffe9e9e9),
              height: 1,
              thickness: 1,
            ),
            Expanded(
              child: FutureBuilder(
                future: getDataReqres(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff2B637B),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      ResultData? data = snapshot.data;
                      if (data?.status == DataStatus.available) {
                        return ListView.builder(
                          itemCount: data?.data.length,
                          itemBuilder: ((context, index) {
                            return listItem(
                              data?.data[index],
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return UserDetail(
                                        data: data?.data[index],
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }),
                        );
                      } else {
                        return const Center(child: Text("No Data"));
                      }
                    } else {
                      return const Center(child: Text("No Data"));
                    }
                  }

                  return const Center(child: Text("No Data"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
