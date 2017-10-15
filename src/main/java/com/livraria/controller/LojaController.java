package com.livraria.controller;

import com.livraria.model.Usuario;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {""})
public class LojaController {
    
    //@Autowired
    //private UsuarioDAOImpl usuarios;

    @RequestMapping(method = RequestMethod.GET)
    public String welcome(HttpSession session) 
    {
       Usuario usuario = (Usuario)session.getAttribute("usuario");
       
       if (usuario == null)
       {
           usuario = new Usuario();
           session.setAttribute("usuario", usuario);
       }
       
       if (usuario.isAutenticado())
       {
           return "menu";
       }
        
        return "loginform";
    }
}
