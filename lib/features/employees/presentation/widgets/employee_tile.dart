import 'package:flutter/material.dart';
import 'package:employee_directory/core/theme/app_theme.dart';
import 'package:employee_directory/features/employees/domain/entities/employee.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;

  const EmployeeTile({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final flagged = employee.shouldFlagGreen; 
    final years = employee.yearsOfService;
    final accent = flagged ? AppColors.veteran : AppColors.slate;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      decoration: BoxDecoration(
        color: flagged ? AppColors.veteranSoft : AppColors.card,
        borderRadius: BorderRadius.circular(4),
        border: Border(left: BorderSide(color: accent, width: 4)),
        boxShadow: const [
          BoxShadow(color: Color(0x0F000000), blurRadius: 3, offset: Offset(0, 1)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Initial(name: employee.name, flagged: flagged),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          employee.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (flagged) ...[
                        const SizedBox(width: 6),
                        const Icon(Icons.workspace_premium, size: 16, color: AppColors.veteran),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${employee.designation} · ${employee.department}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _StatusDot(active: employee.isActive),
                      const SizedBox(width: 6),
                      Text(
                        employee.isActive ? 'Active' : 'Inactive',
                        style: const TextStyle(fontSize: 12.5, color: AppColors.ink),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        '${years.toStringAsFixed(1)} yrs',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Initial extends StatelessWidget {
  final String name;
  final bool flagged;
  const _Initial({required this.name, required this.flagged});

  @override
  Widget build(BuildContext context) {
    final letter = name.isNotEmpty ? name[0].toUpperCase() : '?';
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: flagged ? AppColors.veteran : AppColors.ink,
        shape: BoxShape.circle,
      ),
      child: Text(
        letter,
        style: const TextStyle(
          fontFamily: 'serif',
          color: AppColors.card,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool active;
  const _StatusDot({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: active ? AppColors.veteran : AppColors.slate,
        shape: BoxShape.circle,
      ),
    );
  }
}
