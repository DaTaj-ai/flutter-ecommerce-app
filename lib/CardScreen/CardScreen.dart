import 'package:flutter/material.dart';
import 'package:flutterlab3/CardScreen/widgets/SelectedProductItem.dart';

class Cardscreen extends StatelessWidget {
  const Cardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 650,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 36),
                child: Row(
                  children: [
                    Image.asset("assets/images/backicon.png"),
                    SizedBox(width: 110),
                    Text("Card", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
        
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Selectedproductitem();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(color: Color(0xFFBEBEBE), width: 2),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Promo Code",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 44,
                        width: 84,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle promo add
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF6B57),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          child: Text("Add", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _receiptLine('Subtotal', '\$12.20'),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey, thickness: 1),
                    _receiptLine('Tax and Fees', '\$4.10'),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey, thickness: 1),
                    _receiptLine('Delivery', '\$1.00'),
                  ],
                ),
              )
          
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        elevation: 80,
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            child: Container(
              color: Color(0xFFF242731),
              height: 150,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  top: 25,
                  right: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Address",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Avinguda Meridiana, 350, 358, 08027 Barcelona",
                      style: TextStyle(
                        color: Color(0xFF747785),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFF18191D),
        child: Row(
          children: [
           Text("Total" , style: TextStyle(fontSize: 20, color: Color(0xFF747785)), ),
          SizedBox(width: 16),
          Text("\$520",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white)),
            Container(
              padding: EdgeInsets.only(left: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFF6B57),
                  minimumSize: Size(210, 50),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('added successful!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  "Go to checkout",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget _receiptLine(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(fontSize: 20 , color: Color(0xFF646982)) , ),
      Text(value, style: TextStyle(fontSize: 20, color: Color(0xFF646982)) , ),
    ],
  );
}
