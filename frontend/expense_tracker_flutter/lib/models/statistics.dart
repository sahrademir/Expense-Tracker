class CategoryStatistic{

  final String category;

  final double amount;

  CategoryStatistic({

    required this.category,

    required this.amount,

  });

  factory CategoryStatistic.fromJson(
      Map<String,dynamic> json){

    return CategoryStatistic(

      category: json["category"],

      amount: double.parse(
        json["amount"].toString(),
      ),

    );

  }

}

class Statistics{

  final double income;

  final double expense;

  final double balance;

  final List<CategoryStatistic> incomes;

  final List<CategoryStatistic> expenses;

  Statistics({

    required this.income,

    required this.expense,

    required this.balance,

    required this.incomes,

    required this.expenses,

  });

  factory Statistics.fromJson(
      Map<String,dynamic> json){

    return Statistics(

      income: double.parse(
        json["total_income"].toString(),
      ),

      expense: double.parse(
        json["total_expense"].toString(),
      ),

      balance: double.parse(
        json["balance"].toString(),
      ),

      incomes:
          (json["income"] as List)
              .map(
                (e)=>CategoryStatistic.fromJson(e),
              )
              .toList(),

      expenses:
          (json["expenses"] as List)
              .map(
                (e)=>CategoryStatistic.fromJson(e),
              )
              .toList(),

    );

  }

}