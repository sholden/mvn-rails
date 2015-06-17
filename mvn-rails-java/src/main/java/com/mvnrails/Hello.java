package com.mvnrails;

public class Hello {
    private final String name;

    public Hello(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getGreeting() {
        return "Hello, " + name;
    }
}
