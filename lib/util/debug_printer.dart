
class DebugPrinter {
  final String moduleName;
  const DebugPrinter({required this.moduleName});

  debugPrint(String message){
    print("Debug: $moduleName: $message");
  }
}