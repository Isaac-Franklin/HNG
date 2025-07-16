import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
// import 'package:iabiacitizenapp/presentation/userarea/widgets/emercengycontacts.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showBackButton;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget body;
  final VoidCallback? onPressed;
  final bool showFloatingIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    required this.centerTitle,
    required this.body,
    this.onPressed,
    this.showFloatingIcon = false,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(DeviceUtils.screenWidth, 50);
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          widget.showBackButton
              ? null
              : Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(color: AppColors.primary),
                      child: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    ListTile(leading: Icon(Icons.home), title: Text('Home')),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                    ),
                  ],
                ),
              ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading:
            widget.showBackButton
                ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                )
                : Builder(
                  builder:
                      (context) => IconButton(
                        icon: Icon(Icons.menu, color: AppColors.primary),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                ),
        title: AnimationSet.fadeIn(
          controller: _controller,
          child: widget.title,
          // Text(
          //   widget.title,
          //   style: const TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.w400,
          //     fontSize: 18,
          //   ),
          // ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: GestureDetector(
              child: Icon(Icons.emergency, size: 20),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return EmergencyContacts();
                //     },
                //   ),
                // );
                context.push('/emergency');
              },
            ),
            // emergencycontact
          ),
          SizedBox(width: 10),

          //
          // Container(
          //   padding: EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //     color: AppColors.primary,
          //     borderRadius: BorderRadius.circular(40),
          //   ),
          //   child: Icon(Icons.verified_user_outlined),
          // ),
          // SizedBox(width: 10),
        ],
        centerTitle: widget.centerTitle,
        // actions: widget.actions,
      ),
      body: widget.body,

      floatingActionButton:
          widget.showFloatingIcon
              ? FloatingActionButton(
                onPressed: widget.onPressed,
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.add, color: Colors.white),
              )
              : null,
    );
  }
}
