

# source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

gem 'cocoapods', '1.9.3'
gem 'bd_pod_extentions','6.4.0'
require 'bd_pod_extentions'

bd_use_app('xigua', 'toutiao', 'public', 'thirdParty', 'douyin', 'zhibozhongtai')
#二进制显示源码
showCode!

#ByteBus 依赖下载，详细说明参考http://mobile.bytedance.net/docs/manual/access_component/
useBusDownload!

target 'FeedDemo' do
#    pod 'SDWebImage'
#    pod 'AFNetworking'
    pod 'YYModel'
    pod 'MJRefresh'
    pod 'Masonry'
    pod_binary 'BDWebImage', '1.0.16-rc.17', :subspecs => [
    'Core',
    'Decoder',
    'Download',
    'SDAdapter',
    'Monitor/TTMonitor',
    'Monitor/Heimdallr',
    'Download/Chromium',
    'Download/DownloadBase',
    'Download/URLSession',
    'Monitor'
    ]
    pod_binary 'TTNetworkManager', '2.2.23.1'


   
end

