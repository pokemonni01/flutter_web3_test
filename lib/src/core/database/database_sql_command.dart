class DatabaseSql {
  DatabaseSql._();

  static const networkTable = "network_table";

  static const createNetworkTable = "CREATE TABLE $networkTable"
      "("
      "network_id                  TEXT NOT NULL,"
      "network_name                TEXT NOT NULL,"
      "network_rpc_url             TEXT NOT NULL,"
      "network_symbol              TEXT NOT NULL,"
      "network_block_explorer_url  TEXT NULL,"
      "network_chain_id            INTEGER NULL"
      ");";

  static const insertEthMainNetToNetworkTable = "INSERT INTO $networkTable"
      "("
      "network_id,"
      "network_name,"
      "network_rpc_url,"
      "network_symbol,"
      "network_block_explorer_url,"
      "network_chain_id"
      ")"
      "VALUES"
      "("
      "'NT001',"
      "'Ethereum Mainnet',"
      "'https://mainnet.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161',"
      "'ETH',"
      "'https://etherscan.io',"
      "1,"
      ")";
}