import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class NewItem extends StatefulWidget {
  final Function()? onAdded; 

  const NewItem({super.key, this.onAdded});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {

  // Default settings
  static const defautName = "New grocery";
  static const defaultQuantity = 1;
  static const defaultCategory = GroceryCategory.fruit;

  // Inputs
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  GroceryCategory _selectedCategory = defaultCategory;

  @override
  void initState() {
    super.initState();

    // Initialize intputs with default settings
    _nameController.text = defautName;
    _quantityController.text = defaultQuantity.toString();
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose the controlers
    _nameController.dispose();
    _quantityController.dispose();
  }

  void onReset() {
    // Will be implemented later - Reset all fields to the initial values
  }

  void onAdd() {
    // Will be implemented later - Create and return the new grocery
    _nameController.text;
    _quantityController.text;
    _selectedCategory;

    final newGrocery = Grocery(
      id: 'd',
      name: _nameController.text,
      quantity: int.parse(_quantityController.text),
      category: _selectedCategory,
    );

    groceryItems.add(newGrocery);

    widget.onAdded?.call();
    
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(label: Text('Quantity')),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<GroceryCategory>(
                    initialValue: _selectedCategory,
                    items: [
                      DropdownMenuItem(
                        value: GroceryCategory.vegetables,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.vegetables.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.vegetables.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.fruit,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.fruit.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.fruit.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.meat,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.meat.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.meat.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.dairy,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.dairy.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.dairy.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.carbs,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.carbs.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.carbs.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.sweets,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.sweets.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.sweets.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.spices,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.spices.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.spices.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.convenience,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.convenience.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.convenience.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.hygiene,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.hygiene.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.hygiene.label),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: GroceryCategory.other,
                        child: Row(
                          children: [
                            Container(color: GroceryCategory.other.color, width: 15, height: 15),
                            const SizedBox(width: 8),
                            Text(GroceryCategory.other.label),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onReset, child: const Text('Reset')),
                ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
