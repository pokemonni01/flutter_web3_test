
import 'package:fluttert_web3_test/src/core/database/database_manager.dart';
import 'package:fluttert_web3_test/src/data/network/local/network_database.dart';
import 'package:fluttert_web3_test/src/data/network/network_repository.dart';
import 'package:fluttert_web3_test/src/domain/network/add_network_use_case.dart';
import 'package:fluttert_web3_test/src/domain/network/get_all_network_use_case.dart';
import 'package:fluttert_web3_test/src/presentation/home_controller.dart';
import 'package:get/get.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'logger_interceptor.dart';

void setupLocator() {
  // Database
  Get.put<DatabaseManager>(DatabaseManagerImpl());
  Get.put<NetworkDatabase>(NetworkDatabaseImpl(Get.find()));

  // Api Client
  Get.put<InterceptedClient>(InterceptedClient.build(interceptors: [LoggerInterceptor()]));

  // Repository
  Get.put<NetworkRepository>(NetworkRepositoryImpl(Get.find()));

  // Use Case
  Get.put(GetAllNetworkUseCase(Get.find()));
  Get.put(AddNetworkUseCase(Get.find()));

  // Controller
  Get.put(HomeController(Get.find(), Get.find()));
}