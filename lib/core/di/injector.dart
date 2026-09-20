import 'package:http/http.dart' as http;
import 'package:employee_directory/features/employees/data/datasources/employee_remote_data_source.dart';
import 'package:employee_directory/features/employees/data/repositories/employee_repository_impl.dart';
import 'package:employee_directory/features/employees/domain/usecases/filter_employees.dart';
import 'package:employee_directory/features/employees/domain/usecases/get_employees.dart';
import 'package:employee_directory/features/employees/presentation/controllers/employee_list_controller.dart';
class Injector {
  Injector._();

  static EmployeeListController employeeListController() {
    final dataSource = EmployeeRemoteDataSource(client: http.Client());
    final repository = EmployeeRepositoryImpl(dataSource);

    return EmployeeListController(
      getEmployees: GetEmployees(repository),
      filterEmployees: const FilterEmployees(),
    );
  }
}
