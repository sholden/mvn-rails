module Beans
  @mutex = Mutex.new

  def self.bean(name)
    if SPRING_CONTEXT.startup_date == 0
      @mutex.lock do
        SPRING_CONTEXT.refresh if SPRING_CONTEXT.startup_date == 0
      end
    end

    SPRING_CONTEXT.get_bean(name)
  end
end