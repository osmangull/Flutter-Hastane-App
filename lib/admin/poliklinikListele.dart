import 'package:flutter/material.dart';

class PoliklinikListele extends StatefulWidget {
  @override
  PoliklinikListeleState createState() {
    return new PoliklinikListeleState();
  }
}

class PoliklinikListeleState extends State<PoliklinikListele> {
  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Poliklinik Adi"),
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

  Name({this.firstName,this.hastaneAdi});
}

var names = <Name>[
  Name(firstName: "KBB", hastaneAdi:"Kadikoy"),
  Name(firstName: "Beyin Cerrahi", hastaneAdi:"Bozyaka SSK"),
  Name(firstName: "Cildiye",hastaneAdi:"İzmir Devlet"),
  Name(firstName: "Ortopedi", hastaneAdi:"Manisa Devlet"),
    Name(firstName: "Göz", hastaneAdi:"Alsancak Tıp"),
];