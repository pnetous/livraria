<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="util.StormData"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    
    Livro obj = new Livro();
    LivroDAO dao = new LivroDAO();
    
    
    
    CategoriaDAO cdao = new CategoriaDAO();
    Categoria clista = new Categoria();
    Categoria c = new Categoria();
    
    EditoraDAO edao = new EditoraDAO();
    Editora elista = new Editora();
    Editora e = new Editora();
    e.setCnpj("txtCnpj");
    

    
    
    if (request.getParameter("txtNome") != null) {
        obj.setNome(request.getParameter("txtNome"));
        obj.setPreco (Float.parseFloat(request.getParameter("txtPreco")));
        obj.setDatapublicacao (StormData.formata(request.getParameter("data")));
        obj.setFoto1(request.getParameter("foto1"));
        obj.setFoto2(request.getParameter("foto2"));
        obj.setFoto3(request.getParameter("foto3"));
        obj.setSinopse(request.getParameter("txtSinopse"));
        c.setId (Integer.parseInt(request.getParameter("id")));

       AutorDAO adao = new AutorDAO();
        if(request.getMethod().equals("POST")){
           String[] autoresid = request.getParameterValues("autores");
            
        List<Autor> listaautores = new ArrayList<>();
        for (String id : autoresid) {
            Integer idinteger = Integer.parseInt(id);
            listaautores.add(adao.buscarPorChavePrimaria(idinteger));
        }
        
        obj.setAutorList(listaautores);
        
        dao.incluir(obj);
        
     
     
        
     
      
        Boolean resultado = dao.incluir(obj);
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
    } 
    

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação 
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Livros
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="POST" enctype="multipart/form-data">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                        <label> Preço </label>>
                        <input class="form-control" type="text"  name="txtPreco"  required />
                        <label> Data </label>>
                        <input class="form-control" type="text"  name="data"  required />
                        <label> Foto </label>>
                        <input type="File" name="foto1"/> 
                        <label> Foto </label>>
                        <input type="File" name="foto2"/>
                        <label> Foto </label>>
                        <input type="File" name="foto3"/> 
                        <label> Sinopse </label>>
                        <input class="form-control" type="text"  name="txtSinopse"  required />
                        <label> Categoria </label>
                        <select name="txtCategoria" required />
                        <%
                            for (Categoria item : clista) {
                        %> }
                                <option value="<%=item.getId()%>">
                                    <%=item.getNome()%>">
                                    
                            }
                            }

                        <input class="form-control" type="text"  name="txtSinopse"  required />    
                                
                    </div>
                    <div class="form-group">
                        

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>