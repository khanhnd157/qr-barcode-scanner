// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Scanner QR & Code-barres';

  @override
  String get scan => 'Scanner';

  @override
  String get generate => 'Générer';

  @override
  String get history => 'Historique';

  @override
  String get favorites => 'Favoris';

  @override
  String get settings => 'Paramètres';

  @override
  String get result => 'Résultat';

  @override
  String get qrCode => 'Code QR';

  @override
  String get barcode => 'Code-barres';

  @override
  String get scanned => 'Scannés';

  @override
  String get created => 'Créés';

  @override
  String get text => 'Texte';

  @override
  String get url => 'URL';

  @override
  String get phone => 'Téléphone';

  @override
  String get email => 'E-mail';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => 'Contact/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'Géolocalisation';

  @override
  String get calendar => 'Calendrier';

  @override
  String get clipboard => 'Presse-papiers';

  @override
  String get application => 'Application';

  @override
  String get copy => 'Copier';

  @override
  String get share => 'Partager';

  @override
  String get save => 'Enregistrer';

  @override
  String get delete => 'Supprimer';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get done => 'Terminé';

  @override
  String get clear => 'Effacer';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get clearScanned => 'Effacer les scannés';

  @override
  String get clearCreated => 'Effacer les créés';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get actions => 'Actions';

  @override
  String get rawData => 'Données brutes';

  @override
  String get openInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get copyUrl => 'Copier l\'URL';

  @override
  String get copyPassword => 'Copier le mot de passe';

  @override
  String get copyNumber => 'Copier le numéro';

  @override
  String get call => 'Appeler';

  @override
  String get sendEmail => 'Envoyer un e-mail';

  @override
  String get sendSms => 'Envoyer un SMS';

  @override
  String get addContact => 'Ajouter un contact';

  @override
  String get openInMaps => 'Ouvrir dans Plans';

  @override
  String get addToCalendar => 'Ajouter au calendrier';

  @override
  String get searchWeb => 'Rechercher sur le Web';

  @override
  String get wifiSettings => 'Paramètres Wi-Fi';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get urlCopied => 'URL copiée';

  @override
  String get passwordCopied => 'Mot de passe copié';

  @override
  String get numberCopied => 'Numéro copié';

  @override
  String get contactDataCopied =>
      'Données du contact copiées dans le presse-papiers';

  @override
  String get passwordCopiedConnectWifi =>
      'Mot de passe copié — connectez-vous dans les paramètres Wi-Fi';

  @override
  String get openingWifiSettings => 'Ouverture des paramètres Wi-Fi';

  @override
  String get savedToGallery => 'Enregistré dans la galerie';

  @override
  String get noCodeFoundInImage =>
      'Aucun code QR ou code-barres trouvé dans l\'image';

  @override
  String get bulkScanMode => 'Mode scan en masse';

  @override
  String get bulkScanPointAtCodes => 'Scan en masse — pointez vers les codes';

  @override
  String nScanned(int count) {
    return '$count scanné(s)';
  }

  @override
  String get bulk => 'MASSE';

  @override
  String get flashOn => 'Flash activé';

  @override
  String get flashOff => 'Flash désactivé';

  @override
  String get gallery => 'Galerie';

  @override
  String get scanFromGallery => 'Scanner depuis la galerie';

  @override
  String get noHistoryYet => 'Aucun historique pour le moment';

  @override
  String get noScannedResults => 'Aucun résultat scanné';

  @override
  String get noCreatedResults => 'Aucun résultat créé';

  @override
  String get scanToSeeHere =>
      'Scannez un code QR ou un code-barres pour le voir ici';

  @override
  String get generateToSeeHere =>
      'Générez un code QR ou un code-barres pour le voir ici';

  @override
  String get noFavoritesYet => 'Aucun favori pour le moment';

  @override
  String get starItemsToSaveHere =>
      'Ajoutez des éléments en favoris depuis les résultats de scan ou l\'historique pour les enregistrer ici';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get deleteAllHistoryItems =>
      'Supprimer tous les éléments de l\'historique ?';

  @override
  String get deleteAllScannedResults =>
      'Supprimer tous les résultats scannés ?';

  @override
  String get deleteAllCreatedResults => 'Supprimer tous les résultats créés ?';

  @override
  String get deleteItem => 'Êtes-vous sûr de vouloir supprimer cet élément ?';

  @override
  String get searchHistory => 'Rechercher dans l\'historique...';

  @override
  String get appearance => 'APPARENCE';

  @override
  String get theme => 'Thème';

  @override
  String get chooseTheme => 'Choisir le thème';

  @override
  String get systemTheme => 'Système';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get scanSettings => 'SCAN';

  @override
  String get vibrate => 'Vibration';

  @override
  String get vibrateDesc => 'Vibrer lors d\'un scan réussi';

  @override
  String get beepSound => 'Son de bip';

  @override
  String get beepDesc => 'Émettre un son lors d\'un scan réussi';

  @override
  String get bulkScanModeTitle => 'Mode scan en masse';

  @override
  String get bulkScanModeDesc => 'Scanner plusieurs codes en continu';

  @override
  String get openUrlAutomatically => 'Ouvrir les URL automatiquement';

  @override
  String get openUrlDesc => 'Ouvrir les liens dans le navigateur après le scan';

  @override
  String get dataSettings => 'DONNÉES';

  @override
  String get saveHistory => 'Enregistrer l\'historique des scans';

  @override
  String get saveHistoryDesc =>
      'Enregistrer automatiquement les résultats scannés';

  @override
  String get storeImages => 'Stocker les images';

  @override
  String get storeImagesDesc =>
      'Enregistrer les images QR/code-barres générées';

  @override
  String get copyToClipboard => 'Copier dans le presse-papiers';

  @override
  String get copyToClipboardDesc =>
      'Copier automatiquement le résultat du scan dans le presse-papiers';

  @override
  String get about => 'À propos';

  @override
  String get aboutTitle => 'À PROPOS';

  @override
  String get rateUs => 'Nous évaluer';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get version => 'Version';

  @override
  String get cameraPermissionRequired => 'Autorisation de la caméra requise';

  @override
  String get cameraPermissionMessage =>
      'Cette application nécessite l\'accès à la caméra pour scanner les codes QR et les codes-barres. Veuillez accorder l\'autorisation de la caméra dans les paramètres de votre appareil.';

  @override
  String get cameraError => 'Erreur de caméra';

  @override
  String get cameraErrorMessage =>
      'Impossible de démarrer la caméra. Veuillez essayer de fermer et de rouvrir l\'application.';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get enterText => 'Saisir du texte';

  @override
  String get enterPackageName =>
      'Saisir le nom du package ou l\'identifiant App Store';

  @override
  String get enterTextFromClipboard =>
      'Saisir du texte depuis le presse-papiers';

  @override
  String get networkName => 'Nom du réseau (SSID)';

  @override
  String get password => 'Mot de passe';

  @override
  String get security => 'Sécurité';

  @override
  String get hiddenNetwork => 'Réseau masqué';

  @override
  String get fullName => 'Nom complet';

  @override
  String get company => 'Entreprise';

  @override
  String get address => 'Adresse';

  @override
  String get website => 'Site web';

  @override
  String get emailAddress => 'Adresse e-mail';

  @override
  String get subject => 'Objet';

  @override
  String get body => 'Corps';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get message => 'Message';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get label => 'Libellé';

  @override
  String get eventTitle => 'Titre de l\'événement';

  @override
  String get start => 'Début';

  @override
  String get end => 'Fin';

  @override
  String get location => 'Lieu';

  @override
  String get description => 'Description';

  @override
  String get notSet => 'Non défini';

  @override
  String get barcodeData => 'Données du code-barres';

  @override
  String createQr(String type) {
    return 'Créer un QR $type';
  }

  @override
  String createBarcode(String format) {
    return 'Créer un $format';
  }

  @override
  String get privacyPolicyContent =>
      'Politique de confidentialité\n\nCette application traite toutes les données localement sur votre appareil. Aucune donnée personnelle, aucun résultat de scan ni aucun code généré n\'est envoyé à un serveur externe.\n\nAccès à la caméra\nLa caméra est utilisée uniquement pour scanner les codes QR et les codes-barres. Les images ne sont pas stockées sauf si vous activez explicitement le paramètre « Stocker les images ».\n\nStockage des données\nTout l\'historique des scans et les codes générés sont stockés localement sur votre appareil. Vous pouvez supprimer ces données à tout moment depuis l\'écran Historique ou les Paramètres.\n\nServices tiers\nCette application n\'utilise aucun service d\'analyse, de publicité ou de suivi.\n\nContact\nPour toute question concernant cette politique de confidentialité, veuillez nous contacter à privacy@izmaze.com.';
}
