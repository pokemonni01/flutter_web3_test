import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/src/browser/dart_wrappers.dart';
import 'package:web3dart/src/browser/javascript.dart';
import 'package:web3dart/web3dart.dart';

class HomeController extends GetxController {

  final _bscUrl = "https://bsc-dataseed.binance.org/";
  final _bscUrl2 = "https://bsc-dataseed1.binance.org:443";
  final _ethMainNet = "https://mainnet.infura.io/v3/0924a6bb7c69475d809da66f210eae1f";
  final _test = "http://localhost:8545/";
  final _ropsten = "https://ropsten.infura.io/v3/0924a6bb7c69475d809da66f210eae1f";

  final _pSAddress = "0xD04306F9a9E951822565f598BDeBAc98Cc87072A";
  final _myAddress = "0x0C3513DE0E39035e1e985e4FF84F293a534c8eA6";
  final _whaleAddress = '0x84d34f4f83a87596cd3fb6887cff8f17bf5a7b83';

  final _bnbContractAddress = '0xb8c77482e45f1f44de1745f52c74426c631bdd52';

  List<String> logList = RxList.empty(growable: true);

  @override
  void onReady() {
    connect();
    super.onReady();
  }

  void connect() async {
    Credentials credentials = EthPrivateKey.fromHex(_myAddress);
    var address = await credentials.extractAddress();
    Client httpClient = Get.find<InterceptedClient>();
    var ethClient = Web3Client(_bscUrl, httpClient);
    EtherAmount balance = await ethClient.getBalance(address);
    int networkId = await ethClient.getNetworkId();
    printUiLog("Balance: " + balance.toString());
    printUiLog("Network Id: " + networkId.toString());
  }

  void connectMetaMask() async {
    final eth = window.ethereum;
    if (eth == null) {
      printUiLog('MetaMask is not available');
     return;
    }

    final client = Web3Client.custom(eth.asRpcService());
    final credentials = await eth.requestAccount();

    printUiLog('Using ${credentials.address}');
    printUiLog('coinbaseAddress: ${await client.coinbaseAddress()}');
    printUiLog('getNetworkId: ${await client.getNetworkId()}');
    printUiLog('Client is listening: ${await client.isListeningForNetwork()}');

    final message = Uint8List.fromList(utf8.encode('Hello from web3dart'));
    final signature = await credentials.signPersonalMessage(message);
    printUiLog('Signature: ${base64.encode(signature)}');
  }

  void clearLog() {
    logList.clear();
  }

  void printUiLog(Object? object) {
    logList.add(object?.toString() ?? "");
    print(object);
  }
}