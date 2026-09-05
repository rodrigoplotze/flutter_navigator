# Flutter Navigator Demo

Aplicativo desenvolvido em Flutter para demonstrar os principais recursos do **Navigator**, utilizando:

- Navigator.pushNamed()
- Navigator.pop()
- Navigator.popUntil()
- Navigator.pushReplacementNamed()

Além disso, o projeto implementa gerenciamento de estado com:

- ChangeNotifier
- GetIt (Service Locator)

---

## 📱 Demonstração

O aplicativo é composto por três telas:

### 🏠 Início

Tela inicial contendo um botão para abrir o formulário de cadastro.

<p align="center">
  <img src='assets/screenshots/iniciar.png' />
</p>

### 📝 Cadastro

Tela responsável por coletar as seguintes informações:

- Nome
- E-mail
- Receber notificações (Sim ou Não)

<p align="center">
  <img src='assets/screenshots/cadastrar.png' />
</p>

Ao clicar em **Salvar**, os dados são armazenados no controller e exibidos na próxima tela.

### 👁️ Exibir

Apresenta os dados informados pelo usuário:

- Nome
- E-mail
- Receber notificações

<p align="center">
  <img src='assets/screenshots/exibir.png' />
</p>

Também demonstra diferentes operações de navegação do Flutter.

---

## 🎯 Objetivos do Projeto

Este projeto foi criado com fins educacionais para demonstrar:

- Navegação entre telas utilizando rotas nomeadas.
- Compartilhamento de estado entre múltiplas views.
- Utilização do padrão Controller com ChangeNotifier.
- Injeção de dependência usando GetIt.
- Organização de um projeto Flutter em camadas.

---

## 🏗️ Arquitetura

```text
lib/
├── controllers/
│   └── cadastrar_controller.dart
│
├── core/
│   ├── app_routes.dart
│   └── service_locator.dart
│
├── views/
│   ├── inicio_view.dart
│   ├── cadastrar_view.dart
│   └── exibir_view.dart
│
└── main.dart
```

---

## ▶️ Como Executar

### Clonar o repositório

```bash
git clone https://github.com/rodrigoplotze/flutter_navigator.git
```

### Entrar na pasta do projeto

```bash
cd flutter_navigator
```

### Instalar dependências

```bash
flutter pub get
```

### Executar

```bash
flutter run
```

---

## 📋 Pré-requisitos

- Flutter SDK 3.x ou superior
- Dart SDK
- Android Studio ou VS Code
- Emulador Android/iOS ou navegador compatível com Flutter Web

---

## 🤝 Contribuições

Contribuições são bem-vindas.

Caso encontre algum problema ou tenha sugestões de melhoria, fique à vontade para abrir uma Issue ou enviar um Pull Request.

---

## 📄 Licença

Este projeto está licenciado sob a licença MIT.

---

## 👨‍💻 Autor

**Rodrigo Plotze**

GitHub: https://github.com/rodrigoplotze