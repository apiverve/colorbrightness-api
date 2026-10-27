Pod::Spec.new do |s|
  s.name             = 'APIVerveColorBrightnessCalculator'
  s.version          = '1.2.3'
  s.summary          = 'Color Brightness Calculator checks hex color brightness to classify values as light, dark, or medium, returning RGB components.'
  s.description      = <<-'DESC'
Color Brightness Calculator checks hex color brightness to classify values as light, dark, or medium, returning RGB components. Paid plans add WCAG contrast ratios, luminance scores, and recommended text colors.

This iOS/macOS SDK provides a convenient way to access the Color Brightness Calculator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/colorbrightness?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/colorbrightness-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveColorBrightnessCalculator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
