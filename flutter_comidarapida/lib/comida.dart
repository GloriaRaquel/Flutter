import 'package:flutter/material.dart';
import 'package:flutter_comidarapida/bebida.dart';
import 'package:flutter_comidarapida/main.dart';


class ComidaR extends StatelessWidget {
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
                  Text("Comida Rapida de la Casa",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
                SizedBox(
                  height:510,
                        child:  ListView.builder(
              itemCount: 23,
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
                        child: Image.asset('assets/imag/Comida$index.jpg',),
                        ),
                        ),
                        Text('Especialidad #$x',style: TextStyle(color: Colors.blue.shade300,fontSize: 20,)),
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
      builder: (context) => DetailPage2(index: index),
    );
    Navigator.push(context, route);
  }
}
//
List Hamburguesa=["Burro Especial T","Burro Ahogado","Big Burrito","Hotdog Tradicional","Hotdog Americano","Combo Hotdog","Pizz de Carne","Pizza Pepperoni","Pizza Hongos","Pizza Salami","Alitas de pollo","Pc Chicken","Crsipy Chicken","Chicken Ensalda","Torta de Jamon","TMixta","T de Carne","TSuper","Ensalada","Aros de Cebolla","PapasFritas","Nugget","Cheese Fries",];

List Ingre=[" Carne de pollo \n Carne de Res \n Queso Chedar\n  Aguacate",
"\n Aguacte cebolla\n Queso crema  \n Salsa Especial \n carnde de pollo ",
"Salsa Natural \n Carne de pollo \n Queso Chedar\n Vegetales\n Frijoles", 
"salchicha\n Mostaza\n  salsa cátsup\n Pan para hot dog ", 
"Salchicha de pavo\n Tiras delgadas de queso amarillo  \n Mayonesa\n Pan para hot dog", 
"Hotdog Americano\n Hotdog Ranchero \n Hotdog Nacho \n 3 Papas Fritas",
" carne picada 100g\n  Masa de pizza  \n Salsa de tomate\n 100g mozzarella",
" Pepperoni100g \n  Masa de pizza  \n Salsa de tomate  \n  100g mozzarella ",
" Hongos 100g \n  Masa de pizza  \n Salsa de tomate\n  100g mozzarella " ,
"Salami 100g \n  Masa de pizza  \n Salsa de tomate  \n  100g mozzarella ",
"4 alitas \n enpenizadas  \n Salsa \1Ensalada",
"9 Piezas\n 8 panes\n salsa de tomate ",
" 5 Piezas\n 4 panes  \n salsa de tomate ",
"Ensalda\n 5 Piezas \n Papas Fritas",
"Jamon\nfrijoles \n Mayonesa \n Aguacate ",
"Jamon Salchicha salami  \n frijoles \n Mayonesa \n Aguacate ",
"Carne \nfrijoles \n Mayonesa \n Aguacate ",
"Pollo carne jamon salchicha \nfrijoles \n Mayonesa \n Aguacate ",
"Verduras Frescas\n   ",
"cebollas cortadas anillo \n  rebozados en harina con algo de levadura \n y posteriormente son fritos en aceite",
"papas en rodajas o en forma de bastones\n y friéndolas en aceite",
"carne de pollo\n es moldeado\n apanado\n pre frito  ",
"patatas fritas\n  aderezadas con salsa ranchera\n  bacon y queso"];

List Precios=["\$3.75","\$4.25","\$3.25","\$2.00","\$2.50","\$10.00","\$5.00","\$5.00","\$5.00","\$5.00","\$3.70","\$10.20","\$9.00","\$5","\$2.00","\$3.00","\$3.50","\$4.00","\$2.00","\$2.00","\$2.00","\$2.00","\$2.50"];

class DetailPage2 extends StatelessWidget {
  final int index;

  const DetailPage2({required this.index});

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
                          image: AssetImage('assets/imag/Comida$index.jpg',),
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