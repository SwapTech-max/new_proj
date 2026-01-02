import 'package:flutter/material.dart';

class PeerToPeer extends StatelessWidget {
  const PeerToPeer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peer to Peer'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text('Peer to Peer Information'),
      ),
    );
  }
}

