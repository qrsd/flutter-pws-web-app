import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../utils/constants.dart';
import '../utils/responsive_layouts.dart';

int _current = 0;
int _current2 = 0;

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  Widget _buildDot(int index) {
    return Container(
      width: 30.0,
      height: 30.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _current == index
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    );
  }

  List<Widget> _carouselItems(BuildContext context) {
    var list = List<Widget>();
    for (int i = 1; i < carouselSize + 1; i++) {
      list.add(PageItem(
        image: Image.asset(
          'images/carousel/$i.JPG',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          items: _carouselItems(context),
          height: MediaQuery.of(context).size.height * .5,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(milliseconds: 5100),
          pauseAutoPlayOnTouch: Duration(milliseconds: 5100),
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Positioned(
          bottom: !ResponsiveLayout.isSmallScreen(context) ? 0 : 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(carouselSize, _buildDot),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * .1,
          top: 0,
          child: AnimatedText(),
        ),
      ],
    );
  }
}

class Carousel2 extends StatefulWidget {
  @override
  _Carousel2State createState() => _Carousel2State();
}

class _Carousel2State extends State<Carousel2> {
  Widget _buildDot(int index) {
    return Container(
      width: 30.0,
      height: 30.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _current2 == index
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    );
  }

  List<Widget> _carouselItems(BuildContext context) {
    var list = List<Widget>();
    for (int i = 1; i < carouselSize + 1; i++) {
      list.add(PageItem(
        image: Image.asset(
          'images/about/$i.JPG',
          fit: BoxFit.cover,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          items: _carouselItems(context),
          height: MediaQuery.of(context).size.height * .5,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(milliseconds: 5100),
          pauseAutoPlayOnTouch: Duration(milliseconds: 5100),
          onPageChanged: (index) {
            setState(() {
              _current2 = index;
            });
          },
        ),
        Positioned(
          bottom: !ResponsiveLayout.isSmallScreen(context) ? 0 : 40,
          left: 0,
          right: 0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(carouselSize, _buildDot)),
        ),
      ],
    );
  }
}

class PageItem extends StatefulWidget {
  final Image image;

  PageItem({this.image});

  @override
  _PageItemState createState() => _PageItemState();
}

class _PageItemState extends State<PageItem>
    with AutomaticKeepAliveClientMixin<PageItem> {
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: widget.image,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DropIn extends StatelessWidget {
  final Widget child;

  DropIn(this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('translateY').add(Duration(milliseconds: 1000),
          Tween(begin: 0, end: MediaQuery.of(context).size.height * .1),
          curve: Curves.bounceOut),
      Track('opacity')
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: 500),
      duration: tween.duration,
      child: child,
      tween: tween,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(0, animation['translateY']),
          child: ScrollOut(child),
        ),
      ),
    );
  }
}

class ScrollOut extends StatelessWidget {
  final Widget child;

  ScrollOut(this.child);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 1200),
      delay: Duration(milliseconds: 3400),
      tween: Tween(begin: 250.0, end: 2),
      builder: (context, width) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 400),
          delay: Duration(milliseconds: 4600),
          tween: Tween(begin: 70.0, end: 0.0),
          builder: (context, height) {
            return Container(
              color: Colors.black.withOpacity(.7),
              height: height,
              width: width,
              child: child,
            );
          },
        );
      },
    );
  }
}

class ScrollIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      delay: Duration(milliseconds: 200),
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 70.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 1200),
          delay: Duration(milliseconds: 700),
          tween: Tween(begin: 2.0, end: 250.0),
          builder: (context, width) {
            return TranslateBase(
              Container(
                color: Colors.black.withOpacity(.7),
                height: height,
                width: width,
                child: isEnoughRoomForTypewriter(width)
                    ? TypeWriterText(textHouse)
                    : Container(),
              ),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width) => width > 10;
}

class TypeWriterText extends StatelessWidget {
  final String text;

  TypeWriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 800),
      delay: Duration(milliseconds: 800),
      tween: IntTween(begin: 0, end: text.length),
      builder: (context, textLength) {
        return Center(
          child: Text(
            text.substring(0, textLength),
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
            //textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

class SpinIn extends StatelessWidget {
  final Widget child;

  SpinIn(this.child);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 1200),
      delay: Duration(milliseconds: 200),
      tween: Tween(begin: 0.0, end: 360.0),
      builder: (context, spin) {
        return TranslateBase(
          Transform.rotate(
            angle: spin * pi / 180,
            child: ScaleIn(child),
          ),
        );
      },
    );
  }
}

class ScaleIn extends StatelessWidget {
  final Widget child;

  ScaleIn(this.child);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 1000),
      delay: Duration(milliseconds: 4000),
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, scale) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
    );
  }
}

class ScaleOut extends StatelessWidget {
  final Widget child;

  ScaleOut(this.child);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, scale) {
        return TranslateBase(
          Transform.scale(
            scale: scale,
            child: DropOut(child),
          ),
        );
      },
    );
  }
}

class DropOut extends StatelessWidget {
  final Widget child;

  DropOut(this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('translateY').add(Duration(milliseconds: 1000),
          Tween(begin: 0.0, end: -MediaQuery.of(context).size.height * .1),
          curve: Curves.bounceOut),
      Track('opacity')
          .add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 0.0)),
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: 4000),
      duration: tween.duration,
      child: child,
      tween: tween,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: Transform.translate(
          offset: Offset(0, animation['translateY']),
          child: child,
        ),
      ),
    );
  }
}

class TranslateBase extends StatelessWidget {
  final Widget child;

  TranslateBase(this.child);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, MediaQuery.of(context).size.height * .1),
      child: child,
    );
  }
}

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  List<Widget> _textItems() {
    var list = List<Widget>();
    for (var x in textList) {
      list.add(
        Container(
          height: 70,
          width: 250,
          color: Colors.black.withOpacity(.7),
          child: Center(
            child: Text(
              x,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    switch (_current) {
      case 0:
        {
          return DropIn(_textItems()[_current]);
        }
      case 1:
        {
          return ScrollIn();
        }
      case 2:
        {
          return SpinIn(_textItems()[_current]);
        }
      case 3:
        {
          return ScaleOut(_textItems()[_current]);
        }
    }
    return null;
  }
}
