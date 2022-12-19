const { environment } = require('@rails/webpacker')

// 星をつけるため追加（jQueryを管理下に追加）
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
  })
)



module.exports = environment
