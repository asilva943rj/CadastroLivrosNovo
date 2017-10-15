/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.livraria.repository;

import com.livraria.model.Livro;
import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Alexander.Silva
 */

public interface ILivroRepository extends Serializable{

       
    public Livro salvar(Livro livro) throws Exception;
    
    public void excluir(Long id);
    
    public Livro detalhar(Long id);
    
    public List<Livro> listar();

}
