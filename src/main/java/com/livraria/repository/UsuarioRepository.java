/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.livraria.repository;

import com.livraria.model.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioRepository {
    
    private final EntityManagerFactory factory;
    private EntityManager manager;
    private EntityTransaction transaction;
    
    public UsuarioRepository()
    {
        factory = Persistence.createEntityManagerFactory("LivrariaPU");
    }
    
    public Usuario getByEmail(String email)
    {
        manager = factory.createEntityManager();
        transaction = manager.getTransaction();
        
        try
        {
            transaction.begin();
            
            CriteriaBuilder builder = manager.getCriteriaBuilder();
            CriteriaQuery<Usuario> query = builder.createQuery(Usuario.class);
            
            Root<Usuario> usuario = query.from(Usuario.class);
            
            Usuario usuarioEncontrado = manager.createQuery(query.select(usuario).where(builder.equal(usuario.get("email"), email))).getSingleResult();
            
            return usuarioEncontrado;
            
        }
        catch(Exception ex)
        {
            if (transaction != null && transaction.isActive())
            {
                transaction.rollback();
            }
            
            return null;
        }
        finally
        {
            if (manager != null && manager.isOpen())
            {
                manager.close();
            }
        }
    }
    
}
