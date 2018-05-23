<%-- 
    Document   : login
    Created on : 04/05/2018, 13:53:52
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<% 
    //logando direto
   String msg="";
    if(request.getMethod().equals("POST")){
        if(request.getParameter("txtLogin").equals("admin") && request.getParameter("txtSenha").equals("123")) {
        session.setAttribute("administrador", request.getParameter("txtLogin"));
    //    msg = "Login Realizado";
    // vai pra pagina home
        response.sendRedirect("home/");
        return;
        
        } 
        else {
            msg = "Deu ruim";
        }
        
    }
    
    out.print(session.getAttribute("administrador"));

%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%=msg%>
        <form action="#" method="post">
            <label> Login: </label>
            <input type="text" name="txtLogin"/>
            <br/>
            <label> Senha: </label>
            <input type="password" name="txtSenha"/>
            <br/>
            <button type="submit"> OK </button>
        </form>
            
        
    

