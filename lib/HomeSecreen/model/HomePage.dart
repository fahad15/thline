import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/screens/loginnew/colors.dart';


import 'AddPage.dart';
import 'Constants.dart';
import 'DetailsPage.dart';
import 'Record.dart';
import 'RecordList.dart';
import 'RecordService.dart';
import 'add_todo_button.dart';

const productHeight = 110.0;
const categoryHeight = 55.0;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _filter = new TextEditingController();
  RecordList _records = new RecordList();
  RecordList _filteredRecords = new RecordList();
  
  // Method to show snackbar with 'message'.
  

  var _searchText = "";
  bool _loading = true;
  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle = new Text(appTitle);

  @override
  void initState() {
    super.initState();

    _records.records = new List();
    _filteredRecords.records = new List();

    setState(() {
      _getRecords();
    });
  }

  void _getRecords() async {
    RecordList record = await RecordServices().getUsers();

    setState(() {
      for (Record record in record.records) {
        this._records.records.add(record);
        this._filteredRecords.records.add(record);
        _loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildBar(context),
    
    
        backgroundColor: DelivryColor.grey,
        //Color.fromRGBO(58, 66, 86, 1.0),
        body: Stack(
          children: [
            _buildBody(context),
            _buildList(context),
            const Align(
              alignment: Alignment.bottomRight,
              child: AddTodoButton(),
            )
          ],
        )
        
        );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      elevation: 0.1,
      backgroundColor:DelivryColor.grey,
      // Color.fromRGBO(58, 66, 86, 1.0),
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(icon: _searchIcon, onPressed: _searchPressed),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
           
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(),
                ));
          },
        ),
            IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () async {
            _getRecords();
           
           setState(() {
             _getRecords();
           });
                
          },
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    if (_searchText.isNotEmpty) {
      _filteredRecords.records = new List();
      for (int i = 0; i < _records.records.length; i++) {
        if (_records.records[i].name
                .toLowerCase()
                .contains(_searchText.toLowerCase()) ||
            _records.records[i].address
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
          _filteredRecords.records.add(_records.records[i]);
        }
      }
    }

    return  Expanded(child:ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this
          ._filteredRecords
          .records
          .map((data) => _buildListItem(context, data))
          .toList(),
    ), 
    
    );
  }

  Widget _buildListItem(BuildContext context, Record records) {
    return Expanded(
          child: Card(
        key: ValueKey(records.name + records.address),
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          //height: productHeight,
          decoration: BoxDecoration(
            color: DelivryColor.dark,
            //color: Color.fromRGBO(64, 75, 96, .9),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              //padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                border: new Border(
                  right: new BorderSide(width: 2.0, color: Colors.white24),
                ),
              ),
              child: Icon(Icons.autorenew, color: Colors.white),
            ),
            title: Text(
              records.address,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                new Flexible(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: records.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        maxLines: 3,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      )
                    ]))
              ],
            ),
            trailing:
                Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DetailPage(record: records))
                      );
            },
          ),
        ),
      ),
    );
  }

  _HomePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _resetRecords();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _resetRecords() {
    this._filteredRecords.records = new List();
    for (Record record in _records.records) {
      this._filteredRecords.records.add(record);
    }
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: new TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Color(0xff52555a),),
           // fillColor: Colors.red,
            filled: true,
            hintText: 'Search by name',
            hintStyle: TextStyle(color: Color(0xff52555a),),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(appTitle);
        _filter.clear();
      }
    });
  }

  
  _buildBody(BuildContext context) {
    if (_loading) {
      return new SpinKitFadingCircle(
        color: Colors.white,
        size: 50.0,
      );
    }
    return ListView();
  }
}
