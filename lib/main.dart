import 'package:flutter/material.dart';

void main() {
  runApp(const MiTarjetaApp());
}

class MiTarjetaApp extends StatelessWidget {
  const MiTarjetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TarjetaScreen(),
    );
  }
}

class TarjetaScreen extends StatefulWidget {
  const TarjetaScreen({super.key});

  @override
  State<TarjetaScreen> createState() => _TarjetaScreenState();
}

class _TarjetaScreenState extends State<TarjetaScreen> {

  bool modoOscuro = false;
  bool favorito = false;

  @override
  Widget build(BuildContext context) {

    Color fondo = modoOscuro
        ? const Color(0xff121212)
        : const Color(0xffE3F2FD);

    Color tarjeta = modoOscuro
        ? const Color(0xff1E1E1E)
        : Colors.white;

    Color texto = modoOscuro
        ? Colors.white
        : Colors.black87;

    return Scaffold(

      backgroundColor: fondo,

      appBar: AppBar(
        title: const Text("Mi Tarjeta de Presentación"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
  child: Center(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: AnimatedContainer(

          duration: const Duration(milliseconds: 500),

          curve: Curves.easeInOut,

          width: 370,

          padding: const EdgeInsets.all(20),

          child: Card(

            color: tarjeta,

            elevation: modoOscuro ? 3 : 12,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),

            child: Padding(

              padding: const EdgeInsets.all(25),

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  CircleAvatar(

                    radius: 60,

                    backgroundColor: Colors.blue,

                    child: const CircleAvatar(

                      radius: 56,

                      backgroundImage: const AssetImage("assets/foto.jpg"),

                    ),

                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Daniel Sosa",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: texto,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Desarrollador Full Stack",
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Docente de Desarrollo de Software, apasionado por Flutter, Android y el desarrollo Web.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: texto,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Divider(),

                  const SizedBox(height: 10),

                  informacion(
                    Icons.email,
                    "daniel@correo.com",
                    texto,
                  ),

                  informacion(
                    Icons.phone,
                    "+503 7777-7777",
                    texto,
                  ),

                  informacion(
                    Icons.location_on,
                    "San Salvador, El Salvador",
                    texto,
                  ),

                  informacion(
                    Icons.language,
                    "github.com/93Cast",
                    texto,
                  ),

                  const SizedBox(height: 20),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      IconButton(

                        onPressed: () {

                          ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(
                              content: Text("Correo seleccionado"),
                            ),

                          );

                        },

                        icon: const Icon(
                          Icons.email,
                          size: 30,
                          color: Colors.red,
                        ),

                      ),

                      IconButton(

                        onPressed: () {

                          ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(
                              content: Text("GitHub seleccionado"),
                            ),

                          );

                        },

                        icon: const Icon(
                          Icons.code,
                          size: 30,
                          color: Colors.black,
                        ),

                      ),

                      IconButton(

                        onPressed: () {

                          setState(() {
                            favorito = !favorito;
                          });

                        },

                        icon: Icon(

                          favorito
                              ? Icons.favorite
                              : Icons.favorite_border,

                          color: Colors.pink,
                          size: 30,

                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 20),

                  SizedBox(

                    width: double.infinity,

                    child: FilledButton.icon(

                      icon: Icon(
                        modoOscuro
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),

                      label: Text(
                        modoOscuro
                            ? "Modo Claro"
                            : "Modo Oscuro",
                      ),

                      onPressed: () {

                        setState(() {

                          modoOscuro = !modoOscuro;

                        });

                      },

                    ),

                  ),

                ],

              ),

            ),

          ),

        ),

      ),

    ),
      ),
    );

  }

  Widget informacion(
      IconData icono,
      String texto,
      Color colorTexto,
      ) {

    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(

        children: [

          Icon(
            icono,
            color: Colors.blue,
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Text(

              texto,

              style: TextStyle(

                color: colorTexto,
                fontSize: 16,

              ),

            ),

          ),

        ],

      ),

    );

  }

}