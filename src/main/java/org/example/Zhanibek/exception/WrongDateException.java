package org.example.Zhanibek.exception;

import java.time.DateTimeException;

public class WrongDateException extends DateTimeException {

    public WrongDateException(String message) {
        super(message);
    }

    public WrongDateException(String message, Throwable cause) {
        super(message, cause);
    }
}
