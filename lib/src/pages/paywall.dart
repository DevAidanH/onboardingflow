import 'package:flutter/cupertino.dart';
import 'package:onboardingflow/onboardingflow.dart';

class Paywall extends StatefulWidget {
  final VoidCallback onNext;
  final OnboardingPageData content;
  const Paywall({super.key, required this.onNext, required this.content});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  @override
  Widget build(BuildContext context) {
    CupertinoDynamicColor highlightColor = CupertinoColors.activeBlue;
    if (widget.content.colors != null) {
      highlightColor = widget.content.colors![0];
    }
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: CupertinoButton(
              onPressed: () => widget.onNext(),
              child: Text("X")
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 300,
                child: widget.content.images[0]
              ),
              Text(
                "Unlimited Access",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.content.texts.length,
                    itemBuilder: (context, index) => CupertinoListTile(
                      leading: Icon(CupertinoIcons.smallcircle_circle),
                      title: Text(widget.content.texts[index]),
                      leadingToTitle: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: CupertinoColors.systemGrey2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: CupertinoListTile(
                  title: Text("Yearly Plan"),
                  subtitle: Row(
                    children: [
                      Text("Pull prices here")
                    ],
                  ),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: CupertinoCheckbox(
                      checkColor: highlightColor,
                      value: false,
                      shape: CircleBorder(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: CupertinoColors.systemGrey2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: CupertinoListTile(
                  title: Text("3 Day Trial"),
                  subtitle: Row(
                    children: [
                      Text("Pull prices here")
                    ],
                  ),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: CupertinoCheckbox(
                      checkColor: highlightColor,
                      value: true,
                      shape: CircleBorder(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              CupertinoButton.filled(
                onPressed: (){
          
                },
                color: highlightColor,
                child: Text("Purchase"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
