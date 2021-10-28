import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttert_web3_test/src/presentation/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _controller.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Web3 Test"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () => {_controller.addNetwork()},
                  child: Container(
                      width: 70,
                      height: 50,
                      color: Colors.green,
                      child: Text("Connect MetaMask")),
                ),
                SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: () => {_controller.getAllNetwork()},
                  child: Container(
                      color: Colors.green, child: Text("Connect Manual")),
                ),
                SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: () => {_controller.clearLog()},
                  child: Container(color: Colors.red, child: Text("Clear Log")),
                ),
                Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: _controller.logList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_controller.logList[index]),
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
