import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunction(String link) async {
  final Uri uri = Uri.parse(link);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $link';
  }
}
