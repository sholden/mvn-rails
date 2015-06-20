jruby_version = `jruby --version`[/[\d\.]+/]

project 'mvn-rails', 'https://github.com/sholden/mvn-rails' do
  model_version '4.0.0'
  id 'com.mvnrails:mvn-rails', '1.0-SNAPSHOT'
  packaging 'pom'

  description 'A test project with maven and rails.'

  issue_management 'https://github.com/sholden/mvn-rails/issues', 'GitHub'

  repository( :id => 'rubygems-releases',
              :url => 'http://rubygems-proxy.torquebox.org/releases' )

  properties('jruby.plugins.version' => '1.0.9',
             'jruby.version' => '1.7.20',
             'gem.home' => '${session.executionRootDirectory}/target/rubygems',
             'gem.path' => '${session.executionRootDirectory}/target/rubygems')

  modules [ 'mvn-rails-java', 'mvn-rails-web' ]

  overrides do
    plugin( :compiler,
            'source' =>  '1.8',
            'target' =>  '1.8' )
    #
    # plugin( 'org.mortbay.jetty:maven-jetty-plugin:6.1.26',
    #         'webApp' =>  'target/test.war',
    #         'stopPort' =>  '9966',
    #         'stopKey' =>  'warbler_stop' ) do
    #   execute_goals( 'run-war',
    #                  :id => 'start-jetty',
    #                  :phase => 'pre-integration-test',
    #                  'scanIntervalSeconds' =>  '0',
    #                  'daemon' =>  'true' )
    #   execute_goals( 'stop',
    #                  :id => 'stop-jetty',
    #                  :phase => 'post-integration-test' )
    # end

    plugin 'org.codehaus.mojo:exec-maven-plugin:1.2.1'

    plugin( 'de.saumya.mojo:jruby-maven-plugin:${jruby.plugins.version}') do
      configuration(
              'gemHome' =>  '${gem.home}',
              'jrubySwitches' =>  '--2.0',
              'jrubyVersion' =>  '${jruby.version}' )
      execute_goals( 'jruby',
                     :id => 'bundle-install',
                     'args' =>  '-C ${basedir}/src/main/ruby -S ${gem.home}/bin/bundle install' )

    end
  end

  build do
    default_goal 'package'
  end

end