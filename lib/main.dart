import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 196, 236, 17)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Learning Stream Builder'),
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
  // Cria uma stream que emite números aleatórios.
  final stream = Stream.periodic(
    const Duration(seconds: 5),
    (_) => Random().nextInt(100),
  );

  @override

  // Cria um widget que mostra o último número emitido pela stream.
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),

        //widget Column para controlar alnhamento na vertical
        body: Column(
          //Alinhar o resultado no centro da tela
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Numeros"),
            Center(
              child: StreamBuilder<int>(
                stream: stream,
                builder: (context, snapshot) {
                  // Se a stream não tiver dados, mostre um texto informativo.
                  if (!snapshot.hasData) {
                    return const Text('Carregando...');
                  }

                  // Mostre o último número emitido pela stream.
                  return Text('${snapshot.data}');
                },
              ),
            ),
          ],
        ));
  }
}
