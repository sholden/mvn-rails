package com.mvnrails;

public class HelloImpl implements Hello {
    private final String name;

    public HelloImpl(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getGreeting() {
        return "Hello, " + name;
    }
}
