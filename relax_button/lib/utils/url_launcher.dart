import 'package:relax_button/constants/links.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncher {
  static _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchHelpUkraine() async {
    await _launchUrl(Uri.parse(UrlLauncherLinks.supportUkraine));
  }

  static launchMailTo() async {
    await _launchUrl(Uri.parse(
      "mailto:relax.button.app@gmail.com?subject=Contact Us&body=Hi, Relax Button team!",
    ));
  }
}
