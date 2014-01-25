module.exports = function(config) {
  config.set({
    basePath: '.',
    frameworks: ['dart-unittest'],

    // list of files / patterns to load in the browser
    files: [
      'test/**/main_tests.dart',
      {pattern: '**/*.dart', watched: true, included: false, served: true},
      'packages/browser/dart.js',
      'packages/browser/interop.js'
    ],

    autoWatch: true,

    plugins: [
      'karma-dart'
    ]
    
  });
};
