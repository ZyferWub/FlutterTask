//import 'package:flatap/nextPage.dart';
//import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    title: 'Your Title',
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppStat();
  }
}
class _MyAppStat extends State<MyApp> {
  final productAssetUrl = Data(clothing: 'assets/parka.jpg',price: '£780.00');//assuming selecting a product here would pass these values to the product details scaffold
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold(
    body: Center(
      child: ElevatedButton(
        child:Text('Open App'),
      onPressed: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Secondpage(productImgUrl: productAssetUrl,)),
        );
      },
      )
    )
    )
    );
  }
}
class Secondpage extends StatefulWidget {
  final Data productImgUrl;
  Secondpage({this.productImgUrl});

  @override
  _SecondpageState createState() => _SecondpageState();
}
class _SecondpageState extends State<Secondpage> {
  String selectedImgURL;
  String productOnDisplay;
  int chosenColour;  //for index
  int chosenSize; //index
  String textSize = '';
  String textColour = '';
  int availableQuantity = 0;
  final information = Data(clothing: "assets/parka.jpg");
  List<bool> _colour = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    chosenColour = 0;
    chosenSize = 0;
    print('${widget.productImgUrl.clothing}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Ericson Parka'),
      ),
      body: ListView(
      children: [
        Container(
          child: Column(
            children: <Widget>[
              Container(
              child:
              FlatButton(onPressed: (){
                Navigator.push(
                context,MaterialPageRoute(builder: (context)=> ProductPreviewPage(productImgUrl: widget.productImgUrl.clothing,)),);
                },padding:EdgeInsets.all(0.0),child:Image.asset('${widget.productImgUrl.clothing}',)),
              ),
              Text('• • • •'),
            ],
          ),
        ),
        Center(
          child:
          Text('${widget.productImgUrl.price}'),
        ),
        Center(
          child:
              Text('Selected colour:'+'$textColour'),
        ),
        Center(
          child: ToggleButtons(
            children:<Widget> [
                   //This section can be replaced with icon buttons for the image button effect
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenColour=0;widget.productImgUrl.clothing='assets/parka.jpg';updatePage();textColour='Blue';},child:Text('Blue')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenColour=1;widget.productImgUrl.clothing='assets/parka2.jpg';updatePage();textColour='Green';},child:Text('Green')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenColour=2;updatePage();textColour='Red';},child:Text('Red')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenColour=3;updatePage();textColour='Violet';},child:Text('Violet')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenColour=4;updatePage();textColour='Black';},child:Text('Black')),),
            ],
            isSelected: _colour,
          ),
        ),
        Center(
            child:
                  Text('Selected Size:'+ '$textSize'),
        ),
        Container(
          //padding: EdgeInsets.only(bottom: 20.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenSize=0;updatePage();textSize='XS';},child:Text('XS')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenSize=1;updatePage();textSize='S';},child:Text('S')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenSize=2;updatePage();textSize='M';},child:Text('M')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenSize=3;updatePage();textSize='L';},child:Text('L')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenSize=4;updatePage();textSize='XL';},child:Text('XL')),),
              ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){chosenSize=5;updatePage();textSize='XXL';},child:Text('XXL')),),
              ],
          ),
        ),
        Center(
            child:
            Text('Remaining:'+ '$availableQuantity'.toString()),
        ),
        Center(
          child:
           ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){Navigator.push(
             context,MaterialPageRoute(builder: (context) => ProductDescriptionPage()),);},child:Text('Description')),),
        ),
        Center(
          child:
          ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){},child:Text('POS')),),
        ),
        SizedBox(
          width: double.infinity,
          child:
          ButtonTheme(minWidth: 50, child:ElevatedButton(onPressed: (){},child:Text('BUY')),),
        ),
        Center(
          child:
          ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){},child:Text('OfferToKnow')),),
        ),
        Center(
          child:
          ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){},child:Text('Returns and refunds')),),
        ),
      ],
      )
    );
  }
  void updatePage()
  {
  /*  print(chosenSize);                   //Debugging purposes
    print(chosenColour);
    print('=====================');
   */
     setState((){});
    availableQuantity = information.transactionHere(chosenColour, chosenSize);
  }

}
class Data{ //Each colored parka has its own list. this class purposes is to instantiate databases
  String clothing;
  String price;
  var colourChosen;
  int quantity;
  var productBlue = new List(6);
  var productGreen = new List(6);
  var productRed = new List(6);
  var productViolet = new List(6);
  var productGray = new List(6);
  var bLeh = new List(5);
  void initializeProducts()
  {
    productBlue = [34,7,53,66,44,89];
    productGreen = [34,67,88,45,95,25];
    productRed = [55,65,85,55,75,25];
    productViolet = [85,25,95,65,68,85];
    productGray = [15,35,45,65,775,95];
    bLeh = [productBlue,productGreen,productRed,productViolet,productGray];
  }
  int transactionHere(x,y)
  {
    initializeProducts();
    colourChosen = bLeh[x];
    quantity = colourChosen[y];
    return quantity;
  }
  Data({this.clothing,this.price});
}
class ProductDescriptionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Description"),
      ),
      body: Column(
        children: [
          Text('Description text here:'),
          Placeholder(fallbackHeight: 300,)
        ],
      ),
    );
  }
}
class ProductPreviewPage extends StatefulWidget {
  String productImgUrl;
  ProductPreviewPage({this.productImgUrl});

  @override
  _ProductPreviewPageState createState() => _ProductPreviewPageState();
}
class _ProductPreviewPageState extends State<ProductPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductPreview"),
      ),
      body: Column(
        children: <Widget>[
          Text('Content here'),
          Image.asset('${widget.productImgUrl}'),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){widget.productImgUrl ='assets/parka2.jpg';print(widget.productImgUrl);updatePage();},child:Text('Front')),),
                ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){widget.productImgUrl='assets/back.jpg';print(widget.productImgUrl);updatePage();},child:Text('Back')),),
                ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){},child:Text('Side')),),
                ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){},child:Text('Diagonal')),),
                ButtonTheme(minWidth: 50, child:FlatButton(onPressed: (){},child:Text('Zoomed')),),

                //===================================
                //OOP is not applied on this page
                //===================================

              ])
        ],
      ),
    );
  }
  void updatePage()
  {
    setState((){});
  }
}
//==============================class testing below==================================
