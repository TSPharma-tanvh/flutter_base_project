import 'package:flutter/material.dart';

class EndlessGrid extends StatefulWidget {
  //change the scroll direction
  final Axis? scrollDirection;
  // detect whenever list should load more
  bool enableLoadMore;

  EndlessGrid({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.enableLoadMore = false,
  });

  @override
  _EndlessGridState createState() => _EndlessGridState();
}

class _EndlessGridState extends State<EndlessGrid> {
  final NumberGenerator _numGen = NumberGenerator();
  List<int> _data = [];

  @override
  void initState() {
    super.initState();
    _data = _numGen.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: widget.scrollDirection!,
      itemCount: _data.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (context, i) {
        if (i < _data.length) {
          return gridItem(i);
        } else {
          // extra item will request next page & rebuild widget
          getNextPage();
          return const CircularProgressIndicator();
        }
      },
    );
  }

  renderListFooterWidget() {
    return widget.enableLoadMore
        ? Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget gridItem(int i) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.lightBlue),
      padding: const EdgeInsets.all(5),
      child: Text('$i'),
    );
  }

  /// Request next page of data and call setState to rebuild GridView with
  /// new data.
  Future<void> getNextPage() async {
    var nextPage =
        await Future.delayed(const Duration(seconds: 2), _numGen.addPage);
    setState(() {
      _data = nextPage;
    });
  }
}

/// Mock data to fill GridView
class NumberGenerator {
  static const PAGESIZE = 15;
  List<int> dataset = [];
  final int start;

  NumberGenerator({this.start = 0});

  List<int> addItem() {
    dataset.add(lastItem + 1);
    return dataset;
  }

  List<int> addPage() {
    dataset.addAll(nextPage());
    return dataset;
  }

  int get lastItem => dataset.isNotEmpty ? dataset.last : start;

  List<int> nextPage({int start = 0, int size = PAGESIZE}) {
    start ??= lastItem;
    return List<int>.generate(size, (i) => start + i + 1);
  }
}
