import js from "@eslint/js";
import globals from "globals";
import reactHooks from "eslint-plugin-react-hooks";
import reactRefresh from "eslint-plugin-react-refresh";
import tseslint from "@typescript-eslint/eslint-plugin";
import tsParser from "@typescript-eslint/parser";
import prettierConfig from "eslint-config-prettier";

export default [
  {
    ignores: ["dist"], // Files to ignore
  },
  {
    files: ["**/*.{ts,tsx}"], // Target TypeScript files
    languageOptions: {
      ecmaVersion: 2020, // ECMAScript version
      globals: {
        React: "writable", // Allow React to be reassigned
        ...globals.browser, // Include browser globals (console, document, etc.)
      },
      parser: tsParser, // Use TypeScript parser
    },
    plugins: {
      "react-hooks": reactHooks,
      "react-refresh": reactRefresh,
      "@typescript-eslint": tseslint, // Include the TypeScript ESLint plugin
    },
    rules: {
      ...js.configs.recommended.rules, // Include base JS recommended rules
      ...tseslint.configs.recommended.rules, // Include TypeScript recommended rules
      ...reactHooks.configs.recommended.rules, // Include React hooks recommended rules
      "react-refresh/only-export-components": [
        "warn",
        { allowConstantExport: true },
      ],
    },
  },
  prettierConfig, // Include Prettier config as a separate entry
];
