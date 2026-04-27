// Expense styling
import 'package:flutter/material.dart';
import 'package:loan_app/add_hisaab.dart';
import 'package:loan_app/hisaab_entry.dart';
import 'package:loan_app/main.dart';

// import 'login.dart' show Login;
// import 'sign_up.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // List<Widget> btmNavItems = [Home(), Login(),Sign_Up() ];
  // List<ListItem> items=[
  // ListItem("Salary", "12 April 2026", "+5000", Icon(Icons.money)),
  // ListItem("Grocey", "15 March 2026", "+3000", Icon(Icons.local_grocery_store)),
  // ListItem("Electricy Bill", "10 May 2025", "+2000", Icon(Icons.electric_bolt)),

  // ];
  var data = [];

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    data = await dbHelper.readAllEntries();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.lightBlueAccent),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.lightBlueAccent),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report, color: Colors.lightBlueAccent),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.lightBlueAccent),
            label: "Profile",
          ),
        ],
      ),
      appBar: AppBar(title: Text("HisaabBook")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: ListTile(
                title: Text(
                  "Muhammad Taha",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "taha.cs@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),

                leading: CircleAvatar(child: Text("Muhammad Taha"[0])),
              ),
            ),
            Text("Main Menue"),
            DrawerItemsStyle(Icon(Icons.home), "Home"),
            DrawerItemsStyle(Icon(Icons.trending_up), "Money"),
            DrawerItemsStyle(Icon(Icons.trending_down), "Expenses"),
            DrawerItemsStyle(Icon(Icons.history), "History"),
            DrawerItemsStyle(Icon(Icons.logout), "Logout"),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add_Hisaab()),
          );
          readAllData();
        },

        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: RefreshIndicator(
        onRefresh: readAllData,
        child: Column(
          children: [
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "As-slamu Alaykum",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Muhammad Taha",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  color: Colors.white38,
                  margin: EdgeInsets.only(
                    left: 50,
                    right: 50,
                    bottom: 20,
                    top: 20,
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      //Column for the outer card in the front
                      children: [
                        Text(
                          "Total Balance",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "Rs. 452, 00",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              // Two cards inside the main card
                              color: Color(0xFFB8C0FF).withOpacity(0.2),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Text(
                                      "Income",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "+6889",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              // Two cards inside the main card
                              color: Color(0xFFB8C0FF).withOpacity(0.2),

                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Text(
                                      "Expense",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "+6889",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            Colors.lightGreenAccent,
                            Icon(Icons.add),
                            "Income",
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            Colors.pinkAccent,
                            Icon(Icons.add),
                            "Expense",
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            Colors.lightBlueAccent,
                            Icon(Icons.watch_later_outlined),
                            "History",
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          HisaabEntry itemNo = data[index];
                          return InkWell(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    children: [
                                      SimpleDialogOption(
                                        child: Text('Delete'),
                                        onPressed: () {
                                          dbHelper.delete(itemNo);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: ListTile(
                              // leading: Card(
                              //   child: Padding(
                              //     padding: EdgeInsets.all(8),
                              //    child: itemNo.icon,
                              // )),
                              title: Text(itemNo.title),
                              subtitle: Text(itemNo.subtitle),
                              trailing: Text(itemNo.number),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  Color cardColor;
  Icon icon;
  String text;

  ReusableCard(this.cardColor, this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [icon, Text(text)]),
      ),
    );
  }
}

class ListItem {
  String title;
  String subtitle;
  String number;

  // Icon icon;

  ListItem(this.title, this.subtitle, this.number);
}

// Reusable Drawer Item Row
class DrawerItemsStyle extends StatelessWidget {
  Icon icon;
  String title;

  DrawerItemsStyle(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        spacing: 15,
        children: [
          Card(
            color: Colors.blue,
            child: Padding(padding: EdgeInsets.all(8), child: icon),
          ),
          Text(title),
        ],
      ),
    );
  }
}
