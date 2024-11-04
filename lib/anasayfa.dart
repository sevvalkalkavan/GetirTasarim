import 'package:flutter/material.dart';
import 'package:getir/kategori.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Kategori>> yukle() async{
    var kategoriListesi = <Kategori>[];

    var k1 = Kategori(id: 1, name: "Atıştırmalık", resim: "atistirmalik.png");
    var k2 = Kategori(id: 2, name: "Bebek", resim: "bebek.png");
    var k3 = Kategori(id: 3, name: "Çiçek", resim: "cicekci.jpeg");
    var k4 = Kategori(id: 3, name: "Dondurma", resim: "dondurma.png");
    var k5 = Kategori(id: 5, name: "Ev Bakım", resim: "evbakim.png");
    var k6 = Kategori(id: 6, name: "Evcil Hayvan", resim: "evcilhayvan.png");
    var k7 = Kategori(id: 7, name: "Ev Yaşam", resim: "fırından.png");
    var k8 = Kategori(id: 8, name: "Fırından", resim: "evyasam.png");
    var k9 = Kategori(id: 9, name: "Fit Form", resim: "fitform.png");
    var k10 = Kategori(id: 10, name: "Kahvaltılık", resim: "kahvaltilik.png");
    var k11 = Kategori(id: 11, name: "Kazandıranlar", resim: "kazandıranlar.jpeg");
    var k12 = Kategori(id: 12, name: "Kişisel Bakım", resim: "kisiselbakim.png");
    var k13 = Kategori(id: 13, name: "Meyve Sebze", resim: "meyvesebze.png");
    var k14 = Kategori(id: 14, name: "İçecek", resim: "suicecek.png");
    var k15 = Kategori(id: 15, name: "Süper İkili", resim: "superikili.jpeg");
    var k16 = Kategori(id: 16, name: "Süt Ürünleri", resim: "suturun.png");

    kategoriListesi.add(k1);
    kategoriListesi.add(k2);
    kategoriListesi.add(k3);
    kategoriListesi.add(k4);
    kategoriListesi.add(k5);
    kategoriListesi.add(k6);
    kategoriListesi.add(k7);
    kategoriListesi.add(k8);
    kategoriListesi.add(k9);
    kategoriListesi.add(k10);
    kategoriListesi.add(k11);
    kategoriListesi.add(k12);
    kategoriListesi.add(k13);
    kategoriListesi.add(k14);
    kategoriListesi.add(k15);
    kategoriListesi.add(k16);

    return kategoriListesi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getir", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.amber),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Yeni Çamlıca Mahallesi, Ataşehir/İstanbul", style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Spacer(),
              Container(
                width: 90,
                height: 50,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text("TVS"),
                      Text("30+dk")
                    ],
                  ),
                ),
              )
            ],
          ),
          //Slide Bar
          Container(
            width: double.infinity,
            height: 210,
            child: PageView(
              children: <Widget>[
                Image.asset("resimler/getir-banner.jpeg"),
                Image.asset("resimler/banner2.jpeg"),
                Image.asset("resimler/resim.png"),
              ],
            ),
          ),
          //Kategoriler
          Expanded(
            child: FutureBuilder<List<Kategori>>(
              future: yukle(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var kategoriListesi = snapshot.data;
                  return Container(
                    height: 50,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1/1),
                        itemCount: kategoriListesi?.length,
                        itemBuilder: (context, indeks){
                          var kategori = kategoriListesi?[indeks];
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(child: Image.asset("resimler/${kategori!.resim}",width: 100, height: 70)),
                                Text(kategori.name,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        }
                    ),
                  );
                }else{
                  return Center();
                }
              },
            ),
          )
        ],
      ),


      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Image.asset(("resimler/group.png")),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home), ),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.person)),
            IconButton(onPressed: (){}, icon: Icon(Icons.card_giftcard))
          ],
        ),

      ),
    );
  }
}
