package com.akdital.exception;

public class NoRecordsFound extends RuntimeException {
    public NoRecordsFound(String message) {
        super(message);
    }

    public NoRecordsFound(String message, Throwable cause) {
        super(message, cause);
    }
}
