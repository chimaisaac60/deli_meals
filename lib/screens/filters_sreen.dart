import 'package:deli_meals/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FliterScreen extends StatefulWidget {
  static const routeNamed = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FliterScreen(this.currentFilter, this.saveFilters);

  @override
  _FliterScreenState createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchList(
      String title, String subtitle, bool currentValue, Function changedValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: changedValue,
    );
  }

  void applyChanges() {
    final selectedFilters = {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
    widget.saveFilters(selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        // this method is for when you want a designated button to apply changes rather than just the switch
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       final selectedFilters = {
        //         'gluten': _glutenFree,
        //         'lactose': _lactoseFree,
        //         'vegan': _vegan,
        //         'vegetarian': _vegetarian,
        //       };
        //       widget.saveFilters(selectedFilters);
        //     },
        //     icon: Icon(Icons.save),
        //   )
        // ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchList('Gluten-free',
                    'only includes gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                  applyChanges();
                }),
                _buildSwitchList(
                    'Vegetarian', 'only includes vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                  applyChanges();
                }),
                _buildSwitchList('Vegan', 'only includes vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                  applyChanges();
                }),
                _buildSwitchList(
                    'Lactose-free',
                    'only includes lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                  applyChanges();
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
