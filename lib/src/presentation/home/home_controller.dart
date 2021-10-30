import 'dart:convert';
import 'dart:typed_data';

import 'package:fluttert_web3_test/src/domain/network/add_network_use_case.dart';
import 'package:fluttert_web3_test/src/domain/network/get_all_network_use_case.dart';
import 'package:fluttert_web3_test/src/domain/network/network_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:permission_handler/permission_handler.dart';
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

  RxString selectedNetworkName = "Smart Chain".obs;

  void requestPermission() async {
    var status = await Permission.storage.request();
  }

  void connect() async {
    Credentials credentials = EthPrivateKey.fromHex(_pSAddress);
    var address = await credentials.extractAddress();
    Client httpClient = Get.find<InterceptedClient>();
    var ethClient = Web3Client(_ethMainNet, httpClient);
    EtherAmount balance = await ethClient.getBalance(EthereumAddress.fromHex(_whaleAddress));
    int networkId = await ethClient.getNetworkId();
    print("Balance: " + balance.getValueInUnit(EtherUnit.ether).toString());
  }

  void getAllNetwork() async {
    await [
      Permission.storage,
    ].request();
    print("Network List: ${await _getAllNetworkUseCase.invoke()}");
  }

  void addNetwork() async {
    await [
      Permission.storage,
    ].request();
    await _addNetworkUseCase.invoke(NetworkModel(
      id: "NT001",
      name: "THB Mainnet",
      rpcUrl: "www.google.com",
      symbol: "THB",
    ));
  }


  Future<List<String>> getNetworkList() async {
    return ["Smart Chain", "ETH Mainnet"];
  }

  void setSelectedNetwork(String selectedNetworkName) {
    this.selectedNetworkName.value = selectedNetworkName;
  }
}