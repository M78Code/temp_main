import 'package:flutter/material.dart';

///  封装的switch按钮 --- 所使用页面（首页的日间夜间切换｜首页的声音打开关闭）
class CustomSwitchBtn extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String onText;
  final String offText;
  final Image onImage;
  final Image offImage;
  final double width; // 开关按钮的宽度
  final double height; // 开关按钮的高度
  final double imageSize; // 按钮图片的大小
  final BoxDecoration? backgroundDecoration; // 背景装饰 (可以是颜色或图片)
  final TextStyle? onTextStyle; // 开状态下的文字样式
  final TextStyle? offTextStyle; // 关状态下的文字样式

  const CustomSwitchBtn({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.onText,
    required this.offText,
    required this.onImage,
    required this.offImage,
    this.width = 70.0, // 默认宽度
    this.height = 40.0, // 默认高度
    this.imageSize = 36.0, // 默认按钮图片大小
    this.backgroundDecoration, // 背景装饰，默认无
    this.onTextStyle,
    this.offTextStyle,
  });

  @override
  _CustomSwitchBtnState createState() => _CustomSwitchBtnState();
}

class _CustomSwitchBtnState extends State<CustomSwitchBtn>
    with SingleTickerProviderStateMixin {
  late bool _isOn;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    if (_isOn) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSwitch() {
    setState(() {
      _isOn = !_isOn;
      _isOn ? _animationController.forward() : _animationController.reverse();
    });
    widget.onChanged(_isOn);
  }

  @override
  Widget build(BuildContext context) {
    // 计算按钮上下间距 (按钮相对于容器高度的偏移)
    double verticalPadding = (widget.height - widget.imageSize) / 2;
    double horizontalPadding = 2.0; // 设置按钮左右的间距

    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: widget.backgroundDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height / 2),
              color: _isOn ? Colors.green : Colors.grey,
            ),
        child: Stack(
          children: [
            // 放置 on 和 off 文本，并使其与按钮居中
            Positioned.fill(
              child: Row(
                children: [
                  if (_isOn) ...[
                    // 当按钮在左侧时（on），文字在按钮右侧和背景右侧之间的中间
                    const Spacer(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.onText,
                          style: widget.onTextStyle ??
                              const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ] else ...[
                    // 当按钮在右侧时（off），文字在按钮左侧和背景左侧之间的中间
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.offText,
                          style: widget.offTextStyle ??
                              const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ],
              ),
            ),
            // AnimatedPositioned 按钮
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: _isOn
                  ? horizontalPadding // 按钮在左侧
                  : widget.width - widget.imageSize - (2 * horizontalPadding), // 按钮在右侧
              top: verticalPadding+2, // 垂直居中 适配下透明度的图片小调整向下移动2
              bottom: verticalPadding, // 同时设置底部居中
              child: Container(
                width: widget.imageSize,
                height: widget.imageSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // 改为透明背景
                  color: Colors.transparent,
                ),
                child: Center(
                  child: _isOn
                      ? Image(
                    image: widget.onImage.image,
                    fit: BoxFit.contain,
                  )
                      : Image(
                    image: widget.offImage.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}