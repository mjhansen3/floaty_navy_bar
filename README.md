#  :package: Floaty Navy Bar

<img width="450" height="900" src="https://github.com/mjhansen3/floaty_navy_bar/blob/master/example/images/floaty.png?raw=true">

<img width="450" height="900" src="https://github.com/mjhansen3/floaty_navy_bar/blob/master/example/images/customizable_floaty.png?raw=true">

<img width="450" height="900" src="https://github.com/mjhansen3/floaty_navy_bar/blob/master/example/images/dynamic_floaty.png?raw=true">

## :computer: EXAMPLE

```dart
      Scaffold(
        backgroundColor: Colors.grey[140],
        // BODY TAKES IN A STACK WIDGET WHICH INCLUDES:
        // List<Widgets>, [Home(), Search(), Settings(), Profile()] and
        // FloatingNavigationBar
        body: Stack(
          children: [
            List<Widget>,
            FloatyNavyBar(
              backgroundColor: Colors.black87,
              barHeight: 70.0,
              iconColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              iconSize: 28.0,
              indicatorColor: Colors.white,
              indicatorHeight: 3,
              indicatorWidth: 14.0,
              items: [
                NavyBarItem(
                  icon: EvaIcons.homeOutline,
                ),
                NavyBarItem(
                  icon: EvaIcons.search,
                  title: "Search",
                ),
                NavyBarItem(
                  icon: EvaIcons.settingsOutline,
                ),
                NavyBarItem(
                  icon: EvaIcons.personOutline,
                  title: "Profile",
                ),
              ],
              onChanged: (value) {
                // USE YOUR STATE MANAGEMENT TECHNIQUE TO GET
                // AND CHANGE INDEX OF NAVIGATION BAR
              },
            )
          ],
        ),
      );
```
Willing to contribute?
Go ahead and send pull request :grin:

Found bug or issues? :disappointed:
Open an issue on Github repo

## :key: License

MIT License
