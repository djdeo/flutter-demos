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
