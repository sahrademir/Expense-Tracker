import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/expense.dart';
import '../models/statistics.dart';

class ApiService {

  static const String baseUrl =
      "http://127.0.0.1:8000";


// ==========================
  // TOKEN
  // ==========================

  static Future<void> saveToken(String token) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "token",
      token,
    );
  }


  static Future<String?> getToken() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("token");
  }



  static Future<Map<String,String>> getHeaders() async {

    final token = await getToken();


    return {

      "Content-Type": "application/json",

      if(token != null)
        "Authorization":"Bearer $token"

    };

  }


  // ==========================
  // AUTH
  // ==========================


  static Future<User?> register(
      String username,
      String email,
      String password,
      ) async {


    final response = await http.post(

      Uri.parse("$baseUrl/users/register"),

      headers:{
        "Content-Type":"application/json"
      },

      body:jsonEncode({

        "username":username,
        "email":email,
        "password":password

      })

    );


    if(response.statusCode == 200 ||
       response.statusCode == 201){

      return User.fromJson(
        jsonDecode(response.body)
      );

    }


    throw Exception(
      "Register failed"
    );

  }

  static Future<String?> login(
      String email,
      String password,
      ) async {

        final response = await http.post(

      Uri.parse(
        "$baseUrl/users/login"
      ),

      headers:{
        "Content-Type":"application/x-www-form-urlencoded"
      },


      body:{

        "username":email,
        "password":password

      }

    );


    if(response.statusCode == 200){


      final data=jsonDecode(response.body);


      final token=data["access_token"];


      await saveToken(token);


      return token;

    }


    throw Exception(
      "Login failed"
    );

  }


  // ==========================
  // EXPENSES
  // ==========================


  static Future<List<Expense>> getExpenses() async {


    final response = await http.get(

      Uri.parse(
        "$baseUrl/expenses"
      ),

      headers:await getHeaders()

    );

    if(response.statusCode==200){


      final List data=jsonDecode(response.body);


      return data
          .map(
            (e)=>Expense.fromJson(e)
      )
          .toList();


    }

    throw Exception(
      "Cannot fetch expenses"
    );

  }

  static Future<Expense> createExpense(
      Expense expense
      ) async {


    final response = await http.post(

      Uri.parse(
        "$baseUrl/expenses"
      ),

      headers:await getHeaders(),

      body:jsonEncode(
          expense.toJson()
      )

    );

    if(response.statusCode==200 ||
       response.statusCode==201){


      return Expense.fromJson(
        jsonDecode(response.body)
      );


    }

    throw Exception(
      "Create expense failed"
    );


  }






  static Future<Expense> updateExpense(
      int id,
      Expense expense
      ) async {


    final response = await http.put(

      Uri.parse(
        "$baseUrl/expenses/$id"
      ),

      headers:await getHeaders(),

      body:jsonEncode(
        expense.toJson()
      )

    );



    if(response.statusCode==200){


      return Expense.fromJson(
        jsonDecode(response.body)
      );


    }


    throw Exception(
      "Update failed"
    );


  }







  static Future<void> deleteExpense(
      int id
      ) async {


    final response = await http.delete(

      Uri.parse(
        "$baseUrl/expenses/$id"
      ),

      headers:await getHeaders()

    );



    if(response.statusCode!=200 &&
       response.statusCode!=204){

      throw Exception(
        "Delete failed"
      );

    }


  }







  // ==========================
  // STATISTICS
  // ==========================


  static Future<Statistics> getStatistics() async {


    final response = await http.get(

      Uri.parse(
        "$baseUrl/statistics"
      ),

      headers:await getHeaders()

    );



    if(response.statusCode==200){


      return Statistics.fromJson(
        jsonDecode(response.body)
      );


    }


    throw Exception(
      "Statistics error"
    );

  }







  // ==========================
  // PROFILE
  // ==========================


  static Future<User> getProfile() async {


    final response = await http.get(

      Uri.parse(
        "$baseUrl/users/profile"
      ),

      headers:await getHeaders()

    );



    if(response.statusCode==200){


      return User.fromJson(
        jsonDecode(response.body)
      );


    }


    throw Exception(
      "Profile error"
    );


  }







  static Future<User> updateProfile(
      User user
      ) async {


    final response = await http.put(

      Uri.parse(
        "$baseUrl/users/profile"
      ),

      headers:await getHeaders(),

      body:jsonEncode(
        user.toJson()
      )

    );



    if(response.statusCode==200){


      return User.fromJson(
        jsonDecode(response.body)
      );


    }


    throw Exception(
      "Update profile failed"
    );


  }



  static Future<void> changePassword(
      String oldPassword,
      String newPassword
      ) async {


    final response = await http.put(

      Uri.parse(
        "$baseUrl/users/change-password"
      ),

      headers:await getHeaders(),


      body:jsonEncode({

        "old_password":oldPassword,

        "new_password":newPassword

      })

    );



    if(response.statusCode!=200){

      throw Exception(
        "Password change failed"
      );

    }


  }



}