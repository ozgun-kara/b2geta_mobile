class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  var deviceWidth;
  var deviceHeight;
  var deviceTopPadding;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceTopPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppTheme().pageBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: deviceHeight * 0.4 + 14,
            decoration: BoxDecoration(
              gradient:
                  Provider.of<GetStartedPageProvider>(context).currentPage == 0
                      ? AppTheme().primaryGradient
                      : Provider.of<GetStartedPageProvider>(context)
                                  .currentPage ==
                              1
                          ? AppTheme().secondaryGradient
                          : AppTheme().accentGradient,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              // color: Colors.red,
            ),
            // color: Colors.red
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 56, 16, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,

                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       // mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                      //           child: SvgPicture.asset(
                      //             'assets/icons/xbowtie-logo-white.svg',
                      //             width: 54.04,
                      //             height: 32,
                      //           ),
                      //         ),
                      //         SvgPicture.asset(
                      //           'assets/images/bowtie-logo-white.svg',
                      //           width: 85.25,
                      //           height: 19.61,
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),

                      child: Image.asset(
                        'assets/images/bowtie-logo-white.png',
                        width: 145.07,
                        height: 32,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ButtonTheme(
                            minWidth: double.minPositive,
                            height: 24,
                            child: MaterialButton(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                color: Colors.white.withOpacity(0.15),
                                elevation: 0,
                                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: Text('SKIP',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppTheme().appFontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                onPressed: () async {
                                  Provider.of<GetStartedPageProvider>(context,
                                          listen: false)
                                      .updateCurrentPageValue();
                                }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, deviceHeight * 0.2 - 28, 0, 0),
            child: Column(
              children: [
                Image.asset(
                  Provider.of<GetStartedPageProvider>(context).currentPage == 0
                      ? 'assets/images/get-started-1.png'
                      : Provider.of<GetStartedPageProvider>(context)
                                  .currentPage ==
                              1
                          ? 'assets/images/get-started-2.png'
                          : 'assets/images/get-started-3.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'xBowtie Features',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: AppTheme().appFontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF0C235E),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum efficitur nisi, ac aliquet lorem. Sed iaculis mi ante, eu lobortis leo semper sed. Curabitur ut nunc porttitor,',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme().appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF64739A),
                  ),
                ),
                SizedBox(height: 33),
                ButtonTheme(
                  minWidth: deviceWidth,
                  height: 56,
                  child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      color: AppTheme().primaryColor,
                      elevation: 0,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme().appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onPressed: () async {}),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Provider.of<GetStartedPageProvider>(context)
                                    .currentPage ==
                                0
                            ? AppTheme().primaryColor
                            : AppTheme().subTextColor.withOpacity(0.2),

                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Provider.of<GetStartedPageProvider>(context)
                                    .currentPage ==
                                1
                            ? AppTheme().primaryColor
                            : AppTheme().subTextColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Provider.of<GetStartedPageProvider>(context)
                                    .currentPage ==
                                2
                            ? AppTheme().primaryColor
                            : AppTheme().subTextColor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          )
        ],
      ),
    );
  }
}
