
import 'package:flutter/material.dart';
import 'package:flutter_tappay/flutter_tappay.dart';

class TapPayButton extends StatefulWidget {
  const TapPayButton({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TapPayButton();
}

class _TapPayButton extends State<TapPayButton> {

  bool prepared = false;
  bool _totalValid = false;
  String _token = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FlutterTappay payer = FlutterTappay ();
        payer.init(
            appKey: "app_pa1pQcKoY22IlnSXq5m5WP5jFKzoRG58VEXpT7wU62ud7mMbDOGzCYIlzzLF",
            appId: 12348,
            serverType: FlutterTappayServerType.Sandbox
        ).then((_){
          setState(() {
            prepared = true;
          });
        });

        // Valid with your TextFormField (see example)
        payer.validate(
          cardNumber: '4111 1111 1111 1111',
          dueMonth: '01',
          dueYear: '23',
          ccv: '123',
        ).then((validationResult) {
          bool cardValid = validationResult.isCardNumberValid;
          bool dateValid = validationResult.isExpiryDateValid;
          bool ccvValid = validationResult.isCCVValid;
          _totalValid = cardValid && ccvValid && dateValid;
          setState(() {
          });
        });

        // get token
        try {
          TappayTokenResponse response = await payer.sendToken(
            cardNumber: '4111 1111 1111 1111',
            dueYear: '01',
            dueMonth: '23',
            ccv: '123',
          );
          setState(() {
            _token = response.prime;
          });
        } catch(err) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Payment error: ${err.toString()}")
              )
          );
        }
      },
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.grey.shade800, // <-- Button color
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
        minimumSize: const Size(250, 60),
      ),
      child: const Text('加入購物車'),
    );
  }
}