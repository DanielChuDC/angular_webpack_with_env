const webpack = require('webpack');

module.exports = {
  plugins: [
    new webpack.DefinePlugin({
      'nprocess.env': {
        USERNAME: JSON.stringify(process.env.USERNAME)
      }
    })
  ]
};
