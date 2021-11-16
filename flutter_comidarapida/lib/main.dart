import 'package:flutter/material.dart';
import 'package:flutter_comidarapida/bebida.dart';
import 'package:flutter_comidarapida/comida.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transition Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Food Fast"),
      actions: [
        Row(
          children: [
             new IconButton(
            icon: new Icon(Icons.food_bank_outlined),
            tooltip: 'Comida Rapida',
            onPressed: () {
		
             Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return ComidaR();
                  }
                  )
                  );
                  
		},
          ),
          Text("Comidas R."),
          
         
          new IconButton(
            icon: new Icon(Icons.local_drink),
            tooltip: 'Bebidas',
            onPressed: () {
               Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return Bebida();
                  }
                  )
                  );
            },
          ),
           Text("Bebidas"),

          ],
        ),
       // Menú no oculto
      
              
      ],
      ),
      body: Container(
        
        child: Column(
          children: [
            SingleChildScrollView(
             child: Column(
              mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Hamburguesas de la Casa",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                SizedBox(
                  height:510,
                        child:  ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                int x=1+index;
              return Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
				        width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                         onTap: () => _openDetail(context, index),
                        child:  Hero(
                        tag: "avatar-$index",
                        child: Image.asset('assets/imag/Burger$index.jpg',),
                        //Image.network("https://picsum.photos/seed/$index/800"),
                        ),
                        ),
                        Text('Hamburguesa #$x',style: TextStyle(color: Colors.blue.shade300,fontSize: 20,)),
                        ],
                      ),
                    ),
                  ),
                ),
                ],
                ),
              );
        
        
            }),

                ),
                ],
              ),
              ),
              ],
              ),
             ),
  
      
      
    );
  }

  _openDetail(context, index) {
    final route = MaterialPageRoute(
      builder: (context) => DetailPage(index: index),
    );
    Navigator.push(context, route);
  }
}

List Hamburguesa=["Hamburguesa Especial","Hamburguesa de Aguacate","Hamburguesa Bacon","Hamburguesa Clasica","Hamburguesa Jalapeña"];

List Ingre=[" Salsa de casa \n Carne de Res \n Queso Chedar\n Vegetales Frescos",
"Carne de Res\n Aguacate\n Queso",
"Salsa de casa \n Carne de Res \n Queso Chedar\n Vegetales Frescos \n Tocino",
"Carne de Res \n Queso Chedar\n Vegetales Frescos",
"Jalapeños \n Carne de Res \n Queso Chedar\n Vegetales Frescos"];

List Precios=["\$5.50","\$4.50","\$6.50","\$3.75","\$4.25"];

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    int x;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
       
              background: 
              Container(
                color:  Colors.white,
                child: Column(
                children: [
                   Hero(
                  tag: "avatar-$index",
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        
                        ),
                        color: Colors.white10,
                        child: Image(
                          height: MediaQuery.of(context).size.height,
                          image: AssetImage('assets/imag/Burger$index.jpg',),
                        ),
                      ),
                    ),
                   ),
                   SizedBox(
                          height: 20,
                        ),
                    Text(Hamburguesa[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                        SizedBox(
                          height: 15,
                        ),
                    Text("Ingredientes ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue.shade600)),
                    SizedBox(
                          height: 10,
                        ),
                    Text(Ingre[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22, color:Colors.red.shade300),),
                     SizedBox(
                          height: 20,
                        ),
                     Text("Precio ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue.shade600)),
                    SizedBox(
                          height: 10,
                        ),
                    Text(Precios[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22, color:Colors.green.shade400),),   
                     SizedBox(
                          height: 40,
                        ),
                 
                     ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add_shopping_cart), label: Text('Comprar')),

                
                ],
                ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}