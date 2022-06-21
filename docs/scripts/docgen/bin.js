#!/usr/bin/env node

const { docgen } = require("solidity-docgen");
const path = require('path')
const { readdir, readFile } = require("fs/promises");

async function main() {
  const inputPath = path.resolve(__dirname, '..', '..', '..', 'out')
  const outputPath = path.resolve(__dirname, '..', '..', 'docs', 'contracts')

  const solcInput = { sources: {} }
  const solcOutput = { ...solcInput }

  const solidityFileDirs = await readdir(inputPath);

  const filesToDocument = await Promise.all(solidityFileDirs
    .filter(dir => !dir.endsWith('.t.sol'))
    .map(async dir => {
      const basePath = path.join(inputPath, dir)
      const files = await readdir(basePath)
      return files.map(f => path.join(basePath, f))
    }))

  const outputs = await Promise.all(filesToDocument
    .reduce((list, files) => {
        return [ ...list, ...files ]
      }, [])
    .map(async file => {
      const contents = await readFile(file)
      const json = JSON.parse(contents.toString())
      // rewrite the path because solidity-docgen matches using the input path
      json.ast.absolutePath = path.resolve(inputPath, '..', json.ast.absolutePath)
      const filename = `${file.split(path.sep).pop().slice(0, -5)}.sol`
      return { filename, json }
    }))

  const contracts = [
    {
      input: solcInput,
      output: outputs.reduce((acc, { filename, json }) => {
        acc.sources[filename] = json
        return acc
      }, { ...solcInput })
    }
  ]

  const docConfig = {
    outputDir: outputPath,
    pages: "items",
    templates: path.resolve(__dirname, 'templates'),
    sourcesDir: path.resolve(__dirname, '..', '..', '..', 'src'),
  }

  return docgen(contracts, docConfig)
}

main()
  .then((result) => {
    console.log('Docgen completed')
  })
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
