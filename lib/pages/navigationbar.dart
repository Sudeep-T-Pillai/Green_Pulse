/*import 'package:flutter/material.dart';
import 'package:green_pulse/pages/dashboard.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget{
          const NavigationMenu({super.key});

          @override
          Widget build (BuildContext context){
            final controller = Get.put(Navigationcontroller());

            return Scaffold(
               bottomNavigationBar: Obx(
                 () => NavigationBar(
                 height: 80,
                 elevation:0,
                 selectedIndex: controller.selectedIndex.value,
                 onDestinationSelected: (index) =>controller.selectedIndex.value = index,
                  destinations: const [
                      NavigationDestination(icon: Icon(Iconsax.home),label:'Home'),
                      NavigationDestination(icon: Icon(Iconsax.note1), label:'Analytics'),
                      NavigationDestination(icon: Icon(Iconsax.profile1), label: 'Profile')
                  ]),
               ),
                body:Obx(()=> controller.screen[controller.selectedIndex.value]),
            );
          }
}

class Navigationcontroller extends GetxController{
            final Rx<int> selectedIndex = 0.obs;
            final screen =[const Dashboard(),Container(color:Colors.purple),Container(color:Colors.orange),Container(color:Colors.amber)];
}*/
