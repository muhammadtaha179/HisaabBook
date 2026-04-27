import 'package:flutter/material.dart';

class AddHisaabEntry extends StatelessWidget {
  var color = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Transaction",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            // Row to choose from Income and Expense
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("Income", style: TextStyle(fontSize: 18)),
                Text("Expense", style: TextStyle(fontSize: 18)),
              ],
            ),

            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.grey[400],
                child: Padding(
                  padding: EdgeInsets.all(45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Amount(Rs.)"),
                      Text(
                        "0.00",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
