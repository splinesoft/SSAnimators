Pod::Spec.new do |s|
  s.name         = "SSAnimators"
  s.version      = "0.0.1"
  s.summary      = "A collection of iOS 7 view controller animators."
  s.homepage     = "https://github.com/splinesoft/SSAnimators"
  s.license      = { :type => 'MIT', :file => 'LICENSE'  }
  s.author       = { "Jonathan Hersh" => "jon@her.sh" }
  s.source       = { :git => "https://github.com/splinesoft/SSAnimators.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'SSAnimators/*.{h,m}'
  s.frameworks   = 'UIKit', 'Foundation'
  s.ios.deployment_target = '7.0'
end
