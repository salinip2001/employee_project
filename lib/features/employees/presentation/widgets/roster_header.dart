import 'package:flutter/material.dart';
import 'package:employee_directory/core/theme/app_theme.dart';
import 'package:employee_directory/features/employees/domain/entities/employee.dart';
import 'package:employee_directory/features/employees/domain/entities/roster_filter.dart';

class RosterHeader extends StatelessWidget {
  final List<Employee> employees;
  final RosterFilter filter;
  final ValueChanged<RosterFilter> onFilterChanged;
  final ValueChanged<String> onSearchChanged;

  const RosterHeader({
    super.key,
    required this.employees,
    required this.filter,
    required this.onFilterChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final total = employees.length;
    final active = employees.where((e) => e.isActive).length;
    final veterans = employees.where((e) => e.shouldFlagGreen).length;

    return Container(
      color: AppColors.ink,
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personnel roster',
            style: TextStyle(
              fontFamily: 'serif',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _Stat(label: 'On record', value: '$total'),
              _Divider(),
              _Stat(label: 'Active', value: '$active'),
              _Divider(),
              _Stat(label: '5+ yrs, active', value: '$veterans', accent: true),
            ],
          ),
          const SizedBox(height: 18),
          TextField(
            onChanged: onSearchChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search by name',
              hintStyle: const TextStyle(color: Color(0xB3FFFFFF)),
              prefixIcon: const Icon(Icons.search, color: Colors.white70, size: 20),
              filled: true,
              fillColor: Colors.white.withOpacity(0.08),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _FilterChip(
                label: 'All',
                selected: filter == RosterFilter.all,
                onTap: () => onFilterChanged(RosterFilter.all),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: 'Active',
                selected: filter == RosterFilter.active,
                onTap: () => onFilterChanged(RosterFilter.active),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: 'Veterans',
                selected: filter == RosterFilter.veterans,
                onTap: () => onFilterChanged(RosterFilter.veterans),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final bool accent;
  const _Stat({required this.label, required this.value, this.accent = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: accent ? AppColors.veteranSoft : Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11.5, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 30,
      margin: const EdgeInsets.only(right: 18),
      color: Colors.white24,
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? AppColors.gold : Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            color: selected ? AppColors.ink : Colors.white70,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
