import 'package:aladin_ecommerce/view_model/accounts/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});
  

  @override
  Widget build(BuildContext context) {

    final profileViewModel = Get.put(ProfileViewModel());

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Obx( () =>
          profileViewModel.loading.value 
          ? const Center(child: CircularProgressIndicator())
          : UserAccountsDrawerHeader(
                accountName: Text(
                  profileViewModel.user.value.user!.name.toString(), 
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 16
                  ),
                ),
                accountEmail: const Text(
                  "Email", 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 14
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    // Profile Image
                    child: Image.network(
                      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=300&q=60',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    // Cover Image
                    image: NetworkImage(
                      'https://matrixschools.edu.my/wp-content/uploads/DSC_6422-1024x681.jpg'
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),

        

          NavBarWidget(
            title: "Vouchers & Offers", 
            icon: Icons.featured_play_list_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Favourite", 
            icon: Icons.favorite_border_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Orders", 
            icon: Icons.list_alt_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Profile", 
            icon: Icons.person_outline, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Addresses", 
            icon: Icons.location_on_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Help Center", 
            icon: Icons.help_center_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),
          

          const Divider(),

          NavBarWidget(
            title: "Settings", 
            icon: Icons.settings_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Terms & Condition / Privacy", 
            icon: Icons.verified_user_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),

          NavBarWidget(
            title: "Logout", 
            icon: Icons.logout_outlined, 
            onPress: (){
              Navigator.pop(context);
            }
          ),
          
        ],
      ),
    );
  }
}




class NavBarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const NavBarWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.pinkAccent,),
      title: Text(title),
      onTap: onPress,
    );
  }
}


