// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Escáner de QR y código de barras';

  @override
  String get scan => 'Escanear';

  @override
  String get generate => 'Generar';

  @override
  String get history => 'Historial';

  @override
  String get favorites => 'Favoritos';

  @override
  String get settings => 'Ajustes';

  @override
  String get result => 'Resultado';

  @override
  String get qrCode => 'Código QR';

  @override
  String get barcode => 'Código de barras';

  @override
  String get scanned => 'Escaneados';

  @override
  String get created => 'Creados';

  @override
  String get text => 'Texto';

  @override
  String get url => 'URL';

  @override
  String get phone => 'Teléfono';

  @override
  String get email => 'Correo electrónico';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => 'Contacto/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'Geolocalización';

  @override
  String get calendar => 'Calendario';

  @override
  String get clipboard => 'Portapapeles';

  @override
  String get application => 'Aplicación';

  @override
  String get copy => 'Copiar';

  @override
  String get share => 'Compartir';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get done => 'Listo';

  @override
  String get clear => 'Borrar';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get clearScanned => 'Borrar escaneados';

  @override
  String get clearCreated => 'Borrar creados';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get actions => 'Acciones';

  @override
  String get rawData => 'Datos sin procesar';

  @override
  String get openInBrowser => 'Abrir en el navegador';

  @override
  String get copyUrl => 'Copiar URL';

  @override
  String get copyPassword => 'Copiar contraseña';

  @override
  String get copyNumber => 'Copiar número';

  @override
  String get call => 'Llamar';

  @override
  String get sendEmail => 'Enviar correo electrónico';

  @override
  String get sendSms => 'Enviar SMS';

  @override
  String get addContact => 'Añadir contacto';

  @override
  String get openInMaps => 'Abrir en Mapas';

  @override
  String get addToCalendar => 'Añadir al calendario';

  @override
  String get searchWeb => 'Buscar en la web';

  @override
  String get wifiSettings => 'Ajustes de Wi-Fi';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get urlCopied => 'URL copiada';

  @override
  String get passwordCopied => 'Contraseña copiada';

  @override
  String get numberCopied => 'Número copiado';

  @override
  String get contactDataCopied => 'Datos de contacto copiados al portapapeles';

  @override
  String get passwordCopiedConnectWifi =>
      'Contraseña copiada — conéctese en los ajustes de Wi-Fi';

  @override
  String get openingWifiSettings => 'Abriendo ajustes de Wi-Fi';

  @override
  String get savedToGallery => 'Guardado en la galería';

  @override
  String get noCodeFoundInImage =>
      'No se encontró ningún código QR ni código de barras en la imagen';

  @override
  String get bulkScanMode => 'Modo de escaneo masivo';

  @override
  String get bulkScanPointAtCodes => 'Escaneo masivo — apunte a los códigos';

  @override
  String nScanned(int count) {
    return '$count escaneados';
  }

  @override
  String get bulk => 'MASIVO';

  @override
  String get flashOn => 'Flash encendido';

  @override
  String get flashOff => 'Flash apagado';

  @override
  String get gallery => 'Galería';

  @override
  String get scanFromGallery => 'Escanear desde la galería';

  @override
  String get noHistoryYet => 'Aún no hay historial';

  @override
  String get noScannedResults => 'No hay resultados escaneados';

  @override
  String get noCreatedResults => 'No hay resultados creados';

  @override
  String get scanToSeeHere =>
      'Escanee un código QR o de barras para verlo aquí';

  @override
  String get generateToSeeHere =>
      'Genere un código QR o de barras para verlo aquí';

  @override
  String get noFavoritesYet => 'Aún no hay favoritos';

  @override
  String get starItemsToSaveHere =>
      'Marque elementos con estrella desde los resultados de escaneo o el historial para guardarlos aquí';

  @override
  String get clearHistory => 'Borrar historial';

  @override
  String get deleteAllHistoryItems =>
      '¿Eliminar todos los elementos del historial?';

  @override
  String get deleteAllScannedResults =>
      '¿Eliminar todos los resultados escaneados?';

  @override
  String get deleteAllCreatedResults =>
      '¿Eliminar todos los resultados creados?';

  @override
  String get deleteItem => '¿Está seguro de que desea eliminar este elemento?';

  @override
  String get searchHistory => 'Buscar en el historial...';

  @override
  String get appearance => 'APARIENCIA';

  @override
  String get theme => 'Tema';

  @override
  String get chooseTheme => 'Elegir tema';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get scanSettings => 'ESCANEO';

  @override
  String get vibrate => 'Vibrar';

  @override
  String get vibrateDesc => 'Vibrar al escanear correctamente';

  @override
  String get beepSound => 'Sonido';

  @override
  String get beepDesc => 'Reproducir sonido al escanear correctamente';

  @override
  String get bulkScanModeTitle => 'Modo de escaneo masivo';

  @override
  String get bulkScanModeDesc => 'Escanear múltiples códigos de forma continua';

  @override
  String get openUrlAutomatically => 'Abrir URL automáticamente';

  @override
  String get openUrlDesc => 'Abrir enlaces en el navegador tras el escaneo';

  @override
  String get dataSettings => 'DATOS';

  @override
  String get saveHistory => 'Guardar historial de escaneo';

  @override
  String get saveHistoryDesc =>
      'Guardar automáticamente los resultados escaneados';

  @override
  String get storeImages => 'Almacenar imágenes';

  @override
  String get storeImagesDesc =>
      'Guardar imágenes de QR/códigos de barras generados';

  @override
  String get copyToClipboard => 'Copiar al portapapeles';

  @override
  String get copyToClipboardDesc =>
      'Copiar automáticamente el resultado del escaneo al portapapeles';

  @override
  String get about => 'Acerca de';

  @override
  String get aboutTitle => 'ACERCA DE';

  @override
  String get rateUs => 'Califícanos';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get version => 'Versión';

  @override
  String get cameraPermissionRequired => 'Permiso de cámara requerido';

  @override
  String get cameraPermissionMessage =>
      'Esta aplicación necesita acceso a la cámara para escanear códigos QR y códigos de barras. Por favor, conceda el permiso de cámara en los ajustes de su dispositivo.';

  @override
  String get cameraError => 'Error de cámara';

  @override
  String get cameraErrorMessage =>
      'No se pudo iniciar la cámara. Intente cerrar y volver a abrir la aplicación.';

  @override
  String get openSettings => 'Abrir ajustes';

  @override
  String get enterText => 'Introducir texto';

  @override
  String get enterPackageName =>
      'Introducir nombre del paquete o ID de App Store';

  @override
  String get enterTextFromClipboard => 'Introducir texto del portapapeles';

  @override
  String get networkName => 'Nombre de la red (SSID)';

  @override
  String get password => 'Contraseña';

  @override
  String get security => 'Seguridad';

  @override
  String get hiddenNetwork => 'Red oculta';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get company => 'Empresa';

  @override
  String get address => 'Dirección';

  @override
  String get website => 'Sitio web';

  @override
  String get emailAddress => 'Dirección de correo electrónico';

  @override
  String get subject => 'Asunto';

  @override
  String get body => 'Cuerpo';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get message => 'Mensaje';

  @override
  String get latitude => 'Latitud';

  @override
  String get longitude => 'Longitud';

  @override
  String get label => 'Etiqueta';

  @override
  String get eventTitle => 'Título del evento';

  @override
  String get start => 'Inicio';

  @override
  String get end => 'Fin';

  @override
  String get location => 'Ubicación';

  @override
  String get description => 'Descripción';

  @override
  String get notSet => 'No establecido';

  @override
  String get barcodeData => 'Datos del código de barras';

  @override
  String createQr(String type) {
    return 'Crear QR de $type';
  }

  @override
  String createBarcode(String format) {
    return 'Crear $format';
  }

  @override
  String get privacyPolicyContent =>
      'Política de privacidad\n\nEsta aplicación procesa todos los datos de forma local en su dispositivo. No se envían datos personales, resultados de escaneo ni códigos generados a ningún servidor externo.\n\nAcceso a la cámara\nLa cámara se utiliza exclusivamente para escanear códigos QR y códigos de barras. Las imágenes no se almacenan a menos que active explícitamente el ajuste \"Almacenar imágenes\".\n\nAlmacenamiento de datos\nTodo el historial de escaneo y los códigos generados se almacenan localmente en su dispositivo. Puede eliminar estos datos en cualquier momento desde la pantalla de Historial o Ajustes.\n\nServicios de terceros\nEsta aplicación no utiliza servicios de análisis, publicidad ni seguimiento.\n\nContacto\nPara preguntas sobre esta política de privacidad, contáctenos en privacy@izmaze.com.';
}
