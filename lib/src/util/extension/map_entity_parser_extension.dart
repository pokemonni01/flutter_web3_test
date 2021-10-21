import 'package:fluttert_web3_test/src/data/network/local/entity/network_entity.dart';

extension MapEntityParserExtension on Map<String, dynamic> {
  NetworkEntity toNetworkEntity() {
    return NetworkEntity(
      id: this['network_id'] ?? "",
      name: this['network_name'] ?? "",
      rpcUrl: this['network_rpc_url'] ?? "",
      symbol: this['network_symbol'] ?? "",
      blockExplorerUrl: this['network_block_explorer_url'],
      chainID: this['network_chain_id'],
    );
  }
}