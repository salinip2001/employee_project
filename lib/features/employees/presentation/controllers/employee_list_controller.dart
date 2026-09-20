import 'package:flutter/foundation.dart';
import '../../domain/entities/employee.dart';
import '../../domain/entities/roster_filter.dart';
import '../../domain/usecases/filter_employees.dart';
import '../../domain/usecases/get_employees.dart';


class EmployeeListController extends ChangeNotifier {
  final GetEmployees _getEmployees;
  final FilterEmployees _filterEmployees;

  EmployeeListController({
    required GetEmployees getEmployees,
    required FilterEmployees filterEmployees,
  })  : _getEmployees = getEmployees,
        _filterEmployees = filterEmployees {
    _futureEmployees = _getEmployees();
  }

  late Future<List<Employee>> _futureEmployees;
  RosterFilter _filter = RosterFilter.all;
  String _query = '';

  Future<List<Employee>> get futureEmployees => _futureEmployees;
  RosterFilter get filter => _filter;
  String get query => _query;

  Future<void> refresh() async {
    _futureEmployees = _getEmployees();
    notifyListeners();
    await _futureEmployees;
  }

  void setFilter(RosterFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    notifyListeners();
  }

  List<Employee> applyViewOnlyFilters(List<Employee> employees) {
    return _filterEmployees(employees, filter: _filter, query: _query);
  }
}
