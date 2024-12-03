import 'dart:convert';
/// playerId : 121980
/// deviceType : 3
/// token : "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIzMDU3YzEwNi00YzEwLTRiZTctYWE0Mi1kZGNiY2M3ZDBkMzQiLCJpYXQiOjE3MjY0NTQ5MTksInN1YiI6IntcInBsYXllcklkXCI6MTIxOTgwLFwibG9naW5OYW1lXCI6XCJmc3lyZWl2eTAwNVwiLFwibmlja05hbWVcIjpcIml2eTAwNVwiLFwiY3VycmVuY3lcIjpcIkNOWVwiLFwiY2F0ZWdvcnlcIjoxLFwiYWdlbnRJZFwiOjk0MjksXCJncmVlblRva2VuXCI6MH0iLCJleHAiOjE3MjY1NDEzMTl9.2aqgukL_a96veAZCiSjXPy4LDXZXeGdczC5eAHZ_-Kk"
/// sessionid : "1587493"
/// backurl : "https://gateway.dpzrfat6.com/#/?login=true"
/// agentId : "9429"
/// horizontalDomain : "https://www.dpzrfat6.com/"
/// verticalDomain : "https://ep.dpzrfat6.com/"
/// backendDomainUrl : "dpzrfat6.com"
/// backendDomainUrlList : "dpzrfat6.com"
/// domainUrlList : "dpzrfat6.com"
/// fileDomainUrlList : "dpzrfat6.com"
/// h5DomainUrlList : "dpzrfat6.com"
/// currency : "CNY"
/// landingPageSwitchStatus : 0
/// defaultLanguage : "en"
/// gw : 1
/// skin : 1
/// brandType : 1
/// backUi : true
/// zhuGeSwitch : 0
/// shenjiSitch : 0
/// uiType : 1
/// defaultOldLanguage : "zh"

AppConfigModel appConfigModelFromJson(String str) => AppConfigModel.fromJson(json.decode(str));
String appConfigModelToJson(AppConfigModel data) => json.encode(data.toJson());
class AppConfigModel {
  AppConfigModel({
      this.playerId, 
      this.deviceType, 
      this.token, 
      this.sessionid, 
      this.backurl, 
      this.agentId, 
      this.horizontalDomain, 
      this.verticalDomain, 
      this.backendDomainUrl, 
      this.backendDomainUrlList, 
      this.domainUrlList, 
      this.fileDomainUrlList, 
      this.h5DomainUrlList, 
      this.currency, 
      this.landingPageSwitchStatus, 
      this.defaultLanguage, 
      this.gw, 
      this.skin, 
      this.brandType, 
      this.backUi, 
      this.zhuGeSwitch, 
      this.shenjiSitch, 
      this.uiType, 
      this.defaultOldLanguage,});

  AppConfigModel.fromJson(dynamic json) {
    playerId = json['playerId'];
    deviceType = json['deviceType'];
    token = json['token'];
    sessionid = json['sessionid'];
    backurl = json['backurl'];
    agentId = json['agentId'];
    horizontalDomain = json['horizontalDomain'];
    verticalDomain = json['verticalDomain'];
    backendDomainUrl = json['backendDomainUrl'];
    backendDomainUrlList = json['backendDomainUrlList'];
    domainUrlList = json['domainUrlList'];
    fileDomainUrlList = json['fileDomainUrlList'];
    h5DomainUrlList = json['h5DomainUrlList'];
    currency = json['currency'];
    landingPageSwitchStatus = json['landingPageSwitchStatus'];
    defaultLanguage = json['defaultLanguage'];
    gw = json['gw'];
    skin = json['skin'];
    brandType = json['brandType'];
    backUi = json['backUi'];
    zhuGeSwitch = json['zhuGeSwitch'];
    shenjiSitch = json['shenjiSitch'];
    uiType = json['uiType'];
    defaultOldLanguage = json['defaultOldLanguage'];
  }
  int? playerId;
  int? deviceType;
  String? token;
  String? sessionid;
  String? backurl;
  String? agentId;
  String? horizontalDomain;
  String? verticalDomain;
  String? backendDomainUrl;
  String? backendDomainUrlList;
  String? domainUrlList;
  String? fileDomainUrlList;
  String? h5DomainUrlList;
  String? currency;
  int? landingPageSwitchStatus;
  String? defaultLanguage;
  int? gw;
  int? skin;
  int? brandType;
  bool? backUi;
  int? zhuGeSwitch;
  int? shenjiSitch;
  int? uiType;
  String? defaultOldLanguage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['playerId'] = playerId;
    map['deviceType'] = deviceType;
    map['token'] = token;
    map['sessionid'] = sessionid;
    map['backurl'] = backurl;
    map['agentId'] = agentId;
    map['horizontalDomain'] = horizontalDomain;
    map['verticalDomain'] = verticalDomain;
    map['backendDomainUrl'] = backendDomainUrl;
    map['backendDomainUrlList'] = backendDomainUrlList;
    map['domainUrlList'] = domainUrlList;
    map['fileDomainUrlList'] = fileDomainUrlList;
    map['h5DomainUrlList'] = h5DomainUrlList;
    map['currency'] = currency;
    map['landingPageSwitchStatus'] = landingPageSwitchStatus;
    map['defaultLanguage'] = defaultLanguage;
    map['gw'] = gw;
    map['skin'] = skin;
    map['brandType'] = brandType;
    map['backUi'] = backUi;
    map['zhuGeSwitch'] = zhuGeSwitch;
    map['shenjiSitch'] = shenjiSitch;
    map['uiType'] = uiType;
    map['defaultOldLanguage'] = defaultOldLanguage;
    return map;
  }

}