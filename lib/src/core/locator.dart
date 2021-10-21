
import 'package:get/get.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'logger_interceptor.dart';

void setupLocator() {
  // Api Client
  Get.put<InterceptedClient>(InterceptedClient.build(interceptors: [LoggerInterceptor()]));
}