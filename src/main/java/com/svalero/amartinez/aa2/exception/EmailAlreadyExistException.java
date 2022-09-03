package com.svalero.amartinez.aa2.exception;

public class EmailAlreadyExistException extends Exception{
    public EmailAlreadyExistException(String message) {
        super(message);
    }

    public EmailAlreadyExistException() {
        super("El usuario ya existe");
    }
}
