import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:raundtable/features/dashboard/buttons.dart';

import '../../constants/color_constants.dart';
import 'dashCard.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.2),
                  height: 600,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    'lib/features/dashboard/pic.jpeg'),
                              ),
                            ),
                          ),
                          const VerticalDivider(color: Colors.transparent),
                          Text(
                            'Hi, Anna',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: whitishTextColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        'My Table',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: whitishTextColor),
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          DashCard(
                            size: size,
                            cardChild: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Cash Cow",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      DefaultButton(
                                          displayText: "View",
                                          fillcolor: true,
                                          press: () {
                                            //Navigator.pushNamed(context, '/table');
                                          })
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.transparent,
                                ),
                                Column(children: [
                                  CardRow('My Payout Date:', '13 March 22'),
                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  CardRow('My Receiving Position:', '3/5'),
                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  CardRow('My Table Postion:', '13 Jan 22')
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 2 / 3 * size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DefaultButton(
                                    displayText: 'Create table',
                                    fillcolor: false,
                                    press: () {}),
                                DefaultButton(
                                  displayText: 'Join Table',
                                  fillcolor: true,
                                  press: () {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 3 / 4 * size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'My Savings Goal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          DashCard(
                            size: size,
                            cardChild: SizedBox(
                              width: 2 / 3 * size.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 100.0,
                                      lineWidth: 10.0,
                                      animation: true,
                                      percent: 0.4,
                                      center: const Text(
                                        '\$175',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: mainAppColor,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text('I\'m saving for:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                '1. Car',
                                                style: TextStyle(
                                                    color: mainAppColor),
                                              ),
                                              Text('2. TV',
                                                  style: TextStyle(
                                                      color: mainAppColor)),
                                              Text('3. Holiday',
                                                  style: TextStyle(
                                                      color: mainAppColor)),
                                            ]),
                                        const Divider(
                                          color: Colors.transparent,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(children: [
                                            Text('Remaining:',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                            Text('\$700',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        color: mainAppColor))
                                          ]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(color: Colors.transparent),
                          SizedBox(
                            width: 3 / 4 * size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'My Transactions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          DashCard(
                              size: size,
                              cardChild: Column(
                                children: [
                                  const TabBar(
                                    indicatorColor: mainAppColor,
                                    unselectedLabelColor: Colors.black,
                                    labelColor: mainAppColor,
                                    tabs: [
                                      Tab(child: Text('All')),
                                      Tab(
                                          child: Text(
                                        'Upcoming',
                                        overflow: TextOverflow.clip,
                                      )),
                                      Tab(child: Text('History')),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: TabBarView(
                                      children: [
                                        tabItem('13/3', 'Pot Contribution',
                                            '\$20.0', true),
                                        tabItem('13/3', 'Pot Contribution',
                                            '\$20.0', false),
                                        tabItem('13/3', 'Pot Contribution',
                                            '\$20.0', true),
                                      ],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding CardRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  tabItem(String date, String description, String amount, bool istrue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(date),
        Text(
          description,
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          amount,
          style: const TextStyle(color: mainAppColor),
        ),
        Icon(
          istrue ? Icons.check_circle : Icons.cancel_outlined,
          color: istrue ? Colors.green : Colors.red,
        )
      ],
    );
  }
}
