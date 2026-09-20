import '../entities/employee.dart';
import '../entities/roster_filter.dart';

class FilterEmployees {
  const FilterEmployees();

  List<Employee> call(
    List<Employee> employees, {
    required RosterFilter filter,
    required String query,
  }) {
    
    var result = employees;
    if (filter == RosterFilter.active) {
      result = result.where((e) => e.isActive).toList();
    } else if (filter == RosterFilter.veterans) {
      result = result.where((e) => e.shouldFlagGreen).toList();
    }
    if (query.trim().isNotEmpty) {
      final q = query.trim().toLowerCase();
      result = result.where((e) => e.name.toLowerCase().contains(q)).toList();
    }
    return result;
  }
}
