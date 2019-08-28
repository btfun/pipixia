import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* *
 *  canvas 画图
 * 
 * 
 * 
 */
class StarView extends CustomPainter {
  Paint mHelpPaint;
  BuildContext context;
  double r;
  //构造函数
  StarView(this.context,this.r) {
    mHelpPaint = new Paint();
    mHelpPaint.style=PaintingStyle.stroke;
    mHelpPaint.color=Color(0xffBBC3C5);
    mHelpPaint.isAntiAlias=true;
  }
 
  @override
  void paint(Canvas canvas, Size size) {
     var winSize = MediaQuery.of(context).size;//获取屏幕尺寸
         canvas.drawPath(gridPath( r, winSize), mHelpPaint);

        // canvas.translate(160, 320);//移动到坐标系原点
        // canvas.drawPath(nStarPath(5,80,40), mHelpPaint);

  } 
 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  /* *
   * 绘制网格路径
   *
   * @param step    小正方形边长
   * @param winSize 屏幕尺寸
   */
  Path gridPath(double step, Size winSize) {
    Path path = new Path();

    for (int i = 0; i < winSize.height / step + 1; i++) {
      path.moveTo(0, step * i.toDouble());
      path.lineTo(winSize.width, step * i.toDouble());
    }

    for (int i = 0; i < winSize.width / step + 1; i++) {
      path.moveTo(step * i.toDouble(), 0);
      path.lineTo(step * i.toDouble(), winSize.height);
    }
    return path;
  }
 
 

}
 