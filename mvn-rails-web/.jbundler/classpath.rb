require 'jar_dependencies'
JBUNDLER_LOCAL_REPO = Jars.home
JBUNDLER_JRUBY_CLASSPATH = []
JBUNDLER_JRUBY_CLASSPATH.freeze
JBUNDLER_TEST_CLASSPATH = []
JBUNDLER_TEST_CLASSPATH.freeze
JBUNDLER_CLASSPATH = []
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/commons-logging/commons-logging/1.2/commons-logging-1.2.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/springframework/spring-beans/4.1.6.RELEASE/spring-beans-4.1.6.RELEASE.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/springframework/spring-context/4.1.6.RELEASE/spring-context-4.1.6.RELEASE.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/springframework/spring-core/4.1.6.RELEASE/spring-core-4.1.6.RELEASE.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/aopalliance/aopalliance/1.0/aopalliance-1.0.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/springframework/spring-expression/4.1.6.RELEASE/spring-expression-4.1.6.RELEASE.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/com/mvnrails/mvn-rails-java/1.0-SNAPSHOT/mvn-rails-java-1.0-SNAPSHOT.jar')
JBUNDLER_CLASSPATH << (JBUNDLER_LOCAL_REPO + '/org/springframework/spring-aop/4.1.6.RELEASE/spring-aop-4.1.6.RELEASE.jar')
JBUNDLER_CLASSPATH.freeze
