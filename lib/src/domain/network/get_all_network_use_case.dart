import 'package:fluttert_web3_test/src/data/network/network_repository.dart';
import 'package:fluttert_web3_test/src/domain/network/network_model.dart';

class GetAllNetworkUseCase {
  GetAllNetworkUseCase(this._networkRepository);

  final NetworkRepository _networkRepository;

  Future<List<NetworkModel>> invoke() async {
    return (await _networkRepository.getAllNetwork())
        .map((e) => NetworkModel(
            id: e.id,
            name: e.name,
            rpcUrl: e.rpcUrl,
            symbol: e.symbol,
            blockExplorerUrl: e.blockExplorerUrl,
            chainID: e.chainID))
        .toList();
  }
}
