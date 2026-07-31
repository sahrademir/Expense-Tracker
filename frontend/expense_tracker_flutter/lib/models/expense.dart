class Expense {

  final int id;
  final String title;
  final double amount;
  final String category;
  final String type;
  final String description;

  Expense({

    required this.id,

    required this.title,

    required this.amount,

    required this.category,

    required this.type,

    required this.description,

  });

  factory Expense.fromJson(
      Map<String,dynamic> json){

    return Expense(

      id: json["id"],

      title: json["title"],

      amount: double.parse(
        json["amount"].toString(),
      ),

      category: json["category"],

      type: json["type"],

      description: json["description"],

    );

  }
    Map<String, dynamic> toJson(){

    return {

      "title": title,

      "amount": amount,

      "category": category,

      "type": type,

      "description": description,

    };

  }


}