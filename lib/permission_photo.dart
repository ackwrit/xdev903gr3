
import 'package:permission_handler/permission_handler.dart';

class PermissionPhoto {


  init() async {
    PermissionStatus permissionStatus = await Permission.photos.status;
    checkPermission(permissionStatus);
  }

  Future<PermissionStatus>checkPermission(PermissionStatus permission) async {
    switch (permission) {
      case PermissionStatus.denied:
        return Permission.photos.request();
    // TODO: Handle this case.
      case PermissionStatus.granted:
        return Permission.photos.request();
    // TODO: Handle this case.
      case PermissionStatus.restricted:
        return Permission.photos.request();
    // TODO: Handle this case.
      case PermissionStatus.limited:
        return Permission.photos.request();
    // TODO: Handle this case.
      case PermissionStatus.permanentlyDenied:
        return Future.error(
            "L'utilisateur ne souhaite qu'on accéde à ses photos");
    // TODO: Handle this case.
      case PermissionStatus.provisional:
        return Permission.photos.request();
    // TODO: Handle this case.

    }
  }
}