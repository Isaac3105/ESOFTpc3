import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPC1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Isaac's App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello, my name is Isaac Santos'),
              SizedBox(height: 40),
              NavigationWidget(),
              SizedBox(height: 40),
              ToggleWidget(),
              SizedBox(height: 40),
              InputEchoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Navigation Widget', style: TextStyle(fontWeight: FontWeight.bold)),
        ElevatedButton(
          key: const Key('navigation_button'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          },
          child: const Text('Go to next page'),
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: const Center(
        child: Text('not original page'),
      ),
    );
  }
}

class InputEchoWidget extends StatefulWidget {
  const InputEchoWidget({super.key});

  @override
  State<InputEchoWidget> createState() => _InputEchoWidgetState();
}

class _InputEchoWidgetState extends State<InputEchoWidget> {
  final TextEditingController _controller = TextEditingController();
  String _echoText = '';

  void _submit() {
    setState(() {
      _echoText = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Input Echo Widget', style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
          child: TextField(
            key: const Key('echo_text_field'),
            controller: _controller,
            decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter text here'),
          ),
        ),
        ElevatedButton(
          key: const Key('echo_submit_button'),
          onPressed: _submit,
          child: const Text('Submit'),
        ),
        const SizedBox(height: 8),
        Text('Echo: $_echoText', key: const Key('echo_display_text')),
      ],
    );
  }
}

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool _isToggled = false;

  void _toggle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Toggle Widget', style: TextStyle(fontWeight: FontWeight.bold)),
        Text(_isToggled ? 'Status: ON' : 'Status: OFF'),
        Switch(
          key: const Key('toggle_switch'),
          value: _isToggled,
          onChanged: (bool value) {
            _toggle();
          },
        ),
      ],
    );
  }
}
