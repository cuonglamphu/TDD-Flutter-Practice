class Task {
  static int _idCounter = 0;

  final int id;
  String name;
  bool isCompleted;
  final DateTime createdDate;
  DateTime? completedDate;

  // Constructor
  Task({
    required this.name,
    this.isCompleted = false,
  })  : id = ++_idCounter,
        createdDate = DateTime.now();

  void toggleCompletion() {
    isCompleted = !isCompleted;
    completedDate = isCompleted ? DateTime.now() : null;
  }
}
