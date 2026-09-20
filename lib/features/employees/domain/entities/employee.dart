class Employee {
  final int id;
  final String name;
  final String designation;
  final String department;
  final DateTime joiningDate;
  final bool isActive;

  Employee({
    required this.id,
    required this.name,
    required this.designation,
    required this.department,
    required this.joiningDate,
    required this.isActive,
  });

  double get yearsOfService {
    final now = DateTime.now();
    final days = now.difference(joiningDate).inDays;
    return days / 365.25;
  }

  bool get shouldFlagGreen => isActive && yearsOfService > 5;
}
