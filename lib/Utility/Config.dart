class Config {
  // global topic to receive app wide push notifications
  static final String TOPIC_GLOBAL = "global";

  // broadcast receiver intent filters
  static final String REGISTRATION_COMPLETE = "registrationComplete";
  static final String PUSH_NOTIFICATION = "pushNotification";
  static final String PUSH_MESSAGE = "pushMessage";

  static final String REMINDER_NOTIFICATION = "reminderNotification";
  static final String START_AUTOSYNC = "startAutoSyncWhenAppIsRunning";
  static final String SET_AUTOBACKUP_PERCENT_TO_DIALOG =
      "setAutoBackUpPercentToDialog";
  static final String UPDATE_PROGRESS_AUTOSYNC = "updateProgressAutoSync";

  // id to handle the notification in the notification tray
  static final int NOTIFICATION_ID = 100;
  static final int NOTIFICATION_ID_BIG_IMAGE = 101;

  static final String SHARED_PREF = "ah_firebase";
  static final String NETWORK_TRACKING_TYPE_LOCATION = "GPS";
  static final String NETWORK_TRACKING_TYPE_LOCATION_MESSAGE =
      "LocationMessage";
  static final String NETWORK_TRACKING_TYPE_INTERNET = "Internet";
  static final String NETWORK_TRACKING_TYPE_LOGIN_STATE = "LoginStatus";

  // Custom Upload from id series 10000
  static final String NETWORK_TRACKING_UPLOAD_ID = "1000";
  static final String KM_TRACKING_UPLOAD_ID = "1001";
  static final String GPS_COORDINATE_UPLOAD_ID = "1002";
  static final String SAMPLING_INDENT_UPLOAD_DOWNLOAD_FLAG = "517";
  static final String VR_UPLOAD_DOWNLOAD_FLAG = "";
  static final String CONTAINER_LOADING_UPLOAD_DOWNLOAD_FLAG = "124";
  static final String GITF_UPLOAD_DOWNLOAD_FLAG = "518";

  // Master Start from 2000
  static final String BUSINESS_PARTNER_VENDOR_UPLOAD_ID = "2001";

  // Alarm start from id series 10000
  static final int ALARM_GPS_SYNC_DATA = 10000;
  static final int ALARM_NETWORK_RECIVER = 10001;
  static final int ALARM_REBOOT_RECIVER = 10002;

  static final String CONFIG_ID_FARMER_CODE_SHOW = "258";

  /*Config Setting for Labour selection in RK*/
  static final String CONFIG_ALL_SITES_LABOUR = "85";
  static final String CONFIG_LABOUR_ATTENDENCE = "86";
  static final String CONFIG_ROW_WISE_LABOUR = "87";
  static final String CONFIG_ROW_LEVEL_OPERATION_LABOUR = "142";
//   static android.graphics.Bitmap.Config ARGB_8888;
}
