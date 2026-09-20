import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class GetEmployees {
  final EmployeeRepository repository;

  const GetEmployees(this.repository);

  Future<List<Employee>> call() => repository.getEmployees();
}
