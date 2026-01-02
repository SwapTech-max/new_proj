import 'package:flutter/material.dart';

class EscrowSecuredPayments extends StatelessWidget {
  const EscrowSecuredPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escrow Secured Payments'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Escrow Secured Payments Information'),
      ),
    );
  }
}

