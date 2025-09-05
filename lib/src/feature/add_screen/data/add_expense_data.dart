import 'package:intl/intl.dart';

class Category {
  final String id;
  final String name;
  final String emoji;

  Category({
    required this.id,
    required this.name,
    required this.emoji,
  });

  factory Category.fromMap(Map<String, dynamic> map, String id) {
    return Category(
      id: id,
      name: map['name'] ?? '',
      emoji: map['emoji'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'emoji': emoji,
    };
  }
}

class Expense {
  final String id;
  final String category;
  final double amount;
  final String note;
  final DateTime date;

  Expense({
    required this.id,
    required this.category,
    required this.amount,
    required this.note,
    required this.date,
  });

  factory Expense.fromMap(Map<String, dynamic> map, String id) {
    return Expense(
      id: id,
      category: map['category'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      note: map['note'] ?? '',
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'amount': amount,
      'note': note,
      'date': date.toIso8601String(),
    };
  }

  String get formattedDate {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}