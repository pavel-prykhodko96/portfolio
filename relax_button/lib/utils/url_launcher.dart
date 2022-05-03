import 'package:relax_button/constants/links.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncher {
  static _launchUrl(Uri url, [Function? onError]) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      onError != null ? onError() : throw 'Could not launch $url';
    }
  }

  static launchHelpUkraine() async {
    await _launchUrl(Uri.parse(UrlLauncherLinks.supportUkraine));
  }

  static launchMailTo([Function? onError]) async {
    await _launchUrl(Uri.parse(UrlLauncherLinks.mailToRelaxButton), onError);
  }
}
