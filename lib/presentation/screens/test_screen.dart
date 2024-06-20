import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';

import '../../dependency_injector.dart';
import '../../domain/entities/unit.dart';
import '../../domain/usecases/get_units.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetUnits _getUnits = sl<GetUnits>();

  int page;
  PaginationViewType paginationViewType;
  GlobalKey<PaginationViewState> key;

  @override
  void initState() {
    page = -1;
    paginationViewType = PaginationViewType.listView;
    key = GlobalKey<PaginationViewState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginationView Example'),
        actions: <Widget>[
          (paginationViewType == PaginationViewType.listView)
              ? IconButton(
                  icon: Icon(Icons.grid_on),
                  onPressed: () => setState(
                      () => paginationViewType = PaginationViewType.gridView),
                )
              : IconButton(
                  icon: Icon(Icons.list),
                  onPressed: () => setState(
                      () => paginationViewType = PaginationViewType.listView),
                ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => key.currentState.refresh(),
          ),
        ],
      ),
      body: PaginationView<UnitEntity>(
        key: key,
        header: Text('Header text'),
        footer: Text('Footer text'),
        paginationViewType: paginationViewType,
        itemBuilder: (BuildContext context, UnitEntity unit, int index) =>
            (paginationViewType == PaginationViewType.listView)
                ? ListTile(
                    title: Text(unit.unit),
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  )
                : GridTile(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(child: Icon(Icons.person)),
                        const SizedBox(height: 8),
                        Text(unit.buildingDesc),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
        pageFetch: pageFetch,
        pullToRefresh: true,
        onError: (dynamic error) => Center(
          child: Text('Some error occured'),
        ),
        onEmpty: Center(
          child: Text('Sorry! This is empty'),
        ),
        bottomLoader: Center(
          child: CircularProgressIndicator(),
        ),
        initialLoader: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<List<UnitEntity>> pageFetch(int offset) async {
    final unitsBTLAO = await _getUnits(GetUnitsParams('AZURN'));
    List<UnitEntity> nextUsersList;
    unitsBTLAO.fold((l) => null, (r) async {
      nextUsersList = r.sublist(0 + offset, 10 + offset);
    });
    await Future.delayed(Duration(seconds: 1));

    return nextUsersList;
  }
}

class User {
  User(this.name, this.email);

  final String name;
  final String email;
}
