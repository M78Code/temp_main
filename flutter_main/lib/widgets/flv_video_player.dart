// import 'package:fijkplayer/fijkplayer.dart';
// import 'package:flutter/material.dart';
//
// class CustomFlvVideoPlayer extends StatefulWidget {
//   final String flvUrl;
//   final bool isPlaying; // 接收来自父组件的播放状态
//   final Function(bool isPlaying) onPlayPause; // 回调函数，通知父组件播放状态变化
//
//   const CustomFlvVideoPlayer({
//     super.key,
//     required this.flvUrl,
//     required this.isPlaying, // 接收父组件的播放状态
//     required this.onPlayPause,
//   });
//
//   @override
//   _CustomFlvVideoPlayerState createState() => _CustomFlvVideoPlayerState();
// }
//
// class _CustomFlvVideoPlayerState extends State<CustomFlvVideoPlayer> {
//   final FijkPlayer _player = FijkPlayer();
//   double _aspectRatio = 16 / 9; // 默认宽高比
//   bool _isPrepared = false; // 视频是否准备好
//
//   @override
//   void initState() {
//     super.initState();
//     _player.setDataSource(
//       widget.flvUrl, // 设置视频地址
//       autoPlay: widget.isPlaying, // 根据初始状态决定是否自动播放
//     );
//
//     // 监听视频准备好后的回调，更新宽高比
//     _player.addListener(() {
//       FijkValue value = _player.value;
//       if (value.prepared && value.size != null) {
//         if(mounted){
//           setState(() {
//             _isPrepared = true; // 视频准备好
//             _aspectRatio = value.size!.width / value.size!.height; // 根据实际视频宽高比调整
//           });
//         }
//       }
//     });
//   }
//
//
//
//
//   @override
//   void didUpdateWidget(CustomFlvVideoPlayer oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // 当外部的播放状态变化时，更新播放器状态
//     if (oldWidget.isPlaying != widget.isPlaying) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (widget.isPlaying) {
//           _player.start(); // 外部播放状态为 true 时开始播放
//         } else {
//           _player.pause(); // 外部播放状态为 false 时暂停播放
//         }
//         // 通知外部当前播放状态
//         widget.onPlayPause(widget.isPlaying);
//       });
//     }
//   }
//
//
//   @override
//   void dispose() {
//     _player.stop();
//     _player.release();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: _aspectRatio, // 根据视频宽高比自适应
//       child: Stack(
//         children: <Widget>[
//           FijkView(
//             player: _player,
//             panelBuilder: _customFijkPanel, // 自定义空面板
//             fit: FijkFit.fill, // 填充视频大小
//           ),
//           // 视频加载时显示加载指示器
//           if (!_isPrepared)
//             Center(
//               child: CircularProgressIndicator(),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// // 自定义面板，去掉暂停按钮等控件
// Widget _customFijkPanel(
//     FijkPlayer player, FijkData data, BuildContext context, Size viewSize, Rect texturePos) {
//   return Container(); // 隐藏所有控件
// }
