import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_ui_demo/netImage/network_image_edit.dart';
import 'package:flutter_ui_demo/netImage/network_image_preview.dart';

class NetworkImagePage extends StatefulWidget {
  const NetworkImagePage({super.key});

  @override
  State<NetworkImagePage> createState() => _NetworkImagePageState();
}

class _NetworkImagePageState extends State<NetworkImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('展示网络图'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  ExtendedImage.network(
                    'https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Positioned(bottom: 0, left: 30, child: Text('fitHeight'))
                ],
              ),
              Stack(
                children: [
                  ExtendedImage.network(
                    'https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Positioned(bottom: 0, left: 30, child: Text('fitWidth'))
                ]
              ),
              Stack(
                children: [
                  ExtendedImage.network(
                    'https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.scaleDown,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Positioned(bottom: 0, left: 30, child: Text('scaleDown'))

                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  ExtendedImage.network(
                    'https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Positioned(bottom: 0, left: 30, child: Text('cover'))
                ],
              ),
              Stack(
                children: [
                  ExtendedImage.network(
                    'https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Positioned(bottom: 0, left: 30, child: Text('contain'))
                ],
              ),
              Stack(
                children: [
                  ExtendedImage.network(
                    'https://2sc2.autoimg.cn/escimg/g27/M04/5D/0B/f_900x675_0_q87_autohomecar__ChxkmWMVdMCAJZdZAAFU8OPC7Xs588.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    cache: true,
                    border: Border.all(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Positioned(bottom: 0, left: 20, child: Text('fill'))
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('监听图片加载状态'),
              Center(
                child: ExtendedImage.network(
                  'https://strapi.dhiwise.com/uploads/618fa90c201104b94458e1fb_639c3c682573ede2ef7e67c9_Best_Flutter_app_development_tools_and_app_builders_OG_image_ac87c76436.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.scaleDown,
                  cache: true,
                  border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                  loadStateChanged: (state){
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                        print('load image state loading');
                        break;
                      case LoadState.completed:
                        print('load image state completed');
                        break;
                      case LoadState.failed:
                        print('load image state failed');
                        break;
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('图片手势处理'),
              Expanded(
                  child:ExtendedImage.network(
                    'https://d2ms8rpfqc4h24.cloudfront.net/What_are_Flutter_and_Dart_Where_is_it_Useful1_12100cd269.jpg',
                    fit: BoxFit.scaleDown,
                    //enableLoadState: false,
                    mode: ExtendedImageMode.gesture,
                    initGestureConfigHandler: (state) {
                      return GestureConfig(
                        minScale: 0.9,
                        animationMinScale: 0.7,
                        maxScale: 3.0,
                        animationMaxScale: 3.5,
                        speed: 1.0,
                        inertialSpeed: 100.0,
                        initialScale: 1.0,
                        inPageView: false,
                        initialAlignment: InitialAlignment.center,
                      );
                    },
                    onDoubleTap:  (ExtendedImageGestureState state) {
                      ///you can use define pointerDownPosition as you can,
                      ///default value is double tap pointer down postion.
                    },
                  ),
              )
            ],
          ),
          Center(
            child: TextButton(onPressed: _onTapEditImage, child: Text('点击去编辑图片')),
          ),
          Center(
            child: TextButton(onPressed: _onTapImagePreview, child: Text('点击去预览图片')),
          )
        ],
      ),
    );
  }
  
  _onTapEditImage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkImageEditPage()));
  }

  _onTapImagePreview() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkImagePreview()));
  }
}
