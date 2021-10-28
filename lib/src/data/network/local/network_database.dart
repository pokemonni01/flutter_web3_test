import 'package:fluttert_web3_test/src/core/database/database_manager.dart';
import 'package:fluttert_web3_test/src/core/database/database_sql_command.dart';
import 'package:fluttert_web3_test/src/data/network/local/entity/network_entity.dart';
import 'package:fluttert_web3_test/src/util/extension/map_entity_parser_extension.dart';

abstract class NetworkDatabase {

  Future<List<NetworkEntity>> getAll();

  Future<void> put(NetworkEntity entity);
}

class NetworkDatabaseImpl extends NetworkDatabase {

  NetworkDatabaseImpl(this.databaseManager);

  final DatabaseManager databaseManager;

  @override
  Future<List<NetworkEntity>> getAll() async {
    List<Map<String, dynamic>>? result = await databaseManager.query(DatabaseSql.networkTable) ?? [];
    return result.map((e) => e.toNetworkEntity()).toList();
  }

  @override
  Future<void> put(NetworkEntity entity) async {
    return await databaseManager.insert(DatabaseSql.networkTable, entity.toMap());
  }
}