configs = %w{
  classpath*:config/applicationContext.xml
  classpath*:WEB-INF/config/applicationContext.xml
}.to_java(:string)

SPRING_CONTEXT = org.springframework.context.support.GenericXmlApplicationContext.new
SPRING_CONTEXT.class_loader = JRuby.runtime.jruby_class_loader
SPRING_CONTEXT.load configs
SPRING_CONTEXT.refresh