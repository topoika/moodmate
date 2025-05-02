part of "../components.dart";

// make a toast using flutter styled toast
void makeToast(
  String message, {
  String? type,
  bool showDialog = false,
  Function? onRetry,
}) {
  if (showDialog) {
    showCustomDialog1(
      Get.context!,
      message,
      type ?? "normal",
      onRetry: onRetry,
    );
  } else {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: getToastColors(type ?? "normal")[0],
      textColor: getToastColors(type ?? "normal")[1],
      fontSize: 16.0,
    );
  }
}

List getToastColors(String type) {
  switch (type) {
    case "error":
      return [Colors.red[400], Colors.white];
    case "success":
      return [Colors.green, Colors.white];
    case "warning":
      return [Colors.orange, Colors.white];
    default:
      return [Colors.black, Colors.white];
  }
}

bool _isDialogOpen = false;

void showCustomDialog1(
  BuildContext context,
  String message,
  String type, {
  Function? onRetry,
}) {
  if (_isDialogOpen) return;
  _isDialogOpen = true;

  Color bgColor = Colors.black;
  String icon = AppIcons.normalFace;
  String title = "Info!";
  String btnText = "Close";

  switch (type) {
    case "success":
      bgColor = Colors.green[800]!;
      icon = AppIcons.happyFace;
      title = "Success!";
      btnText = "Continue";
      break;
    case "error":
      bgColor = Colors.red;
      icon = AppIcons.sadFace;
      title = "Error!";
      btnText = "Retry";
      break;
    case "warning":
      bgColor = Colors.orange;
      icon = AppIcons.normalFace;
      title = "Warning!";
      btnText = "Close";
      break;
  }

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.2),
    builder: (context) {
      return Dialog(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(icon, height: 70, width: 70),
              const SizedBox(height: 10),
              Text(
                title,
                textScaler: TextScaler.noScaling,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: bgColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                message,
                textScaler: TextScaler.noScaling,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              Visibility(
                visible: onRetry != null,
                replacement: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.2,
                    vertical: 15,
                  ),
                  child: PrimaryButton(
                    text: "Close",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    bgColor: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.2,
                    vertical: 15,
                  ),
                  child: PrimaryButton(
                    text: btnText,
                    onPressed: () {
                      if (onRetry != null) {
                        onRetry();
                      }
                      Navigator.of(context).pop();
                    },
                    bgColor: bgColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).then((_) {
    _isDialogOpen = false;
  });
}
