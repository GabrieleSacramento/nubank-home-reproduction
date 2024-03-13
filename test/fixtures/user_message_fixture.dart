import 'dart:convert';

userMessageMock() {
  const String data = '''
       {
          "success": false,
          "code": "string",
          "errorId": "ACCOUNTS-001",
          "errorCode": 0,
          "detail": "string",
          "userMessage": {
            "title": "Erro de carregamento",
            "text": "Houve um erro para carregar o valor do seu dinheiro disponível, tente novamente.."
          }
        }
      ''';

  return json.decode(data);
}
