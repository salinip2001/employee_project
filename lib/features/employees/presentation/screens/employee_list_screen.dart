import 'package:flutter/material.dart';
import 'package:employee_directory/core/di/injector.dart';
import 'package:employee_directory/core/theme/app_theme.dart';
import '../../domain/entities/employee.dart';
import '../controllers/employee_list_controller.dart';
import '../widgets/employee_tile.dart';
import '../widgets/empty_state.dart';
import '../widgets/error_state.dart';
import '../widgets/roster_header.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  late final EmployeeListController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Injector.employeeListController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.paper,
          body: FutureBuilder<List<Employee>>(
            future: _controller.futureEmployees,
            builder: (context, snapshot) {
              final employees = snapshot.data ?? [];
              final visible = _controller.applyViewOnlyFilters(employees);

              return RefreshIndicator(
                onRefresh: _controller.refresh,
                color: AppColors.veteran,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: RosterHeader(
                        employees: employees,
                        filter: _controller.filter,
                        onFilterChanged: _controller.setFilter,
                        onSearchChanged: _controller.setQuery,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 12)),
                    if (snapshot.connectionState == ConnectionState.waiting)
                      const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(color: AppColors.veteran),
                        ),
                      )
                    else if (snapshot.hasError)
                      SliverFillRemaining(child: ErrorState(error: snapshot.error.toString()))
                    else if (visible.isEmpty)
                      const SliverFillRemaining(child: EmptyState())
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => EmployeeTile(employee: visible[index]),
                          childCount: visible.length,
                        ),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
