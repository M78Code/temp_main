class ApiHost {

  /// 服务名称
  static const String API_NAME = 'game-http';

  /// 服务地址
  static const String API_FAT = 'https://gateway.dpzrfat6.com/';
  static const String API_DEV = 'https://gateway.dpzrdev6.com/';
  static const String API_UAT = 'https://gateway.dpzruat6.com/';
  static const String API_PRO = 'https://gateway.dpzrpro6.com/';


  static const String PC_API = 'https://apimarket-dev.shinho.net.cn/df-bff/v1';
  static const String SYSTEM_API =
      'https://apimarket-dev.shinho.net.cn/df-system/v1';
  static const String SOCKET_API =
      'wss://n2j6guq05a.execute-api.cn-north-1.amazonaws.com.cn/dev?appid=df-mds-dev&channel=df-mds-business-msg-dev&flag=';

  static const String API_STREAM_FAT = 'https://stream.paonem.com/';
  static const String API_STREAM_DEV = 'https://stream.paonem.com/';
  static const String API_STREAM_UAT = 'https://stream.paonem.com/';
  static const String API_STREAM_PRO = 'https://stream.dpzrdev6.com/';

  /// 1是测试 2是联调 3是线上 4是培训 5是预发
  // String configAddress(int envrioment){
  //
  //   if(envrioment == 1){
  //     return 'https://stream.joint.bzngss.com';
  //   }else if(envrioment == 2){
  //     return 'https://stream.joint.bzngss.com';
  //   }else if(envrioment == 3 || envrioment == 5){
  //     return 'https://stream.mqiedu.com';
  //   }else{
  //     return 'https://stream.training.cheyougoo.com';
  //   }
  // }
}