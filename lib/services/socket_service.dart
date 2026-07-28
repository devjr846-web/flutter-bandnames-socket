import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: constant_identifier_names
enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket? _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket!;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    _socket = IO.io('http://192.168.5.215:3001', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket?.on('connect', (data) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket?.on('disconnect', (data) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    _socket?.on('nuevo-mensaje', (data) {
      print('nuevo-mensaje: ');
      print('nombre: ' + data['nombre']);
      print('mensaje: ' + data['mensaje']);
    });

    _socket?.on('active-bands', (payload) {
      print(payload);
    });
  }
}
