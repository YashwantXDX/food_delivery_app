import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_in_progress_page.dart';
import 'package:gap/gap.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  final double amount;
  const RazorPayPage(this.amount, {super.key});

  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {

  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();


  void openCheckout(amount) async{
    amount = widget.amount * 100;
    var options = {
      'key' : 'rzp_test_1DP5mmOlF5G5ag',
      'amount' : amount,
      'name' : 'Yashwant Choure',
      'prefill' : {'contact' : '8319785116', 'email' : 'yashwant.choure73546@gmail.com'},
      'external' : {
        'wallets' : ['paytm','phonepe']
      }
    };

    try{
      _razorpay.open(options);
    }

    catch(e){
      debugPrint('Error : e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryProgressPage(),));
  }

  void handlePaymentFailure(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Payment Failure " + response.message!);
  }

  void handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet" + response.walletName!,toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Amount To Be Paid : ${widget.amount}",style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.inversePrimary),),

            const Gap(100),

            MyButton(onTap: () => openCheckout(widget.amount), text: "Make Payment"),
          ],
        ),
      ),
    );
  }
}
