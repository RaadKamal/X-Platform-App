import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
        toolbarHeight: 80,
        actions: [
          const Spacer(),
           const Spacer(),
            const Spacer(),
             const Spacer(),
              const Spacer(),
               const Spacer(),
                const Spacer(),
                 const Spacer(),
           IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 40,

           ),
            onPressed: () {
              // Handle shopping cart button press
            },
           )
        ],
      
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
           [
            Row(children: [
              const Spacer(),
              const Spacer(),
              Image.asset(
                height: 200,
                width: 150,
                )
              consr SizedBox(width: 40),
              Expanded(child: Column(
                children: [
                  const Text ("Bag", style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 20),
                  TextButton(onPressed: onPressed(){
                    setState(() {
                      _Model.numberOfBags++;
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),                 
                    foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),            
                  ),
                  child: const Text("Add to Cart")
                  style: TextStyle(fontSize: 15)
                  ),
                 )
                ],
              ),
              )
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
