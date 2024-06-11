import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../components/custom_text.dart';
import '../../../widgets/custom_bottom_bar.dart';

class creditCard extends StatefulWidget {
  const creditCard({super.key});

  @override
  State<creditCard> createState() => _creditCardState();
}

class _creditCardState extends State<creditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void onCreditCardModelChange(CreditCardModel? creditCardModel){
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      expiryDate = creditCardModel.expiryDate;
      cvvCode = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
        ),
        title: TextForTitleL(data: 'CreditCard'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:24.0),
        child: Column(
          children: [
            SizedBox(),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode, 
              showBackView: showBackView, 
              obscureCardNumber: true,
              obscureCardCvv: true, 
              isHolderNameVisible: true,
              isSwipeGestureEnabled: true,
              cardType: CardType.mastercard,
              onCreditCardWidgetChange: (CreditCardBrand ) { },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate, 
                        cardHolderName: cardHolderName, 
                        cvvCode: cvvCode, 
                        obscureNumber: true,
                        obscureCvv: true, 
                        isHolderNameVisible: true,
                        isExpiryDateVisible: true,
                        formKey: _formKey,
                        onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                        width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const CustomBottomBar()));
                    print('Valid!');
                  }
                  else{
                    print('Invalid!');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color(0xffF5903F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
                    ],
                  ),
                )
                ),
          ],
        ),
      ),
    );
  }
}