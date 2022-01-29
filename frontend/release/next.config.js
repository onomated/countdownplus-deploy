const withPlugins = require('next-compose-plugins');
const withBundleAnalyzer = require('@next/bundle-analyzer');
const withAntdLess = require('next-plugin-antd-less');

const pluginBundleAnalyzer = withBundleAnalyzer({
  enabled: process.env.ANALYZE === 'true',
});

const pluginAntdLess = withAntdLess({
  // modifyVars: {
  //   '@THEME--DARK': 'theme-dark',
  // },
  lessVarsFilePath: './src/styles/variables.less',
  // cssLoaderOptions: {
  // esModule: false,
  // sourceMap: false,
  // modules: {
  // mode: 'local',
  // localIdentName: '[hash:2]',
  // },
  // },
});

module.exports = withPlugins([[pluginBundleAnalyzer], [pluginAntdLess]], {
  reactStrictMode: true,
  eslint: {
    dirs: ['.'],
  },
  webpack(config) {
    return config;
  },
  experimental: {
    outputStandalone: true,
  },
});
