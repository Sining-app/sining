import '/backend/schema/structs/index.dart';

class CalculateAverageAndUpdateUserCloudFunctionCallResponse {
  CalculateAverageAndUpdateUserCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
