project 'mvn-rails-web' do


  id 'com.mvnrails:mvn-rails-web', '1.0-SNAPSHOT'
  packaging 'jar'

  inherit 'com.mvnrails:mvn-rails', '1.0-SNAPSHOT'

  description 'A demo rails app using maven dependencies'

  # gemfile
  #
  # jarfile


  properties( 'polyglot.dump.pom' => 'pom.xml',
              'polyglot.dump.readonly' => true,
              'jruby.plugins.version' => '1.0.9',
              'jruby.version' => '1.7.20',
              'gem.home' => '${session.executionRootDirectory}/target/rubygems',
              'gem.path' => '${session.executionRootDirectory}/target/rubygems')

  jarfile File.join(basedir, 'Jarfile')
  gemfile File.join(basedir, 'Gemfile')

  build do
    plugins do
      plugin 'de.saumya.mojo:gem-maven-plugin:${jruby.plugins.version}' do
        execute_goal 'initialize'
      end

      # plugin 'de.saumya.mojo:jruby-maven-plugin' do
      #   executions do
      #     execution id: 'bundle-install', phase: 'initialize'
      #     execution id: 'create-war', phase: 'compile'
      #   end
      # end

      plugin 'de.saumya.mojo:jruby-maven-plugin:${jruby.plugins.version}' do
        configuration(:jrubySwitches => '--2.0', jrubyVersion: '${jruby.version}')

        execute_goal 'jruby' do
          id 'bundle-install'
          phase 'initialize'
          configuration('args' => '-C ${basedir} -S ${gem.home}/bin/bundle install')
        end

        execute_goal 'jruby' do
          id 'create-war'
          phase 'package'
          configuration('args' => '-C ${basedir}/src/main/ruby -S ${gem.home}/bin/warble')
        end
      end
    end


  end

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