import 'package:flutter/material.dart';
import './grocery_form.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  
  void onCreate() {
    // TODO-4 - Navigate to the form screen using the Navigator push
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => NewItem(
          onAdded: () => setState(() {}),  
        ),
      ),
    );}

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (groceryItems.isNotEmpty) {
      // TODO-1 - Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: groceryItems.length,  // tells the builder how many items to build
        itemBuilder: (context, index) => GroceryItem(grocery: groceryItems[index],),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryItem extends StatelessWidget {
  const GroceryItem({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(color: grocery.category.color, width: 15, height: 15,),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}