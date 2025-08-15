import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

  void openDialog( BuildContext context ) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Ipsum laboris nisi mollit cupidatat ullamco ut ad. Laborum consequat eu mollit dolor tempor non. Cillum pariatur dolore eiusmod sit. Ut nulla ipsum eu est duis magna aliquip enim dolore culpa proident. Ad labore veniam in fugiat in sit Lorem duis laboris incididunt cillum deserunt. Consequat ut quis tempor consequat consectetur sunt eu laborum voluptate sunt qui magna quis eiusmod.'),
        actions: [
          TextButton( onPressed: ()=> context.pop(), child: const Text('Cancelar')),

          FilledButton( onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Aute amet dolore ipsum ex adipisicing incididunt pariatur eiusmod ipsum duis voluptate commodo qui. Non anim nulla enim do sunt minim anim sit nostrud sunt. Ex culpa ipsum voluptate ut qui Lorem ad. Consequat dolor duis nulla ipsum ea. Nostrud nulla nulla ad pariatur ullamco cupidatat aliquip irure dolore amet deserunt nulla veniam. Id ut duis nulla in commodo elit. Laboris ea ipsum aute excepteur quis magna elit est incididunt veniam deserunt ad veniam.')
                  ]
                );
              }, child: Text('Licencias usadas')),

              FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: Text('Mostrar diálogo'))
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}