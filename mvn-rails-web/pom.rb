project 'mvn-rails-web' do


  id 'com.mvnrails:mvn-rails-web', '1.0-SNAPSHOT'
  packaging 'war'

  inherit 'com.mvnrails:mvn-rails', '1.0-SNAPSHOT'

  description 'A demo rails app using maven dependencies'

  properties( 'polyglot.dump.pom' => 'pom.xml',
              'polyglot.dump.readonly' => true)

  gem 'bundler', '1.10.4'
  gem 'warbler', '1.4.8'
  jarfile File.join(basedir, 'Jarfile')
  gemfile File.join(basedir, 'Gemfile')

  phase :initialize do
    plugin 'de.saumya.mojo:jruby-maven-plugin:${jruby.plugins.version}' do
      configuration(
          'gemHome' =>  '${gem.home}',
          'jrubySwitches' =>  '--2.0',
          'jrubyVersion' =>  '${jruby.version}' )

      execute_goals(:jruby, :id => 'bundle-install')
    end
  end

  phase :package do
    plugin 'de.saumya.mojo:jruby-maven-plugin:${jruby.plugins.version}' do
      configuration(
          'gemHome' =>  '${gem.home}',
          'jrubySwitches' =>  '--2.0',
          'jrubyVersion' =>  '${jruby.version}' )

      execute_goals( 'jruby',
                     :id => 'create-war',
                     'args' =>  '-C ${basedir} -S bundle exec rake war' )
      execute_goal( :jruby,
                    :id => 'move war to maven build dir',
                    :script => <<RUBY
require 'fileutils'
FileUtils.mv '${project.artifactId}.war', '${project.build.directory}/${project.build.finalName}.war'
RUBY
      )
    end
  end

  plugin 'de.saumya.mojo:gem-maven-plugin:${jruby.plugins.version}' do
    execute_goals 'initialize'
  end

  plugin :war, :failOnMissingWebXml => false

  # <dependencies>
  # <dependency>
  # <groupId>com.company</groupId>
  #             <artifactId>java-legacy-app</artifactId>
  # <version>1.0-SNAPSHOT</version>
  #             <scope>compile</scope>
  # </dependency>
  #     </dependencies>
  # phase :package do
  #   plugin 'de.saumya.mojo:gem-maven-plugin' do
  #     execute_goal( :exec,
  #                   :id => 'pack-war with warbler',
  #                   :filename => 'warble' )
  #   end
  # end
end