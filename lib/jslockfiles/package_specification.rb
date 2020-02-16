require 'semantic'

module JSLockfiles
  class PackageSpecification
    attr_reader :lockfile_source, :name, :resolved, :integrity, \
      :version_ranges, :version_string, :version, :dev_only, \
      :bundled, :optional, :dependencies

    def initialize(package_hash)
      @lockfile_source = package_hash[:source]
      @name = package_hash[:name]
      @resolved = package_hash[:resolved]
      @integrity = package_hash[:integrity]
      @version_ranges = package_hash[:version_ranges]
      @version_string = package_hash[:version]
      @version = Semantic::Version.new @version_string
      @dependencies = package_hash[:dependencies].map { |d|
        [ d[:name], d[:version], d[:resolved] ]
      }
      @dev_only = package_hash[:dev_only]
      @bundled = package_hash[:bundled]
      @optional = package_hash[:optional]
    end
  end
end
