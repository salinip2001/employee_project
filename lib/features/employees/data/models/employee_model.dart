import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required super.id,
    required super.name,
    required super.designation,
    required super.department,
    required super.joiningDate,
    required super.isActive,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      designation: json['designation'] as String? ?? '',
      department: json['department'] as String? ?? '',
      joiningDate: DateTime.parse(json['joining_date'] as String),
      isActive: json['is_active'] == true || json['is_active'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'department': department,
      'joining_date': joiningDate.toIso8601String().split('T').first,
      'is_active': isActive,
    };
  }
}
