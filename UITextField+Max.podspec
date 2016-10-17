Pod::Spec.new do |s|
  s.name         = "UITextField+Max"
  s.version      = "1.0.2"
  s.summary      = "Set the MAX/LIMIT LENGTH to your text field."
  s.homepage     = "https://github.com/KimDarren/UITextField-Max"
  s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
  s.author       = { "KimDarren" => "korean.darren@gmail.com" }
  s.source       = { :git => "https://github.com/KimDarren/UITextField-Max.git",
                     :tag => "#{s.version}" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
