require 'jslockfiles'

RSpec.describe JSLockfiles do
  describe '::PackageSpecification' do
    subject(:package_hash) do
      {
        source: 'yarn.lock',
        name: '@babel/highlight',
        resolved: 'https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.0.0-beta.55.tgz#988653647d629c261dae156e74d5f0252ba520c0',
        integrity: 'sha1-mIZTZH1inCYdrhVudNXwJSulIMA=',
        version_ranges: [
          '^7.0.0-beta.35'
        ],
        version: '7.0.0-beta.55',
        dependencies: [
          {
            name: 'chalk',
            version: '^2.0.0',
            resolved: nil
          },
          {
            name: 'esutils',
            version: '^2.0.2',
            resolved: nil
          },
          {
            name: 'js-tokens',
            version: '^3.0.0',
            resolved: nil
          }
        ],
        dev_only: false,
        bundled: false,
        optional: false
      }
    end

    it 'should be a PackageSpecification' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to be_instance_of JSLockfiles::PackageSpecification
    end
    it 'should provide its lockfile source' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :lockfile_source
      expect(pkg_spec.lockfile_source).to eq('yarn.lock')
    end
    it 'should provide its package name' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :name
      expect(pkg_spec.name).to eq('@babel/highlight')
    end
    it 'should provide its resolved url' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :resolved
      expect(pkg_spec.resolved).to eq('https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.0.0-beta.55.tgz#988653647d629c261dae156e74d5f0252ba520c0')
    end
    it 'should provide its integrity hash' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :integrity
      expect(pkg_spec.integrity).to eq('sha1-mIZTZH1inCYdrhVudNXwJSulIMA=')
    end
    it 'should provide its resolved version as a string' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :version_string
      expect(pkg_spec.version_string).to eq('7.0.0-beta.55')
    end
    it 'should provide its resolved version as a Semantic::Version object' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :version
      expect(pkg_spec.version).to eq(Semantic::Version.new '7.0.0-beta.55')
    end
    it 'should provide an array of version ranges from the package spec' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :version_ranges
      expect(pkg_spec.version_ranges).to eq([ '^7.0.0-beta.35' ])
    end
    it 'should identify if it is a dev-only dependency' do
      package_hash[:dev_only] = true
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :dev_only
      expect(pkg_spec.dev_only).to be true
    end
    it 'should default to dev-only dependency of false' do
      package_hash[:dev_only] = nil
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :dev_only
      expect(pkg_spec.dev_only).to be false
    end
    it 'should identify if it is a bundled dependency' do
      package_hash[:bundled] = true
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :bundled
      expect(pkg_spec.bundled).to be true
    end
    it 'should default to bundled dependency of false' do
      package_hash[:bundled] = nil
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :bundled
      expect(pkg_spec.bundled).to be false
    end
    it 'should identify if it is an optional dependency' do
      package_hash[:optional] = true
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :optional
      expect(pkg_spec.optional).to be true
    end
    it 'should default to optional dependency of false' do
      package_hash[:optional] = nil
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :optional
      expect(pkg_spec.optional).to be false
    end
    it 'should provide an Array of its dependencies' do
      pkg_spec = JSLockfiles::PackageSpecification.new(package_hash)
      expect(pkg_spec).to respond_to :dependencies
      expect(pkg_spec.dependencies).to be_instance_of Array
      pkg_spec.dependencies.each_with_index do |dep, idx|
        dep_from_hash = package_hash[:dependencies][idx]
        expect(dep).to eql([
          dep_from_hash[:name],
          dep_from_hash[:version],
          dep_from_hash[:resolved]
        ])
      end
    end
  end
end
