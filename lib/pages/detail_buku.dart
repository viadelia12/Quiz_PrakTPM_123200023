import 'package:flutter/material.dart';
import 'package:kuis_praktpm/database/data_buku.dart';

class DetailBuku extends StatefulWidget {
  final DataBuku buku;
  const DetailBuku({Key? key, required this.buku}) : super(key: key);

  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  // final String link = widget.buku.link;
  final Uri _url = Uri.parse('widget.buku.link');
  String status = "";

  void _status() {
    setState(() {
      widget.buku.isAvailable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool statusAvailable = widget.buku.isAvailable;

    if (widget.buku.isAvailable) {
      status = "Tersedia";
    } else {
      status = "Tidak Tersedia";
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.buku.title),
        actions: [
           IconButton(
            icon: const Icon(Icons.search), 
            onPressed: () {
              
            },
            
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height/2,
            child: Image.network(
              widget.buku.imageLink,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Judul"),
                      Text("Penulis"),
                      Text("Bahasa"),
                      Text("Negara"),
                      Text("Jumlah Halaman"),
                      Text("Tahun Terbit"),
                      Text("Status"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          ": " + widget.buku.title,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(": " + widget.buku.author),
                      Text(": " + widget.buku.language),
                      Text(": " + widget.buku.country),
                      Text(": " + widget.buku.pages.toString()),
                      Text(": " + widget.buku.year.toString()),
                      Text(": " + status, style: TextStyle(color : (status == "Tersedia")? Colors.green : Colors.red,),)
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (statusAvailable)
                ? () {
                    String message = "Berhasil meminjam buku!";
                    _status();
                    SnackBar snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                : null,
            child: Text("Pinjam Buku"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
          ),
        ],
      ),
    );
  }
}
