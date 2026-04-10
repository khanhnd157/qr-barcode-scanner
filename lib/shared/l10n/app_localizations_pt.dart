// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Leitor de QR & Código de Barras';

  @override
  String get scan => 'Escanear';

  @override
  String get generate => 'Gerar';

  @override
  String get history => 'Histórico';

  @override
  String get favorites => 'Favoritos';

  @override
  String get settings => 'Configurações';

  @override
  String get result => 'Resultado';

  @override
  String get qrCode => 'Código QR';

  @override
  String get barcode => 'Código de Barras';

  @override
  String get scanned => 'Escaneados';

  @override
  String get created => 'Criados';

  @override
  String get text => 'Texto';

  @override
  String get url => 'URL';

  @override
  String get phone => 'Telefone';

  @override
  String get email => 'E-mail';

  @override
  String get wifi => 'Wi-Fi';

  @override
  String get contact => 'Contato/VCard';

  @override
  String get sms => 'SMS';

  @override
  String get geolocation => 'Geolocalização';

  @override
  String get calendar => 'Calendário';

  @override
  String get clipboard => 'Área de Transferência';

  @override
  String get application => 'Aplicativo';

  @override
  String get copy => 'Copiar';

  @override
  String get share => 'Compartilhar';

  @override
  String get save => 'Salvar';

  @override
  String get delete => 'Excluir';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get done => 'Concluído';

  @override
  String get clear => 'Limpar';

  @override
  String get clearAll => 'Limpar Tudo';

  @override
  String get clearScanned => 'Limpar Escaneados';

  @override
  String get clearCreated => 'Limpar Criados';

  @override
  String get tryAgain => 'Tentar Novamente';

  @override
  String get actions => 'Ações';

  @override
  String get rawData => 'Dados Brutos';

  @override
  String get openInBrowser => 'Abrir no Navegador';

  @override
  String get copyUrl => 'Copiar URL';

  @override
  String get copyPassword => 'Copiar Senha';

  @override
  String get copyNumber => 'Copiar Número';

  @override
  String get call => 'Ligar';

  @override
  String get sendEmail => 'Enviar E-mail';

  @override
  String get sendSms => 'Enviar SMS';

  @override
  String get addContact => 'Adicionar Contato';

  @override
  String get openInMaps => 'Abrir no Mapa';

  @override
  String get addToCalendar => 'Adicionar ao Calendário';

  @override
  String get searchWeb => 'Pesquisar na Web';

  @override
  String get wifiSettings => 'Configurações de Wi-Fi';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get urlCopied => 'URL copiada';

  @override
  String get passwordCopied => 'Senha copiada';

  @override
  String get numberCopied => 'Número copiado';

  @override
  String get contactDataCopied =>
      'Dados do contato copiados para a área de transferência';

  @override
  String get passwordCopiedConnectWifi =>
      'Senha copiada — conecte-se nas configurações de Wi-Fi';

  @override
  String get openingWifiSettings => 'Abrindo configurações de Wi-Fi';

  @override
  String get savedToGallery => 'Salvo na galeria';

  @override
  String get noCodeFoundInImage =>
      'Nenhum código QR ou de barras encontrado na imagem';

  @override
  String get bulkScanMode => 'Modo de Escaneamento em Massa';

  @override
  String get bulkScanPointAtCodes =>
      'Escaneamento em massa — aponte para os códigos';

  @override
  String nScanned(int count) {
    return '$count escaneados';
  }

  @override
  String get bulk => 'MASSA';

  @override
  String get flashOn => 'Flash Ligado';

  @override
  String get flashOff => 'Flash Desligado';

  @override
  String get gallery => 'Galeria';

  @override
  String get scanFromGallery => 'Escanear da galeria';

  @override
  String get noHistoryYet => 'Nenhum histórico ainda';

  @override
  String get noScannedResults => 'Nenhum resultado escaneado';

  @override
  String get noCreatedResults => 'Nenhum resultado criado';

  @override
  String get scanToSeeHere =>
      'Escaneie um código QR ou de barras para vê-lo aqui';

  @override
  String get generateToSeeHere =>
      'Gere um código QR ou de barras para vê-lo aqui';

  @override
  String get noFavoritesYet => 'Nenhum favorito ainda';

  @override
  String get starItemsToSaveHere =>
      'Marque itens dos resultados ou do histórico com estrela para salvá-los aqui';

  @override
  String get clearHistory => 'Limpar Histórico';

  @override
  String get deleteAllHistoryItems => 'Excluir todos os itens do histórico?';

  @override
  String get deleteAllScannedResults =>
      'Excluir todos os resultados escaneados?';

  @override
  String get deleteAllCreatedResults => 'Excluir todos os resultados criados?';

  @override
  String get deleteItem => 'Tem certeza de que deseja excluir este item?';

  @override
  String get searchHistory => 'Pesquisar histórico...';

  @override
  String get appearance => 'APARÊNCIA';

  @override
  String get theme => 'Tema';

  @override
  String get chooseTheme => 'Escolher Tema';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Escuro';

  @override
  String get scanSettings => 'ESCANEAMENTO';

  @override
  String get vibrate => 'Vibrar';

  @override
  String get vibrateDesc => 'Vibrar ao escanear com sucesso';

  @override
  String get beepSound => 'Som de Bipe';

  @override
  String get beepDesc => 'Reproduzir som ao escanear com sucesso';

  @override
  String get bulkScanModeTitle => 'Modo de Escaneamento em Massa';

  @override
  String get bulkScanModeDesc => 'Escanear vários códigos continuamente';

  @override
  String get openUrlAutomatically => 'Abrir URL Automaticamente';

  @override
  String get openUrlDesc => 'Abrir links no navegador após escanear';

  @override
  String get dataSettings => 'DADOS';

  @override
  String get saveHistory => 'Salvar Histórico de Escaneamento';

  @override
  String get saveHistoryDesc =>
      'Salvar automaticamente os resultados escaneados';

  @override
  String get storeImages => 'Armazenar Imagens';

  @override
  String get storeImagesDesc => 'Salvar imagens de QR/código de barras geradas';

  @override
  String get copyToClipboard => 'Copiar para Área de Transferência';

  @override
  String get copyToClipboardDesc =>
      'Copiar automaticamente o resultado para a área de transferência';

  @override
  String get about => 'Sobre';

  @override
  String get aboutTitle => 'SOBRE';

  @override
  String get rateUs => 'Avalie-nos';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get version => 'Versão';

  @override
  String get cameraPermissionRequired => 'Permissão de Câmera Necessária';

  @override
  String get cameraPermissionMessage =>
      'Este aplicativo precisa de acesso à câmera para escanear códigos QR e de barras. Conceda a permissão de câmera nas configurações do dispositivo.';

  @override
  String get cameraError => 'Erro da Câmera';

  @override
  String get cameraErrorMessage =>
      'Não foi possível iniciar a câmera. Tente fechar e reabrir o aplicativo.';

  @override
  String get openSettings => 'Abrir Configurações';

  @override
  String get enterText => 'Inserir texto';

  @override
  String get enterPackageName => 'Inserir nome do pacote ou ID da App Store';

  @override
  String get enterTextFromClipboard => 'Inserir texto da área de transferência';

  @override
  String get networkName => 'Nome da Rede (SSID)';

  @override
  String get password => 'Senha';

  @override
  String get security => 'Segurança';

  @override
  String get hiddenNetwork => 'Rede Oculta';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get company => 'Empresa';

  @override
  String get address => 'Endereço';

  @override
  String get website => 'Site';

  @override
  String get emailAddress => 'Endereço de E-mail';

  @override
  String get subject => 'Assunto';

  @override
  String get body => 'Corpo';

  @override
  String get phoneNumber => 'Número de Telefone';

  @override
  String get message => 'Mensagem';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get label => 'Rótulo';

  @override
  String get eventTitle => 'Título do Evento';

  @override
  String get start => 'Início';

  @override
  String get end => 'Fim';

  @override
  String get location => 'Localização';

  @override
  String get description => 'Descrição';

  @override
  String get notSet => 'Não definido';

  @override
  String get barcodeData => 'Dados do Código de Barras';

  @override
  String createQr(String type) {
    return 'Criar QR de $type';
  }

  @override
  String createBarcode(String format) {
    return 'Criar $format';
  }

  @override
  String get privacyPolicyContent =>
      'Política de Privacidade\n\nEste aplicativo processa todos os dados localmente no seu dispositivo. Nenhum dado pessoal, resultado de escaneamento ou código gerado é enviado a servidores externos.\n\nAcesso à Câmera\nA câmera é utilizada exclusivamente para escanear códigos QR e de barras. As imagens não são armazenadas, a menos que você ative explicitamente a configuração \"Armazenar Imagens\".\n\nArmazenamento de Dados\nTodo o histórico de escaneamento e códigos gerados são armazenados localmente no seu dispositivo. Você pode excluir esses dados a qualquer momento na tela de Histórico ou nas Configurações.\n\nServiços de Terceiros\nEste aplicativo não utiliza serviços de análise, publicidade ou rastreamento.\n\nContato\nPara dúvidas sobre esta política de privacidade, entre em contato conosco em privacy@izmaze.com.';
}
