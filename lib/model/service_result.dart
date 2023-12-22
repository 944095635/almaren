/// <summary>
/// 服务返回的通用数据包
/// </summary>
class ServiceResultData<T> extends ServiceResult {
  /// <summary>
  /// 请求成功的数据
  /// </summary>
  late T data;

  //ServiceResultData({
  //super.success = false,
  //super.code = 0,
  //super.msg = "",
  //this.data,
  //});

  // factory ServiceResultData.fromJson(Map<String, dynamic> json) =>
  //     ServiceResultData<T>(
  //       success: json['success'],
  //       code: json['code'],
  //       msg: json['msg'],
  //       data: json['data'],
  //     );
}

/// <summary>
/// 服务返回的通用消息包
/// </summary>
class ServiceResult {
  /// <summary>
  /// 当前请求是否成功
  /// </summary>
  bool success = false;

  /// <summary>
  /// 当前请求的消息
  /// </summary>
  String msg = "";

  /// <summary>
  /// HTTP请求状态码 HttpStatusCode
  /// </summary>
  int code = 0;

  /// <summary>
  /// 页面数据
  /// </summary>
  //late ServiceResultPage pageMata;

  //ServiceResult({this.success = false, this.code = 0, this.msg = ""});

  //factory ServiceResult.fromJson(Map<String, dynamic> json) => ServiceResult(
  //success: json['success'],
  //code: json['code'],
  //msg: json['msg'],
  //);
}

class ServiceResultPage {
  late int pageIndex;
  late int pageSize;
  late int total;
}
