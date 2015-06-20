configs = %w{

  classpath:config/applicationContext.xml
}.to_java(:string)
'file:/config/applicationContext.xml'
SPRING_CONTEXT = org.springframework.context.support.ClassPathXmlApplicationContext.new(configs)