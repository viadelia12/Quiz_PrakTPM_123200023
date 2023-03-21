import 'package:flutter/material.dart';
import 'package:kuis_praktpm/database/data_buku.dart';
import 'package:kuis_praktpm/pages/detail_buku.dart';

class ListBuku extends StatelessWidget {
  const ListBuku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Data Buku"),
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBuku(buku: buku,)
                )
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/3,
              child: Card(
              child: ListTile(
                leading: Image.network(
                  buku.imageLink,
                  fit: BoxFit.cover,
                ),
                title: Text(buku.title, 
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
                subtitle: Text(buku.author, 
                  style: TextStyle(
                    fontStyle: FontStyle.italic
                    ),
                ),
              ),
            ),),
          );
        },
      )
    );
  }
}
