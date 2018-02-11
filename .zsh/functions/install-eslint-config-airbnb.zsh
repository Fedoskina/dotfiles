function install-eslint-config-airbnb() {
  local PKG="eslint-config-airbnb"
  npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs yarn add --dev "$PKG@latest"
}
