#!/bin/bash

pnpm install
pnpm build
pnpm bootstrap
mkdir -p ./temp
cp package.json pnpm-workspace.yaml pnpm-lock.yaml ./temp
rm package.json pnpm-workspace.yaml pnpm-lock.yaml
rm -rf packages/svelte-vscode/node_modules
cd packages/svelte-vscode
npm install
vsce package --skip-license
cd ../../
cp ./temp/package.json ./temp/pnpm-workspace.yaml ./temp/pnpm-lock.yaml ./
