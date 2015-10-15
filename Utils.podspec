Pod::Spec.new do |s|
  s.module_name = 'Utils'
  s.name = 'Utils'
  s.version = '0.0.1'
  s.summary = 'Common project to processing all things'
  s.homepage = 'https://github.com/levantAJ'
  s.source = {  :git => 'https://github.com/levantAJ/Utils.git', :tag => s.version }
  s.source_files = 'Utils/**/*.{swift}'
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
end
