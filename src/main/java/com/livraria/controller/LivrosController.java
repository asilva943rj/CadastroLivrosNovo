/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.livraria.controller;

import com.livraria.model.Livro;
import com.livraria.repository.LivroRepositoryImpl;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Alexander.Silva
 */
@Controller
@RequestMapping("/livro")
public class LivrosController {

    
    @RequestMapping("/novo-livro")
    public String form() {
        return "livro/formulario";
    }

    @RequestMapping("/salvar-livro")
    public String salvar( Livro livro, BindingResult result) {
        if (result.hasFieldErrors()) {
            return "livro/formulario";
        }
        
        LivroRepositoryImpl repositoty = new LivroRepositoryImpl();

        try{
            repositoty.salvar(livro);
        } catch (Exception e){
            //Tratar
            //Registrar exceção
        }       
        return "forward:listar-livro";
    }
    
    // As duas formas são válidas: método retornando ModelAndView 
    // ou método recebendo Model como parâmetro e retornando String.
    @RequestMapping("/listar-livro")
    public ModelAndView listar() {
        
        LivroRepositoryImpl repositoty = new LivroRepositoryImpl();
        
        List<Livro> livros = repositoty.listar();

        ModelAndView mv = new ModelAndView("livro/lista");
        mv.addObject("livros", livros);
        return mv;
    }
    
    @RequestMapping("/editar-livro")
    public ModelAndView editar(long id) {
        
        LivroRepositoryImpl repositoty = new LivroRepositoryImpl();
       
        Livro livro = repositoty.detalhar(id);

        ModelAndView mv = new ModelAndView("livro/formulario");
        mv.addObject("livro", livro);
        return mv;
    }
    
    @RequestMapping("/excluir-livro")
    public String excluir(long id) {
        
        LivroRepositoryImpl repositoty = new LivroRepositoryImpl();
        
        repositoty.excluir(id);
        return "forward:listar-livro";
    }

}
