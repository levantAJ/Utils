Pod::Spec.new do |s|
  s.module_name = 'Utils'
  s.name = 'Utils'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Common utilities for @levantAJ team'
  s.homepage = 'https://github.com/levantAJ'
  s.authors = { 'Le Tai' => 'sirlevantai@gmail.com' }
  s.source = {  :git => 'https://github.com/levantAJ/Utils.git', :tag => s.version}
  s.source_files = 'Utils/**/*.{h,swift}'
  s.resources = "Utils/**/*.{xib}"
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
end
