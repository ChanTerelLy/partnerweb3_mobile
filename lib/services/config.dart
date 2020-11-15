import 'package:firebase_remote_config/firebase_remote_config.dart';
class Config {

  Future<RemoteConfig> setRemoteConfig(Map params) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
    remoteConfig.setDefaults(params);
    remoteConfig.fetch();
    remoteConfig.activateFetched();
    return remoteConfig;
  }

  Future<RemoteConfig> getRemoteConfig() async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    return remoteConfig;
  }


}