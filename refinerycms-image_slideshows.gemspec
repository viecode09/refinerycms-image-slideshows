# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-image_slideshows'
  s.authors           = ['Jim Pruetting']
  s.email             = 'jim@roboticmethod.com'
  s.homepage          = 'http://refinerycms.com'
  s.version           = '3.0.0'
  s.description       = 'Ruby on Rails Image Slideshows extension for Refinery CMS'
  s.date              = '2012-12-12'
  s.summary           = 'Image Slideshows extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.0'
end
