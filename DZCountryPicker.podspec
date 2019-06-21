Pod::Spec.new do |s|
  s.name = 'DZCountryPicker'
  s.version = '1.0.1'
  s.license = 'MIT'
  s.summary = 'The most lightweight country picker for iOS out there.'
  s.homepage = 'https://github.com/danialzahid94/DZCountryPicker'
  s.author = { 'Danial Zahid' => 'danialzahid94@live.com' }
  s.source = { :git => 'https://github.com/danialzahid94/DZCountryPicker.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'DZCountryPicker/*.swift'
  s.swift_version = '5.0'
end
