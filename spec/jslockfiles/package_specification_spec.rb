require 'jslockfiles'

RSpec.describe JSLockfiles do
  describe '::PackageSpecfication' do
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
  end
end
