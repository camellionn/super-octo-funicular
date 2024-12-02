import js from "@eslint/js";
import ts from "@typescript-eslint/eslint-plugin";
import tsParser from "@typescript-eslint/parser";
import react from "eslint-plugin-react";
import globals from "globals";

/** @type {import("eslint").FlatConfig[]} */
const config = [
  {
    ignores: ["dist/"],
    files: ["**/*.{js,mjs,cjs,ts,jsx,tsx}"],
    languageOptions: {
      parser: tsParser,
      parserOptions: {
        ecmaVersion: "latest",
        sourceType: "module",
      },
      globals: globals.browser, // Add browser globals
    },
    plugins: {
      react,
      "@typescript-eslint": ts,
    },
    settings: {
      react: {
        version: "detect",
      },
    },
    rules: {
      ...js.configs.recommended.rules,
      ...ts.configs.recommended.rules,
      ...react.configs.flat.recommended.rules,
      "react/react-in-jsx-scope": "off", // Suppress "React in scope" errors
      "react/jsx-no-target-blank": "off", // Suppress target="_blank" warnings
    },
  },
];

export default config;
