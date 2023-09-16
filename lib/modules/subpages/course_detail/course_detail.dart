import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tobe/controllers/home_controller.dart';
import 'package:tobe/modules/subpages/course_detail/widget/course_detail_part1.dart';
import 'package:tobe/modules/subpages/course_detail/widget/my_curriculum_page.dart';
import 'package:tobe/modules/subpages/course_detail/widget/my_review_page.dart';
import 'package:tobe/modules/subpages/course_detail/widget/my_video_player.dart';

import 'package:tobe/widget/my_toggle_container.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../utils/components.dart';
import '../../../widget/my_enroll_course_now.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late YoutubePlayerController _youtubeController;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  final homeController = Get.put(HomeController());

  bool _isPlayerReady = false;

  final List<String> _ids = [
    'ew9s_2IE2aw',
    'P0uaLRO6V1U',
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
    _youtubeController = YoutubePlayerController(
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
    if (_isPlayerReady && mounted && !_youtubeController.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubeController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _youtubeController.dispose();
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
        controller: _youtubeController,
        showVideoProgressIndicator: false,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _youtubeController.metadata.title,
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
          _youtubeController
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          showSnackBar('Next Video Started!', context);
        },
      ),
      builder: (context, player) {
        return Scaffold(
          body: Column(
            children: [
              MyVideoPlayer(player: player),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CourseDetailPart1(),
                        MyToggleContainer(controller: homeController),
                        GetX<HomeController>(
                          builder: (cont) => ExpandablePageView(
                            controller: homeController.pageController.value,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              if (cont.indexPageView.value == 0)
                                const MyCurriculumPage(),
                              if (cont.indexPageView.value == 1)
                                const MyReviewPage(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const MyEnrollCourse()
            ],
          ),
        );
      },
    );
  }
}

