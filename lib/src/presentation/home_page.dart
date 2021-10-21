import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttert_web3_test/src/presentation/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () => {controller.connectMetaMask()},
                  child: Container(color: Colors.green, child: Text("Connect MetaMask")),
                ),
                SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: () => {controller.connect()},
                  child: Container(color: Colors.green, child: Text("Connect Manual")),
                ),
                SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: () => {controller.clearLog()},
                  child: Container(color: Colors.red, child: Text("Clear Log")),
                ),
                Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: controller.logList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.logList[index]),
                      );
                    },
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
