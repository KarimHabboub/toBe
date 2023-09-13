import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobe/utils/colors.dart';
import 'package:tobe/utils/components.dart';
import 'package:tobe/utils/styles.dart';
import 'package:tobe/widget/myI_icon_with_notification.dart';
import 'package:tobe/widget/my_container_icon.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widget/my_card_item.dart';
import '../../widget/my_toggle_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  bool _isPlayerReady = false;

  final List<String> _ids = [
    'mFcQ5tJAON4',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) {
        var width = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  player,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        MyContainerIcon(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Colors.white,
                          ),
                          backgroundColor: myGreyColor,
                          width: 50,
                          height: 50,
                        ),
                        Spacer(),
                        MyContainerIcon(
                          icon: MyIconWithNotification(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              backgroundColorCircleAvatar: myGreyColor),
                          backgroundColor: myGreyColor,
                          width: 55,
                          height: 55,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Design Thingking Fundamental",
                          style: Styles.textStyle20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: myTealColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text('Halo Academy',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textTealStyle16),
                            ),
                            Text('⭐ 4.8'),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Description this is a simple description that explain the description about the class or blabla bla and then blablabla of course.",
                          style: Styles.textDarkGreyStyle14,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyVideoData(
                          title1: "Students",
                          subTitle1: "143.247",
                          title2: "Language",
                          subTitle2: "English",
                          width: width,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        MyVideoData(
                          title1: "Last update",
                          subTitle1: "Feb 2, 2021",
                          title2: "Subtitle",
                          subTitle2: "English and ",
                          subTitle3: '5 more',
                          width: width,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const MyToggleContainer(),
                        const SizedBox(
                          height: 16,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => const MyCardItem(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          itemCount: 3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ظل من الجزء العلوي فقط
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 4,
                      offset: const Offset(0, -2), // تحديد الانتقال للأعلى
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Price',
                            style: Styles.textDarkGreyStyle16,
                          ),
                          Spacer(),
                          Text(
                            '\$150',
                            style: Styles.textTealStyle24,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyButton(
                          text: 'Enroll course now',
                          onPressed: () {},
                          color: myTealColor),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: MyOutlinedButton(
                                  text: "Add to cart",
                                  onPressed: () {},
                                  color: myTealColor)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: MyOutlinedButton(
                                  text: "Add to cart",
                                  onPressed: () {},
                                  color: myTealColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }



  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

class MyVideoData extends StatelessWidget {
  const MyVideoData({
    super.key,
    required this.width,
    required this.title1,
    required this.subTitle1,
    required this.title2,
    required this.subTitle2,
    this.subTitle3,
  });

  final double width;
  final String title1;
  final String subTitle1;
  final String title2;
  final String subTitle2;
  final String? subTitle3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textDarkGreyStyle14,
              ),
              Text(
                subTitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20,
              ),
            ],
          ),
        ),
        SizedBox(
          width: width / 220,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textDarkGreyStyle14,
              ),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: subTitle2,
                      style: Styles.textStyle20,
                    ),
                    if (subTitle3 != null)
                      TextSpan(
                        text: subTitle3,
                        style: Styles.textTealStyle20,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
