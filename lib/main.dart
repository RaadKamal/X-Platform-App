import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numberOfBags = 0;
  int _numberOfRings = 0;

  void _addBag() {
    setState(() {
      _numberOfBags++;
    });
  }

  void _addRing() {
    setState(() {
      _numberOfRings++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalItems = _numberOfBags + _numberOfRings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart, size: 28),
                const SizedBox(width: 8),
                Text('$totalItems', style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProductRow(
                name: 'Bag',
                imagePath: 'Images/item1.jpg',
                count: _numberOfBags,
                onPressed: _addBag,
              ),
              const SizedBox(height: 32),
              _ProductRow(
                name: 'Ring',
                imagePath: 'Images/item2.jpg',
                count: _numberOfRings,
                onPressed: _addRing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  const _ProductRow({
    required this.name,
    required this.imagePath,
    required this.count,
    required this.onPressed,
  });

  final String name;
  final String imagePath;
  final int count;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Image.asset(
          imagePath,
          height: 200,
          width: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 32),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 12),
              Text('In cart: $count', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              TextButton(
                onPressed: onPressed,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}