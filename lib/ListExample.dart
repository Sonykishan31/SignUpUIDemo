import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListExample extends StatefulWidget {
  @override
  _ListExampleState createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  List<String> _list = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  bool _isVisible = true;

  void _addItem() {
    if (_list.length < 20) {
      setState(() {
        _isVisible = false;
      });
      final int _index = 0;
      _list.add("Item ${_list.length + 1}");
      _listKey.currentState.insertItem(_index);
    } else {
      showSnackbar("Maximum limit exceeded!");
    }
  }

  void showSnackbar(String msg) {
    final snackBar = SnackBar(content: Text(msg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _clearAllItems() {
    for (var i = 0; i <= _list.length - 1; i++) {
      _listKey.currentState.removeItem(0,
              (BuildContext context, Animation<double> animation) {
            return Container();
          });
    }
    _list.clear();
    setState(() {
      _isVisible = true;
    });
  }

  void _removeItem() {
    setState(() {
      if (_list.length - 1 == 0) {
        _isVisible = true;
      }
    });
    final int _index = _list.length - 1;
    _listKey.currentState
        .removeItem(_index, (context, animation) => Container());
    _list.removeAt(_index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text("Dynamic List"),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.search), onPressed: () {})
//        ],
      ),
      body: Center(
          child: Stack(
        children: <Widget>[
          Container(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder:
                  (BuildContext context, int index, Animation animation) {
                return _buildItem(_list[index].toString(), animation);
              },
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Visibility(
                  visible: _isVisible,
                  child: Text(
                      'Click on plus buttton to add and minus to remove',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20))))
        ],
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _addItem(),
            heroTag: 'btn1',
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            tooltip: 'Decrement',
            heroTag: 'btn2',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () => _clearAllItems(),
            tooltip: 'ClearAll',
            heroTag: 'btn3',
            child: Icon(Icons.clear_all),
          )
        ],
      ),
    );
  }

  void onTapped(String post) {
    showSnackbar(post);
  }

  Widget _buildItem(String _item, Animation _animation) {
    bool isSelected = false;

    var post = _item;

    return SizeTransition(
      sizeFactor: _animation,
      child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10.0),
          child: Container(
              color: Colors.white60,
              child: ListTile(
                selected: isSelected,
                onTap: () {
                  onTapped(post);
                },
                title: Text(
                  _item,
                ),
              ))),
    );
  }
}
