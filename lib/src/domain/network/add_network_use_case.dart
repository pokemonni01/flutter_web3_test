import 'package:fluttert_web3_test/src/data/network/local/entity/network_entity.dart';
import 'package:fluttert_web3_test/src/data/network/network_repository.dart';

import 'network_model.dart';

class AddNetworkUseCase {
  AddNetworkUseCase(this._networkRepository);

  final NetworkRepository _networkRepository;

  Future<void> invoke(NetworkModel networkModel) async {
    return await _networkRepository.addNetwork(NetworkEntity(
        id: networkModel.id,
        name: networkModel.name,
        rpcUrl: networkModel.rpcUrl,
        symbol: networkModel.symbol,
        blockExplorerUrl: networkModel.blockExplorerUrl,
        chainID: networkModel.chainID));
  }
}