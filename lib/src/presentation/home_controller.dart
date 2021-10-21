import 'dart:convert';
import 'dart:typed_data';

import 'package:fluttert_web3_test/src/domain/network/add_network_use_case.dart';
import 'package:fluttert_web3_test/src/domain/network/get_all_network_use_case.dart';
import 'package:fluttert_web3_test/src/domain/network/network_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class HomeController extends GetxController {

  HomeController(this._getAllNetworkUseCase, this._addNetworkUseCase);

  final GetAllNetworkUseCase _getAllNetworkUseCase;
  final AddNetworkUseCase _addNetworkUseCase;

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
    getAllNetwork();
    super.onReady();
  }

  void connect() async {
    Credentials credentials = EthPrivateKey.fromHex(_pSAddress);
    var address = await credentials.extractAddress();
    Client httpClient = Get.find<InterceptedClient>();
    var ethClient = Web3Client(_ethMainNet, httpClient);
    EtherAmount balance = await ethClient.getBalance(EthereumAddress.fromHex(_whaleAddress));
    int networkId = await ethClient.getNetworkId();
    printUiLog("Balance: " + balance.getValueInUnit(EtherUnit.ether).toString());
  }

  void getAllNetwork() async {
    printUiLog("Network List: ${await _getAllNetworkUseCase.invoke()}");
  }

  void addNetwork() async {
    await _addNetworkUseCase.invoke(NetworkModel(
      id: "NT001",
      name: "THB Mainnet",
      rpcUrl: "www.google.com",
      symbol: "THB",
    ));
  }

  void connectMetaMask() async {
    // final eth = window.ethereum;
    // if (eth == null) {
    //   printUiLog('MetaMask is not available');
    //  return;
    // }
    //
    // final client = Web3Client.custom(eth.asRpcService());
    // final credentials = await eth.requestAccount();
    //
    // printUiLog('Using ${credentials.address}');
    // printUiLog('coinbaseAddress: ${await client.coinbaseAddress()}');
    // printUiLog('getNetworkId: ${await client.getNetworkId()}');
    // printUiLog('Client is listening: ${await client.isListeningForNetwork()}');
    //
    // final message = Uint8List.fromList(utf8.encode('Hello from web3dart'));
    // final signature = await credentials.signPersonalMessage(message);
    // printUiLog('Signature: ${base64.encode(signature)}');
  }

  void clearLog() {
    logList.clear();
  }

  void printUiLog(Object? object) {
    logList.add(object?.toString() ?? "");
    print(object);
  }
}