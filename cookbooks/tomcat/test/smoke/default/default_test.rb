require 'serverspec'

describe 'tomcat::default' do
  describe command('curl http://localhost:8080') do
    its(:stdout) { should match /Tomcat/ }
  end
  describe package('java-1.7.0') do
    it { should be_installed }
  end
end
