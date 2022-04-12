import 'package:localstorage/localstorage.dart';
class localStorage{
/*  static LocalStorage storage = new LocalStorage('asl_version2');
  static String user =storage.getItem("nameCheck");
  static String ownUserId=storage.getItem("userId");
  static String userUnique=storage.getItem("UserlastName") + ownUserId;*/

  static String user ="";
  static String ownUserId="";
  static String WhichPageAreYou="";
  static String userUnique="";
  static String blockUserCheck="";
  static int valueCHeck =0;
  static int callingValueCheck =0;
  static int valueCHeckForNotification =0;
  static var usrOnlineList=[];
  static int imageDownloadCheck=0;
  static String PipPage="";


  void clearSTorage(){
    print("Storage clear hit");
    // storage.clear();
    user="";
    ownUserId="";
    userUnique="";
    valueCHeck=0;

  }
}