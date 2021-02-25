module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: ['plugin:vue/essential', '@vue/airbnb', '@vue/typescript/recommended'],
  parserOptions: {
    ecmaVersion: 2020,
  },
  globals: {
    __DEV__: process.env.NODE_ENV === 'development',
    __PROD__: process.env.NODE_ENV === 'production',
  },
  rules: {
    'no-console': 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',

    'arrow-parens': 0,
    camelcase: 0,
    'class-methods-use-this': 0,

    'import/prefer-default-export': 0,
    'import/extensions': 0,
    'import/no-named-as-default': 0,
    'import/no-unresolved': 0,
    'import/no-named-as-default-member': 0,

    // https://eslint.org/docs/rules/max-len#options
    'max-len': ['error', { code: 150 }],

    'no-bitwise': 0,
    'no-param-reassign': 0,
    'no-plusplus': 0,
    'no-prototype-builtins': 0,
    'no-underscore-dangle': 0,
    'no-restricted-syntax': ['error', 'WithStatement'],
    'max-classes-per-file': 0,
    'no-confusing-arrow': 'error',
    'arrow-body-style': 0,
    'lines-between-class-members': 0,
    

    '@typescript-eslint/no-explicit-any': 0,
    '@typescript-eslint/ban-ts-ignore': 0,
    '@typescript-eslint/ban-ts-comment': 0,
    '@typescript-eslint/explicit-module-boundary-types': 0,
    '@typescript-eslint/camelcase': 0,
    '@typescript-eslint/interface-name-prefix': 0,
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
