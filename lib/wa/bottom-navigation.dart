import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

    class BottomNav extends StatefulWidget {
      const BottomNav({super.key});

      @override
      State<BottomNav> createState() => _BottomNavState();
    }

    class _BottomNavState extends State<BottomNav> {
      int select=1;
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Expanded(
                flex: 90,
                child:
            select==1?ChatsView() :select==2?  Updates(): select==3?Calls():Community()
            ),
            Expanded(
                flex: 10,
                child: Container(
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    ColumnButton(icon: Icons.chat_sharp, text: 'Chats', onTap: (){
                      select=1;
                      setState(() {

                      });
                    }),
                    ColumnButton(icon: Icons.update_sharp, text: 'Updates', onTap: (){
                      select=2;
                      setState(() {

                      });

                    }),
                    ColumnButton(icon: Icons.call, text: 'Calls', onTap: (){
                      select=3;
                      setState(() {

                      });
                    }),
                    ColumnButton(icon: Icons.group, text: 'Communities', onTap: (){
                      select=4;
                      setState(() {

                      });

                    }),
                  ]

                ),
                ),
            )
          ],
            ),
        );
      }
    }

    class ColumnButton extends StatelessWidget {
      String text;
      IconData icon;
      VoidCallback onTap;
       ColumnButton({super.key, required this.icon, required this.text, required this.onTap});

      @override
      Widget build(BuildContext context) {
        return   Column(children: [
          IconButton(
             icon:  Icon(icon),
            onPressed: onTap,
              ),
          Text(text)
        ],);
      }
    }


    class ChatsView extends StatelessWidget {
       ChatsView({super.key});
List names=['112','345','567'];
List subnames=['asd','ghj','vbb'];
      @override
      Widget build(BuildContext context) {
        return Container(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      ChatSeen(image: 'assets/loginimg.png'
                          , subtitle: subnames[index],
                          title: names[index])));
                },
                title: Text(names[index]),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/loginimg.png'),),
                subtitle: Text(subnames[index]),
                
              );
            },
            
          )
          // Column(children: [
          //   ListTile(
          //     onTap: (){
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context)=>
          //               ChatSeen(
          //                 title:'abc name' ,
          //                 subtitle:'xyz sub title' ,
          //                 image: 'assets/loginimg.png',
          //               )));
          //     },
          //     leading: CircleAvatar(backgroundImage: AssetImage('assets/loginimg.png')
          //       ,),
          //     title: Text('abc name'),
          //     subtitle: Text('xyz sub title'),
          //   )
          // ],),
        );
      }
    }
    class ChatSeen extends StatelessWidget {
      String title;
      String subtitle;
      String image;
       ChatSeen({super.key, required this.image, required this.subtitle, required this.title});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            leading: CircleAvatar(backgroundImage: AssetImage(image),),
            title: Text(title),
          ),
        );
      }
    }


    class Updates extends StatelessWidget {
      const Updates({super.key});

      @override
      Widget build(BuildContext context) {
        return Container(child: Center(child: Text('Updates'),),);
      }
    }

    class Calls extends StatelessWidget {
      const Calls({super.key});

      @override
      Widget build(BuildContext context) {
        return Container(
          child: Center(child: Text('Callss'),),
        );
      }
    }

    class Community extends StatelessWidget {
      const Community({super.key});

      @override
      Widget build(BuildContext context) {
        return Container(child: Center(child: Text('Community'),),);
      }
    }







