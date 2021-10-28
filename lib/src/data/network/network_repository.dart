import 'package:fluttert_web3_test/src/data/network/local/network_database.dart';

import 'local/entity/network_entity.dart';

abstract class NetworkRepository {

  Future<List<NetworkEntity>> getAllNetwork();

  Future<void> addNetwork(NetworkEntity entity);

}

class NetworkRepositoryImpl extends NetworkRepository {

  NetworkRepositoryImpl(this._networkDatabase);

  final NetworkDatabase _networkDatabase;

  @override
  Future<List<NetworkEntity>> getAllNetwork() {
    return _networkDatabase.getAll();
  }

  @override
  Future<void> addNetwork(NetworkEntity entity) {
    return _networkDatabase.put(entity);
  }

}