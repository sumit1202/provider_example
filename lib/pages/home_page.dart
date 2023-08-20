import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Enter your age'),
                      ),
                      onChanged: (value) {
                        provider.checkEligibility(int.parse(value));
                      },
                    ),
                    Text(
                      provider.eligibilityMsg.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: (provider.isEligible == false)
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
