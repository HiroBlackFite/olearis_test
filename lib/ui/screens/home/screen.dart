import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:olearis_test/config/config.dart';
import 'package:olearis_test/localization/locale_keys.g.dart';
import 'package:olearis_test/logic/extensions/extensions.dart';
import 'package:olearis_test/ui/widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home';
  static const route = '/$name';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _items = [];
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        centerTitle: false,
        title: LocaleKeys.home_appBar,
        withBackButton: true,
        action: [
          AppBarButton.add(
            onTap: _onAddItem,
          ),
          AppBarButton.remove(
            onTap: _onRemoveItem,
          ),
        ],
      ),
      body: Center(
        child: ListView(
          controller: _controller,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: _verticalPadding(context),
                horizontal: 30,
              ),
              child: AppSVGImage.assets(
                context: context,
                assetName: AppImages.logo,
              ),
            ),
            if (_items.isNotEmpty)
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: context.screen.width / 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 4,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(_items[index]),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _onAddItem() {
    final index = _items.length + 1;
    _items.add(LocaleKeys.home_item_args.tr(args: ['$index']));
    setState(() {});
  }

  void _onRemoveItem() {
    if (_items.isEmpty) return;

    _items.remove(_items.last);
    setState(() {});
  }

  double _verticalPadding(BuildContext context) {
    final widthWidget = 375 > context.screen.width - 60 ? context.screen.width - 60 : 375;
    final horizontalPadding = ((context.screen.width / 4) - 50) / 2;
    final startPadding = ((context.screen.height -
            AppBar().preferredSize.height -
            widthWidget / 2 -
            context.padding.vertical) /
        2);
    final newPadding = startPadding - (horizontalPadding * ((_items.length / 2).ceil()));
    if (newPadding > 30) {
      final value = newPadding;
      return value;
    } else {
      return 30;
    }
  }
}
