import 'package:get/get.dart';
import 'package:get_demo/base/base_common_controller.dart';

import '../../../widget/loading_widget.dart';
import '../../base/base_controller.dart';
import 'experiment_report_detail_state.dart';

class ExperimentReportCreateLogic extends BaseCommonController {
  ExperimentReportCreateState experimentReportState =
      ExperimentReportCreateState();

  @override
  void initData() {
    getnetworkdata(configNetWorkParmas());
  }

  @override
  configNetWorkParmas() {
    return {};
  }

  @override
  void getnetworkdata(Map<String, dynamic> info) {
    super.getnetworkdata(info);

    /// 展示loading
    Loading.show();
    Loading.dissmiss();
    netState = NetState.dataSussessState;
    // experimentReportState.experimentalReportModel =
    //     Get.arguments['entity'] as ExperimentalReportModel;
    // print(experimentReportState.experimentalReportModel.device_name);
    update();
  }

  Future<void> submit() async {
    print("start");

    Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //
    //   String _username = '';
    //   String _device = '';
    //   String _remark = '';
    //
    //   try {
    //     // 创建Dio实例
    //     Dio dio = Dio();
    //
    //     // 发送POST请求
    //     var response = await dio.post(
    //       'http://your-backend-url.com/user/post',
    //       data: {
    //         'user': _username,
    //         'device': _device,
    //         'remark': _remark,
    //       },
    //     );
    //
    //     // 处理响应
    //     if (response.statusCode == 200) {
    //       // 成功处理
    //       print('Form submitted successfully: ${response.data}');
    //     } else {
    //       // 处理错误
    //       print('Error submitting form: ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     // 处理异常
    //     print('Error: $e');
    //   }
    // }
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
