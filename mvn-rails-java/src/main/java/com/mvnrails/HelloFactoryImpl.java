package com.mvnrails;

public class HelloFactoryImpl implements HelloFactory {
    public Hello createHello(String name) {
        return new HelloImpl(name);
    }
}
