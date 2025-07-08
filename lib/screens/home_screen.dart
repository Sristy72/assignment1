import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/video_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoController = Get.put(VideoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back, Saifur!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              const Text("Let’s take it one step at a time.", style: TextStyle(fontSize: 18),),
          
              const SizedBox(height: 20),
              
              Text('Time-based Routine Example:', style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
          
              // example card
              Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.watch_later_rounded, color: Color(0xFF5F6CAF),),
                        const SizedBox(width: 8,),
                        const Text("9:00 AM",style: TextStyle(color: Color(0xFF003759)),),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                          },
                          child: const Text(
                            "Notes",
                            style: TextStyle(
                              color: Color(0xFF5F6CAF),
                              fontSize: 19,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF5F6CAF),      // optional: underline color
                              decorationThickness: 1.5,           // optional: thickness of underline
                            ),
                          ),
                        )
                      ],
                    ),
          
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.5,
                          )
                        )
                      ),
                    ),
                    const SizedBox(height: 10),
          
                    const Text("Watch:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20),
                    
                    Text('How to Calm Your Morning',style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          
                    SizedBox(height: 12,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: YoutubePlayer(
                        controller: videoController.youtubeController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.red, // ✅ YouTube-style progress
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(
                            isExpanded: true,
                            colors: ProgressBarColors(
                              playedColor: Colors.red,       // progress bar
                              handleColor: Colors.redAccent, // draggable circle
                              backgroundColor: Colors.grey.shade300,
                              bufferedColor: Colors.grey,
                            ),
                          ),
                          const PlaybackSpeedButton(),
                        ],
                      )
                      ,
                    ),
          
                    SizedBox(height: 14,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              )
                          )
                      ),
                    ),
          
                    SizedBox(height: 12,),
                    Text('Once the task is complete, kindly submit your notes.', style: TextStyle(color: Colors.red, fontSize: 18),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
