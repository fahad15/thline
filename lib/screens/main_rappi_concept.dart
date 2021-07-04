import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_line/models/rappi_data.dart';
import 'package:the_line/models/rippi_bloc.dart';

const _backgroundColor = Color(0xFFF6F9FA);
const _buleColor = Color(0XFF0D1863);
const _greenColor = Color(0xFF2BBEBA);
const categoryHeight = 55.0;
const productHeight = 110.0;

class MinRappiConceptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: _RappiConcept(),
    );
  }
}

class _RappiConcept extends StatefulWidget {
  @override
  __RappiConceptState createState() => __RappiConceptState();
}

class __RappiConceptState extends State<_RappiConcept>
    with SingleTickerProviderStateMixin {
  final _bloc = RappiBloc();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home page',
                        style: TextStyle(
                          color: _buleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: _greenColor,
                        radius: 16,
                        child: ClipOval(
                            // child: Image.asset(
                            // 'assets/',
                            // height: 30,
                            // fit: BoxFit.cover,
                            ),
                      ),
                      // )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 60,
                child: TabBar(
                  onTap: _bloc.onCategorySelected,
                  controller: _bloc.tabController,
                  indicatorWeight: 0.1,
                  isScrollable: true,
                  tabs: _bloc.tabs.map((e) => _RappiTabWidget(e)).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    controller: _bloc.scrollController,
                    itemCount: _bloc.items.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final item = _bloc.items[index];
                      if (item.isCategory) {
                        return _RappiCategoryItem(item.category);
                      } else {
                        return _RappiProductItem(item.product);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RappiTabWidget extends StatelessWidget {
  const _RappiTabWidget(this.tabCategory);
  final RappiTabCategory tabCategory;

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.name,
            style: TextStyle(
              color: _buleColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _RappiCategoryItem extends StatelessWidget {
  const _RappiCategoryItem(this.category);
  final RappiCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHeight,
      alignment: Alignment.centerLeft,
      child: Text(
        category.name,
        style: TextStyle(
          color: _buleColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _RappiProductItem extends StatelessWidget {
  const _RappiProductItem(this.product);
  final RappiProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: Padding(
        //في حالة التغيير
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
            elevation: 6,
            //  shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  //child: Image.asset(product.image),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          color: _buleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        product.description,
                        maxLines: 2,
                        style: TextStyle(
                          color: _buleColor,
                          fontSize: 10,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: _greenColor,
                          fontSize: 10,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
