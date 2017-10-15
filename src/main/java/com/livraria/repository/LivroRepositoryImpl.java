/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.livraria.repository;

import com.livraria.model.Livro;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Alexander.Silva
 */
@Repository
public class LivroRepositoryImpl implements ILivroRepository {

    private EntityManager em;

    public EntityManager getEM() {
        EntityManagerFactory factory = Persistence.
                createEntityManagerFactory("LivrariaPU");
        return factory.createEntityManager();
    }

    public LivroRepositoryImpl() {
        EntityManager _em = getEM();
        this.em = _em;
    }

    /*
        Salvar - Inserir ou Atualizar - um livro
     */
    public Livro salvar(Livro livro) throws Exception {
        try {
            em.getTransaction().begin();
            if (livro.getId() == null) {

                //INSERT
                em.persist(livro);
            } else //UPDATE se o livro existe
            //pois pode ter sido excluído concorrentemente à nossa chamada
            if (!em.contains(livro)) {
                if (em.find(Livro.class, livro.getId()) == null) {
                    throw new Exception("Erro ao atualizar livro.");
                }
                livro = em.merge(livro);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
        return livro;
    }

    /*
        Excluir um Livro por seu ID
     */
    public void excluir(Long id) {
        Livro livro = em.find(Livro.class, id);
        try {
            em.getTransaction().begin();
            em.remove(livro);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    /*
        Buscar um Livro por seu ID
     */
    public Livro detalhar(Long id) {
        Livro livro = null;
        try {
            livro = em.find(Livro.class, id);
        } finally {
            em.close();
        }

        return livro;
    }

    /*
        Listar todos os Livros
     */
    @Override
    public List<Livro> listar() {

        List<Livro> livros = new ArrayList<>();
        //Note que escrevemos Livro e não livro: o JPA usa entidades, não tabelas.
        //Além disso, selecionamos "a" de "Livro a" e não "*" de "Livro".
        Query query = em.createQuery("SELECT a FROM Livro a");
        try {
            //Executamos a query, convertendo-a em uma lista de resultados no formato de lista de livros.
            livros = query.getResultList();
        } finally {
            em.close();
        }

        return livros;
    }
}
