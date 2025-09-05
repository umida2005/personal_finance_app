import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_app/src/feature/add_screen/presentation/ui.dart';
import 'package:personal_finance_app/src/feature/main_screen/presentation/ui_wrapper.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
        context.read<MainScreenBloc>().add(LoadExpenseList());

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenWrapper(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(),
                const SizedBox(height: 30),
      
                // Balance Card
                _buildBalanceCard(),
                const SizedBox(height: 30),
      
                // Action Buttons
                _buildActionButtons(context),
                const SizedBox(height: 30),
      
                // Recent Transactions
                _buildTransactionsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Salom, Islom!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          DateFormat('dd MMMM yyyy').format(DateTime.now()),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        double totalIncome = 0;
        double totalExpense = 0;
        double totalBalance = 0;

        if (state.expense != null && state.expense!.isNotEmpty) {
          for (var expense in state.expense!) {
            if (expense.date == 'income') {
              totalIncome += expense.amount;
            } else {
              totalExpense += expense.amount;
            }
          }
          totalBalance = totalIncome - totalExpense;
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF667EEA),
                Color(0xFF764BA2),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF667EEA).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Umumiy balans',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${NumberFormat('#,###').format(totalBalance)} so'm",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daromad: +${NumberFormat('#,###').format(totalIncome)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Xarajat: -${NumberFormat('#,###').format(totalExpense)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.add, "Qo'shish", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
        }),
        _buildActionButton(Icons.bar_chart, "Statistika", () {
        }),
        _buildActionButton(Icons.track_changes, "Maqsad", () {}),
        _buildActionButton(Icons.settings, "Sozlamalar", () {}),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onclick) {
    return Column(
      children: [
        GestureDetector(
          onTap: onclick,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 24,
              color: const Color(0xFF667EEA),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionsSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "So'nggi operatsiyalar",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                return _buildTransactionList(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(MainScreenState state) {
    if (state.status == MainScreenStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == MainScreenStatus.failure) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Xatolik: ${state.error ?? "Noma'lum xatolik"}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<MainScreenBloc>().add(LoadExpenseList());
              },
              child: const Text('Qayta urinish'),
            ),
          ],
        ),
      );
    }

    if (state.expense == null || state.expense!.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Hozircha operatsiyalar mavjud emas',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.expense!.length,
      itemBuilder: (context, index) {
        final expense = state.expense![index];
        return _buildTransactionItem(
          _getIconForCategory(expense.category),
          _getColorForCategory(expense.category),
          expense.category,
          DateFormat('dd MMM, HH:mm').format(expense.date),
          '${expense.date == 'income' ? '+' : '-'}${NumberFormat('#,###').format(expense.amount)} so\'m',
          expense.date != 'income',
        );
      },
    );
  }

  Widget _buildTransactionItem(
      IconData icon,
      Color iconColor,
      String title,
      String subtitle,
      String amount,
      bool isExpense,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isExpense ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'food':
      case 'ovqat':
        return Icons.restaurant;
      case 'transport':
        return Icons.directions_bus;
      case 'coffee':
      case 'kofe':
        return Icons.local_cafe;
      case 'shopping':
        return Icons.shopping_cart;
      case 'entertainment':
        return Icons.movie;
      case 'health':
        return Icons.local_hospital;
      case 'education':
        return Icons.school;
      case 'salary':
      case 'income':
        return Icons.attach_money;
      default:
        return Icons.money_off;
    }
  }

  Color _getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'food':
      case 'ovqat':
        return Colors.orange;
      case 'transport':
        return Colors.blue;
      case 'coffee':
      case 'kofe':
        return Colors.green;
      case 'shopping':
        return Colors.purple;
      case 'entertainment':
        return Colors.pink;
      case 'health':
        return Colors.red;
      case 'education':
        return Colors.blueAccent;
      case 'salary':
      case 'income':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}