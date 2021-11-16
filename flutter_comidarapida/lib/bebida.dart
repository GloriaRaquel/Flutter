import 'package:flutter/material.dart';
import 'package:flutter_comidarapida/comida.dart';
import 'package:flutter_comidarapida/main.dart';



class Bebida extends StatelessWidget {
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
            onPressed: () {
		
             Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return HeroApp();
                  }
                  )
                  );
                  
		},
          ),
          Text("Hamburguesas"),
          
         
          new IconButton(
            icon: new Icon(Icons.food_bank_sharp),
            tooltip: 'ComidaR',
            onPressed: () {
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context){
                    return ComidaR();
                  }
                  )
                  );
            },
          ),
           Text("Comida R."),

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
                  Text("Bebida",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                SizedBox(
                  height:510,
                        child:  ListView.builder(
              itemCount: Hamburguesa.length,
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
                        child: Image.asset('assets/imag/Bebida$index.jpg',),
                        ),
                        ),
                        
                        Text('Bebida #$x',style: TextStyle(color: Colors.blue.shade300,fontSize: 20,)),
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
      builder: (context) => DetailPage3(index: index),
    );
    Navigator.push(context, route);
  }
}
//
List Hamburguesa= ["Cafes","Soda","Frescos",];

List Ingre=["Tenemos\n Cafe Americano\n Capuchinos\n el mismo precio","Ofrecemos  ml \n Cocacola\n Fanta\nSprint ","Ofrecmos ml \n Horchata \n Cebada\n Tamarindo "];

List Precios=["\$1.00","\$1.00","\$1.00",];

class DetailPage3 extends StatelessWidget {
  final int index;

  const DetailPage3({required this.index});

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
                          image: AssetImage('assets/imag/Bebida$index.jpg',),
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
                 
                     ElevatedButton.icon(onPressed: (){
                      
                     }, icon: Icon(Icons.add_shopping_cart), label: Text('Comprar')),

                
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