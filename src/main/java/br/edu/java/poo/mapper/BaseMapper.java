package br.edu.java.poo.mapper;

public interface BaseMapper<I, O> {

    O doMap(I input);

}
