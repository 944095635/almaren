class Config {
  static const String imHost = 'wildfirechat.net';
  static const String appServerAddress = 'http://wildfirechat.net:8888';

  /// 音视频通话所用的turn server配置，详情参考 https://docs.wildfirechat.net/webrtc/
  /// <br>
  /// <br>
  /// 单人版和多人版音视频必须部署turn服务。高级版不需要部署stun/turn服务。
  /// <p>
  /// !!! 我们提供的服务仅供用户测试和体验，为了保证测试可用，我们会不定期的更改密码. !!!
  /// <br>
  /// <strong>上线商用时，请更换为自己部署的turn 服务</strong>
  /// <br>
  static final iceSERVERS /*请仔细阅读上面的注释*/ = [
    // 如果是高级版，请删除掉下面的配置项目，保持ICE_SERVERS为空数组就行。
    // 数组元素定义
    /*{"turn server uri", "userName", "password"}*/
    ["turn:turn.wildfirechat.net:3478", "wfchat", "wfchat1"]
  ];

  static const String defaultUserPortrait =
      'assets/images/user_avatar_default.png';
}
