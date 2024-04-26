import 'package:flutter/material.dart';
import 'package:flutter_application_1/items/RoundedButton.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          actions: [
            Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                Text(
                  "₹",
                  style: TextStyle(
                      color: Color.fromRGBO(15, 15, 15, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "988K",
                  style: TextStyle(
                      color: Color.fromRGBO(15, 15, 15, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 80),
                ),
              ],
            ),
          ],

        ),
        body: Center(
            child: Column(
          children: [
              const Text(
              "Total Balance",
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(60, 20, 20, 20),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
               Text(
                "₹",
                style: TextStyle(
                    color: Color.fromRGBO(15, 15, 15, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
                SizedBox(
                  width: 8,
                ),
               Text(
            "988K",
              style: TextStyle(
                  color: Color.fromRGBO(15, 15, 15, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
            ],
            ),

            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  icon: Icons.add_rounded,
                  text: 'Deposit',
                  onPressed: () {
                    // Navigate to RazorpayPaymentScreen when button is clicked

                    Razorpay razorpay = Razorpay();
                    var options = {
                      'key': 'rzp_test_1DP5mmOlF5G5ag',
                      'amount': 100,
                      'name': 'Acme Corp.',
                      'description': 'Fine T-Shirt',
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      'prefill': {
                        'contact': '8888888888',
                        'email': 'test@razorpay.com'
                      },
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                    // razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                    //     handleExternalWalletSelected);
                    razorpay.open(options);
                  },
                ),
                const SizedBox(width: 35),
                RoundedButton(
                  icon: Icons.remove_rounded,
                  text: 'Withdraw',
                  onPressed: () {
                    // Action for Button 2
                    print('Button 2 Clicked');
                  },
                ),
                const SizedBox(width: 35),
                RoundedButton(
                  icon: Icons.arrow_forward_rounded,
                  text: 'Send',
                  onPressed: () {
                    // Action for Button 3
                    print('Button 3 Clicked');
                  },
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    // showAlertDialog(context, "Payment Failed",
    //     "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    print(response.data.toString());
    // showAlertDialog(
    //     context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

//   void handleExternalWalletSelected(ExternalWalletResponse response) {
//     // showAlertDialog(
//     //     context, "External Wallet Selected", "${response.walletName}");
//   }

//    void showAlertDialog(BuildContext context, String title, String message) {
//     // set up the buttons
//     Widget continueButton = ElevatedButton(
//       child: const Text("Continue"),
//       onPressed: () {},
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
}
