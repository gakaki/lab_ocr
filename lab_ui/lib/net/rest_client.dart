import 'package:dio/dio.dart';
import 'package:get_demo/experimental_report/model/camera_model.dart';
import 'package:get_demo/experimental_report/model/experimental_report_model.dart';
import 'package:get_demo/user_login/model/user_login_model.dart';
import 'package:retrofit/http.dart';
import '../shop_message/model/info_work_model.dart';
import 'result.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// 列表接口
  @GET("searchV5")
  Future<Result<InfoWorkModel>> getInfoListData(
    @Query('pn') int page,
    @Query('ps') int pageSize,
    @Query('q') String name,
    @Query('t') String t,
  );

  @GET("layout/getNewLayDetail")
  Future<Result<InfoWorkModel>> getHomeListData(
    @Query('queryFuture') String queryFuture,
    @Query('storeId') String storeId,
    @Query('layoutIds') String layoutIds,
    @Query('_timestemp') int timestemp,
  );

  /// 详情接口
  @GET("pc/items/info")
  Future<Result<InfoWorkModel>> getInfoDetailData(
    @Query('entityId') int entityId,
  );

  /// 点赞接口
  @POST("thumbsUpOrDown")
  Future<Result<InfoWorkModel>> likeThumbsUpOrDown(
      @Body() Map<String, dynamic> param);

  /// 获取摄像头列表
  @GET("cameras")
  Future<Result<List<CameraModel>>> getCameraListData(
    @Query('lab_id') String labId,
  );
  // 实验室报告列表
  @GET("experimental_reports")
  Future<Result<List<ExperimentalReportModel>>> getExperimentalReportListData(
    @Query('camera_id') String cameraId,
  );

  /// 登录 注册 一体化
  @POST("token")
  @FormUrlEncoded()
  Future<Result<UserLoginModel>> token(
      @Field() String username, @Field() String password);
}
