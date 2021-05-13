package org.example.Zhanibek.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;

@ControllerAdvice
@Component

public class ExceptionHandler {


    @org.springframework.web.bind.annotation.ExceptionHandler(value = WrongDateException.class)
    public ResponseEntity<ErrorResponse> handleDivideByZeroException(WrongDateException e) {

        ErrorResponse errorResponse = new ErrorResponse("WRONG_CHOSEN_DATE_ERROR", e.getMessage());

        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }
}
