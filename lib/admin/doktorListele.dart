import 'package:flutter/material.dart';

class DoktorListele extends StatefulWidget {
  @override
  DoktorListeleState createState() {
    return new DoktorListeleState();
  }
}

class DoktorListeleState extends State<DoktorListele> {
  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Doktor Adi"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.firstName.compareTo(b.firstName));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Soyadi"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.lastName.compareTo(b.lastName));
            });
          },
          tooltip: "To display last name of the Name",
        ),
                DataColumn(
          label: Text("Hastane Adi"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.hastaneAdi.compareTo(b.hastaneAdi));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        
      ],
      rows: names
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(name.firstName),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name.lastName),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                      DataCell(
                      Text(name.hastaneAdi),
                      showEditIcon: false,
                      placeholder: false,
                    )
                  ],
                ),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doktor Listesi"),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class Name {
  String firstName;
  String lastName;
  String hastaneAdi;

  Name({this.firstName, this.lastName,this.hastaneAdi});
}

var names = <Name>[
  Name(firstName: "Alex", lastName: "De SOUZA",hastaneAdi:"Kadikoy"),
  Name(firstName: "Gizem", lastName: "Söylemez",hastaneAdi:"Bozyaka SSK"),
  Name(firstName: "Ahmet", lastName: "Eğilmez",hastaneAdi:"İzmir Devlet"),
  Name(firstName: "Özge", lastName: "Örmeci",hastaneAdi:"Manisa Devlet"),
    Name(firstName: "Erdem", lastName: "Yıldız",hastaneAdi:"Alsancak Tıp"),
];