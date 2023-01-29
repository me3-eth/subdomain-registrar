#!/usr/bin/env node

import { resolve } from 'node:path'
import dotenv from 'dotenv'
import { getFilesFromPath, Web3Storage } from 'web3.storage'
import * as Name from 'w3name'

const { IPFS_NODE_AUTHORIZATION, IPNS_KEY, WEB3STORAGE_API_KEY } = process.env
const PROJECT_NAME = 'me3.eth'

async function main (commit, buildPath) {
  const files = await getFilesFromPath(resolve(buildPath))

  const name = `${PROJECT_NAME}_${buildPath}-${commit}`
  console.log(`Uploading to ${name}`)

  const web3Client = new Web3Storage({ token: WEB3STORAGE_API_KEY })
  const cid = await web3Client.put(files, {
    name,
    wrapWithDirectory: false
  })
  console.log(`Application CID is ${cid}`)

  if (!IPNS_KEY) return null

  const name = Name.parse(IPNS_KEY)
  const currentRev = await Name.resolve(name)
  const nextRev = await Name.increment(currentRev, `/ipfs/${cid}`)
  return Name.publish(nextRev, name.key)
}

main(process.argv.slice(2))
  .then(published => {
    if (!published) console.log('Deployment finished but not published')
    else console.log('Deployment finished', { published })
  })
  .catch(err => {
    console.error({ err })
    process.exit(1)
  })
