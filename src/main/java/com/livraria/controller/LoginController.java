package com.livraria.controller;

import com.livraria.model.Usuario;
import com.livraria.repository.UsuarioRepository;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/auth")
public class LoginController 
{
    @Autowired
    private UsuarioRepository repository;
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(Usuario usuario, HttpSession session, Model model)
    {
        Usuario usuarioEncontrado = repository.getByEmail(usuario.getEmail());
        
        if(usuarioEncontrado != null && usuarioEncontrado.getSenha().equals(usuario.getSenha()))
        {
            session.removeAttribute("usuario");
            usuarioEncontrado.setAutenticado(true);
            session.setAttribute("usuario", usuarioEncontrado);
            
            return "redirect:/";
        }
        model.addAttribute("error", "Email ou senha inválidos.");
        return "loginform";
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String doLogout(HttpSession session)
    {
        session.removeAttribute("usuario");
        
        return "redirect:/";
    }
    
}
