import 'package:flutter/material.dart';

class Concert extends StatefulWidget {
  const Concert({super.key});

  @override
  State<Concert> createState() => _ConcertState();
}

class _ConcertState extends State<Concert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Concert Ticket')),
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Flutter Live',
                            style: TextStyle(
                              fontSize: 32 / 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Band: The Widgets'),
                          SizedBox(height: 8),
                          Text('Date: 8 NOV 2025'),
                          SizedBox(height: 8),
                          Text('Gate: 7'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 210,
                child: const Center(
                  child: Icon(Icons.more_vert, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
