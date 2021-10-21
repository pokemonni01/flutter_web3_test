class NetworkModel{
  NetworkModel(
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
}
