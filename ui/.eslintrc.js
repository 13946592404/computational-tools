module.exports = {
  env: {
    browser: true,
    es6: true,
  },
  extends: [
    'plugin:vue/essential',
    'airbnb-base',
  ],
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly',
  },
  parserOptions: {
    ecmaVersion: 2018,
    parser: '@typescript-eslint/parser',
    sourceType: 'module',
  },
  plugins: [
    'vue',
    '@typescript-eslint',
  ],
  rules: {
    'max-len': ['error', { code: 150 }],
  },
  overrides: [
    {
      files: ['**/__test__/*.{j,t}s?(x)', '**/tests/unit/**/*\.spec\.{j,t}s?(x)'],
      env: {
        jest: true,
      },
    },
  ],
};
