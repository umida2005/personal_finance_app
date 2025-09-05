import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_app/src/feature/add_screen/data/add_expense_data.dart';
import 'package:personal_finance_app/src/feature/add_screen/domain/add_screen_repository.dart';
import 'package:personal_finance_app/src/feature/add_screen/presentation/ui_wrapper.dart';
import 'package:personal_finance_app/src/feature/add_screen/servise/firebase_database.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class AddExpenseScreen extends StatefulWidget {
  final Expense? expense;
  final String? expenseKey;

  const AddExpenseScreen({Key? key, this.expense, this.expenseKey}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final List<Map<String, String>> categories = [
    {'emoji': '🍕', 'label': 'Ovqat', 'value': 'Ovqat'},
    {'emoji': '🚗', 'label': 'Transport', 'value': 'Transport'},
    {'emoji': '🎬', 'label': "Ko'ngilochar", 'value': "Ko'ngilochar"},
    {'emoji': '🏠', 'label': 'Uy-joy', 'value': 'Uy-joy'},
    {'emoji': '🛒', 'label': 'Xarid', 'value': 'Xarid'},
    {'emoji': '➕', 'label': 'Boshqa', 'value': 'Boshqa'},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddExpenseScreenWrapper(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        body: BlocConsumer<AddExpenseScreenBloc, AddExpenseScreenState>(
          listener: (context, state) {
            if (state.status == AddExpenseStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(widget.expense != null
                      ? 'Xarajat muvaffaqiyatli yangilandi'
                      : 'Xarajat muvaffaqiyatli qo\'shildi'),
                ),
              );
              Navigator.pop(context);
            }

            if (state.status == AddExpenseStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            // Controllerlarni state bilan sinxronlashtirish
            if (_amountController.text != state.amount) {
              _amountController.text = state.amount;
            }
            if (_noteController.text != state.note) {
              _noteController.text = state.note;
            }

            return SafeArea(
              child: Column(
                children: [
                  // Header
                  _buildHeader(context),

                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          // Amount Section
                          _buildAmountSection(context),
                          const SizedBox(height: 40),

                          // Categories Section
                          _buildCategoriesSection(context, state),
                          const SizedBox(height: 30),

                          // Note Section
                          _buildNoteSection(context),
                          const SizedBox(height: 30),

                          // Date Section
                          _buildDateSection(context, state),

                          const SizedBox(height: 40),

                          // Save Button
                          _buildSaveButton(context, state),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            widget.expense != null ? "Xarajatni tahrirlash" : "Xarajat qo'shish",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountSection(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "so'm",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '0',
            ),
            onChanged: (value) {
              context.read<AddExpenseScreenBloc>().add(ChangeAmount(value));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context, AddExpenseScreenState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategoriya',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 15),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.1,
          children: categories.map((category) {
            return _buildCategoryItem(
              context,
              category['emoji']!,
              category['label']!,
              category['value']!,
              state.category == category['value'],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, String emoji, String label, String value, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<AddExpenseScreenBloc>().add(ChangeCategory(value));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? const Color(0xFF667EEA) : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFF667EEA) : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Izoh',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 15),
        Container(
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
          child: TextField(
            controller: _noteController,
            maxLines: 3,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Xarajat haqida izoh...",
            ),
            onChanged: (value) {
              context.read<AddExpenseScreenBloc>().add(ChangeNote(value));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDateSection(BuildContext context, AddExpenseScreenState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sana',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: state.date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (picked != null) {
              context.read<AddExpenseScreenBloc>().add(ChangeDate(picked));
            }
          },
          child: Container(
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
                Text(
                  DateFormat('dd/MM/yyyy').format(state.date),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context, AddExpenseScreenState state) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF667EEA),
            Color(0xFF764BA2),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF667EEA).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: state.status == AddExpenseStatus.loading
              ? null
              : () {
            print('SAVE BOSILDI');
            context.read<AddExpenseScreenBloc>().add(const SubmitExpense());
          },
          child: Center(
            child: state.status == AddExpenseStatus.loading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
              widget.expense != null ? 'Yangilash' : 'Saqlash',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}