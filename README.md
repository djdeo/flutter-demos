# 底部导航栏

## 基础版

通过重写 `initState` 来展示不同界面

```dart
@override
void ininState() {
    list
      ..add(HomeScreen())
      ...// other pages
    super.initState()
}

```

导航UI

主要结构是 BottomNavigationBar > BottomNavigationBarItem > Icon + Text



```dart

bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon:Icon(
               Icons.home,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Home',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ), ...],
           currentIndex: _currentIndex,
           onTap:(int index) {
               setState(() {
                   _currentIndex = index;
               })
           },
           ...
...
```
## 不规则底部导航

需要用到 `floatingActionButton` 来实现， 该button会优先显示在其他 Widget前面，然后将该悬浮按钮与 **底栏** `BottomAppBar` 进行融合就能实现一种不规则底部导航, 底栏的*shape* 采用 `CircularNotchedRectangle()`, 有缺口的圆形矩形，

```dart

Scaffold(
  floatingActionButton: FloatingActionButton(...),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked(), // 将浮动按钮放在中间，固定
  bottomNavigationBar: BottomAppBar(
    ...,
    shape: CirculartNotchedRectangle()
  )
)

```