class Person < ActiveRecord::Base
  def greeting
    self.class.hello_factory.create_hello(name).greeting
  end

  private

  # @return [com.mvnrails.HelloFactory]
  def self.hello_factory
    @hello_factory ||= Beans.bean('helloFactory')
  end
end
