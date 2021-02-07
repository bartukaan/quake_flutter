import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:quake_flutter/models/building_model.dart';
import 'package:quake_flutter/utilities/constants.dart';

class BuildingStatus extends StatefulWidget {
  @override
  _BuildingStatusState createState() => _BuildingStatusState();
}

class _BuildingStatusState extends State<BuildingStatus> {
  Building building = Building();
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bina Durumu'),),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  else
                    Text('Kod tara'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Kamera yönü ${describeEnum(snapshot.data)}');
                                } else {
                                  return Text('yükleniyor');
                                }
                              },
                            )),
                      )
                    ],
                  ),
             /*     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: Text('pause', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: Text('resume', style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          ),
          Expanded(flex: 6,child:Column(children: [
            _buildAddressLabel(),
            _buildMalzemeLabel(),
            _buildRiskLabel(),
            _buildHasarLabel(),

          ],) )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  Widget _buildBuildingTypeLabel() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          initialValue: 'Apartman',
          enabled: false,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            labelText: 'Bina Tipi',
            labelStyle: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
  Widget _buildAddressLabel() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          initialValue: 'Yeni Girne Caddesi 7465 sokak No:18/2 Karşıyaka/İzmir',
          enabled: false,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            labelText: "Address",
            labelStyle: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
  Widget _buildRiskLabel() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          initialValue: '6/10',
          enabled: false,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            labelText: "Risk Durumu",
            labelStyle: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
  Widget _buildHasarLabel() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          initialValue: '2/10',
          enabled: false,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            labelText: "Hasar Durumu",
            labelStyle: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
  Widget _buildMalzemeLabel() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          initialValue: 'Beton',
          enabled: false,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            labelText: "Address",
            labelStyle: kLabelTextStyle,
          ),
        ),
      ),
    );
  }

}
