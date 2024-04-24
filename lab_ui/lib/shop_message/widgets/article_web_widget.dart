import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebWidget extends StatefulWidget {
  final String htmlStr;
  const ArticleWebWidget({
    super.key,
    required this.htmlStr,
  });

  @override
  State<ArticleWebWidget> createState() => _ArticleWebWidgetState();
}

class _ArticleWebWidgetState extends State<ArticleWebWidget> {
  late WebViewController controller;
  late NavigationDelegate _navigationDelegate;

  String css =
      'video{width:100%}p{color:#344058;font-size:15px;line-height:27px}a{color:#344058;text-decoration:none}img{margin-top:12px;margin-bottom:12px;width:100%;height:auto}span{letter-spacing:1px}';

  @override
  void initState() {
    super.initState();
    _navigationDelegate = NavigationDelegate(
      onPageFinished: (url) {
        // var originalHeight = controller
        //     .runJavaScriptReturningResult("document.body.offsetHeight;");
        // print(controller
        //     .runJavaScriptReturningResult("document.body.offsetHeight;"));
        // double _originalHeight = double.parse(originalHeight.toString());
        // widget.backHeight(_originalHeight);
      },
      onPageStarted: (url) {},
      onProgress: (int progress) {
        print("WebView is loading (progress : $progress%)");
      },
    );

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(_navigationDelegate)
      ..addJavaScriptChannel("flutterMessage",
          onMessageReceived: (JavaScriptMessage message) {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String htms = """
   <!DOCTYPE html>
        <html>
      <head>
  <meta charset='UTF-8' />
  <meta http-equiv='X-UA-Compatible' content='IE=edge' />
  <meta name='viewport' content='width=device-width, initial-scale=1.0' />
  <style>$css</style>
  </head> 
  <body>
  ${widget.htmlStr}
  </body>
   <script type="text/javascript">
        const resizeObserver = new ResizeObserver(entries =>
        flutterMessage.postMessage(document.body.scrollHeight.toString()));
        resizeObserver.observe(document.body);
      </script>
  </html>
        
  """;
      controller.loadHtmlString(htms);
      print(htms);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
