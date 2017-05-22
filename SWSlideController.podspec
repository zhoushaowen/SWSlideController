Pod::Spec.new do |s|

  s.name         = "SWSlideController"

  s.version      = "0.0.1"

  s.homepage      = 'https://github.com/zhoushaowen/SWSlideController'

  s.ios.deployment_target = '8.0'

  s.summary      = "主流侧滑库"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Zhoushaowen" => "348345883@qq.com" }

  s.source       = { :git => "https://github.com/zhoushaowen/SWSlideController.git", :tag => s.version }
  
  s.source_files  = "SWSlideController/SWSlideController/*.{h,m}"
  
  s.requires_arc = true


end