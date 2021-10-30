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
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [_selectNetworkButton()],
            ),
          ),
        ),
      ),
    );
  }

  _selectNetworkButton() {
    return Material(
      child: InkWell(
        onTap: () async => {
          _showSelectNetworkDialog(await _controller.getNetworkList())
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8,),
                Obx(() => Text(_controller.selectedNetworkName.value)),
                const SizedBox(width: 8,),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSelectNetworkDialog(List<String> networkList) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Networks'),
          content: _networkList(networkList),
        );
      },
    );
  }

  Widget _networkList(List<String> items) {
    return SizedBox(
      width: 300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return optionOne(context, items[index]);
        },
      ),
    );
  }

  Widget optionOne(BuildContext context, String text) {
    return SimpleDialogOption(
      child: Text(text),
      onPressed: () {
        _controller.setSelectedNetwork(text);
        Navigator.pop(context);
      },
    );
  }
}
