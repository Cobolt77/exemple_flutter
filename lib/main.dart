import 'package:flutter/material.dart';
import 'package:lexpress/pages/actualites.dart';
import 'package:lexpress/pages/article.dart';
import 'package:lexpress/pages/article_rendu.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  onesignal();
  runApp(Lexpress());
}

onesignal() async {
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init("f9d2cb22-1cee-4a72-9edc-f48ae94e1492", iOSSettings: {
    OSiOSSettings.autoPrompt: true,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
}

class Lexpress extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Novae',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/actualites",
      routes: {
        '/actualites': (context) => Actualites(),
        '/article': (context) => Article(),
        '/article_rendu': (context) => ArticleRendu(),
      },
    );
  }
}
