package com.neu.exception;

public class FoodException extends Exception {
    public FoodException(String message) {
        super(message);
    }

    public FoodException(String message, Throwable cause) {
        super(message, cause);
    }
}
