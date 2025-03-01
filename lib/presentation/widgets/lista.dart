import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: ABC123', // Changed data
          subtitle: 'Conductor: Maria Gomez\nEmpresa: ABC Corp', // Changed data
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: DEF456', // Changed data
          subtitle: 'Conductor: Juan Perez\nEmpresa: XYZ Ltd', // Changed data
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: GHI789', // Changed data
          subtitle: 'Conductor: Ana Rodriguez\nEmpresa: 123 Inc', // Changed data
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: JKL012', // Added new item
          subtitle: 'Conductor: Carlos Martinez\nEmpresa: DEF Co', // Added new item
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: MNO345', // Added new item
          subtitle: 'Conductor: Sofia Hernandez\nEmpresa: GHI Ltd', // Added new item
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, {
    required ImageType imageType,
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: _buildImage(imageType, imagePath),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Editar'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Editar vehículo')),
                  );
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Eliminar'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Eliminar vehículo')),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(ImageType imageType, String imagePath) {
    switch (imageType) {
      case ImageType.asset:
        return Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Detailed error loading image: $error');
            print('StackTrace: $stackTrace');
            print('Image path attempted: $imagePath');
            return Icon(Icons.error, color: Colors.red);
          },
        );
      case ImageType.icon:
        return Icon(Icons.car_repair, size: 50, color: Colors.grey);
      case ImageType.network:
        return Image.network(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading network image: $error');
            print('StackTrace: $stackTrace');
            return Icon(Icons.error, color: Colors.red);
          },
        );
    }
  }
}

enum ImageType { asset, icon, network }