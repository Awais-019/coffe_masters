import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
            title: "My great offer of all time",
            description: "Buy 1, get 10 for free"),
        Offer(
            title: "My great offer of all time",
            description: "Buy 1, get 10 for free"),
        Offer(
            title: "My great offer of all time",
            description: "Buy 1, get 10 for free"),
        Offer(
            title: "My great offer of all time",
            description: "Buy 1, get 10 for free"),
        Offer(
            title: "My great offer of all time",
            description: "Buy 1, get 10 for free"),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  const Offer({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        color: Colors.amber.shade50,
        elevation: 7,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
