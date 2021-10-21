class NetworkEntity {
  NetworkEntity(
      {required this.id,
      required this.name,
      required this.rpcUrl,
      required this.symbol,
      this.blockExplorerUrl,
      this.chainID});

  String id;
  String name;
  String rpcUrl;
  String symbol;
  String? blockExplorerUrl;
  int? chainID;

  Map<String, dynamic> toMap() {
    return {
      'network_id': id,
      'network_name': name,
      'network_rpc_url': rpcUrl,
      'network_symbol': symbol,
      'network_block_explorer_url': blockExplorerUrl,
      'network_chain_id': chainID,
    };
  }

  @override
  String toString() {
    return 'NetworkEntity{id: $id, name: $name, rpcUrl: $rpcUrl, symbol: $symbol, blockExplorerUrl: $blockExplorerUrl, chainID: $chainID}';
  }
}
