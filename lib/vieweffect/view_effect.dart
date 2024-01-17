import 'package:flutter/material.dart';

class ViewEffectPage extends StatefulWidget {
  const ViewEffectPage({super.key});

  @override
  State<ViewEffectPage> createState() => _ViewEffectPageState();
}

class _ViewEffectPageState extends State<ViewEffectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('渐变色相关'),),
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                _buildGradientEffect(),
            ],
          ),
        ),
      ),
    );
  }

  _buildGradientEffect() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0xFF222222), borderRadius: BorderRadius.circular(8)),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(colors: [
            Color(0xFF1FFD91),
            Color(0xFFFFE60F),
          ]).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: Text(
          '立即开通专业版',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
