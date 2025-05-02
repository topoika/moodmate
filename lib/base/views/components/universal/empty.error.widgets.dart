// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../components.dart";

class EmptyErrorWidget extends StatelessWidget {
  final String? message;
  final String? type;
  final double? height;
  final double? width;
  final VoidCallback? onRetry;

  const EmptyErrorWidget({
    super.key,
    this.message,
    this.height,
    this.width,
    this.type,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      width: width ?? double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getIcon(),
          const SizedBox(height: 10),
          Text(
            message ?? _getDefaultMessage(),
            textAlign: TextAlign.center,
            textScaler: TextScaler.noScaling,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 15),
            GestureDetector(
              onTap: onRetry,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Retry",
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _getIcon() {
    switch (type) {
      case "error":
        return const Icon(Icons.error, color: Colors.red, size: 48);
      case "empty":
        return const Icon(Icons.inbox, color: Colors.grey, size: 48);
      case "network":
        return const Icon(Icons.wifi_off, color: Colors.blueGrey, size: 48);
      default:
        return const Icon(Icons.info, color: Colors.blue, size: 48);
    }
  }

  String _getDefaultMessage() {
    switch (type) {
      case "error":
        return "Something went wrong.";
      case "empty":
        return "No data available.";
      case "network":
        return "No internet connection.";
      default:
        return "An unexpected issue occurred.";
    }
  }
}
