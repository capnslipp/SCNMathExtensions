Pod::Spec.new do |s|
  s.name = 'SCNMathExtensions'
  s.version = ->{
    Dir.chdir(__dir__) do
      semver_regex = /\d+\.\d+\.\d+(?:-[\w\.]+)?(?:\+[\w\.]+)?/
      return `xcodebuild -showBuildSettings 2>/dev/null`.match(/CURRENT_PROJECT_VERSION = (#{semver_regex})/)[1]
    end
  }.call
  s.summary = 'A Swift µ-Library of Math Extensions for SCNVector3, SCNQuaternion, SCNMatrix4'
  s.description = "A Swift micro-library that provides commonplace math extensions for SceneKit's SCNVector3, SCNQuaternion, & SCNMatrix4 types, and bridging to/from GLKVector3, simd.float3, GLKQuaternion, GLKMatrix4, & simd.float4x4."
  s.homepage = 'https://github.com/capnslipp/SCNMathExtensions'
  s.license = { :type => 'Public Domain', :file => 'LICENSE' }
  s.author = { 'capnslipp' => 'SCNMathExtensions@capnslipp.com' }
  s.source = { :git => 'https://github.com/capnslipp/SCNMathExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/capnslipp'
  s.swift_versions = ['3.0', '4.0', '4.2', '5.0']
  s.ios.deployment_target = '8.0'
  s.source_files = 'Sources/**/*'
  s.frameworks = 'SceneKit'
end
