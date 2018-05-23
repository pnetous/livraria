 <%@page import="util.StormData"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    LivroDAO dao = new LivroDAO();
    Livro obj = new Livro();
    
    CategoriaDAO cdao = new CategoriaDAO();
     List<Categoria> clistar = cdao.listar();
     Categoria c = new Categoria();
     
     EditoraDAO edao = new EditoraDAO();
     List<Editora> elistar = edao.listar();
     Editora e = new Editora();
     
     AutorDAO adao = new AutorDAO();
     List<Autor> alistar = adao.listar();
     
     
     
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        obj.setId(Integer.parseInt(request.getParameter("id")));
        obj.setNome(request.getParameter("txtNome"));
            obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
            obj.setDatapublicacao(StormData.formata(request.getParameter("txtData")));
            obj.setSinopse(request.getParameter("txtSinopse"));
            c.setId(Integer.parseInt(request.getParameter("txtCategoria")));
            e.setCnpj(request.getParameter("txtEditora"));
            obj.setCategoria(c);
            obj.setEditora(e);
            obj.setFoto1(request.getParameter("txtFoto"));
            obj.setFoto2(request.getParameter("txtFoto2"));
            obj.setFoto3(request.getParameter("txtFoto3"));
            
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("id") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new LivroDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
        } 
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
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
            Livro
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="POST" enctype="multipart/form-data">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>ID</label>
                        <input class="form-control" type="text" name="id" readonly value="<%=obj.getId()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome() %>" />
                        
                  <div class="form-group">
                        <label>Preco: </label>
                        <input class="form-control" type="text"  name="txtPreco"  required value="<%=obj.getPreco()%>" />
                    </div>
                    <div class="form-group">
                        <label>Data de Publicação: </label>
                        <input class="form-control" type="text"  name="txtData"  required value="<%=StormData.formata(obj.getDatapublicacao())%>" />
                    </div>
                    <div class="form-group">
                        <label>Sinopse: </label>
                        <input class="form-control" type="text"  name="txtSinopse"  required value="<%=obj.getSinopse()%>" />
                    </div>
                    <div class="form-group">

                        <div class="form-group">
                        <label>Autores</label>
                     
                        <%for(Autor item: alistar){
                            String selecionado;
                            if (obj.getAutorList().contains(item)) {
                                selecionado = "checked";
                                
                            }
                            else {
                                selecionado = "";
                            }
                                
                            
                        %>
                        <input type="checkbox" name="autores" <%=selecionado%> value="<%=item.getId()%>"><%=item.getNome()%>                          
                            <%}%>
                     </div>
                        <label> Categoria: </label>
                        <select name="txtCategoria"  required />
                        <option> Selecione </option>
                        <%
                            String selecionado;
                           for (Categoria item : clistar) {
                               if (obj.getCategoria().getId() == item.getId()) {
                                   selecionado="selected";
                               }
                               else {
                                   selecionado="";
                               }
                               
                         %>
                         <option value = "<%=item.getId()%>" <%=selecionado%>>
                             <%=item.getNome()%>
                         </option>
                         <%
                             }
                         %>
                        </select>
                    </div>
                             <div class="form-group">
                        <label> Editora: </label>
                        <select name="txtEditora"  required />
                        <option> Selecione </option>
                        
                        <%
                            String selecionadoE;
                           for (Editora item : elistar) {
                               if (obj.getEditora().getCnpj() == item.getCnpj())
                               {
                                   selecionadoE = "selected";
                               }                         
                               else{
                                   selecionadoE ="";
                               }
                         %>
                         <option value = "<%=item.getCnpj()%>">
                             <%=item.getNome()%>
                         </option>
                         <%
                             }
                         %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Image1</label>
                        <input class="form-control" type="file" name="txtFoto" id="arquivo1"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getFoto1()%>" width="70" height="50" id="img1"/>
                    </div>

                    <label>Image2</label>
                        <input class="form-control" type="file" name="txtFoto2" id="arquivo2"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getFoto2()%>" width="70" height="50" id="img2"/>
                    </div>

                    <label>Image3</label>
                        <input class="form-control" type="file" name="txtFoto3" id="arquivo3"  accept="image/*"  />
                        <img src="../arquivos/<%=obj.getFoto3()%>" width="70" height="50" id="img3"/>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                    

                        
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>
<script>
    function readURL(input,destino) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#'+destino).attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#arquivo1").change(function(){
        readURL(this,"img1");
        
    $("#arquivo2").change(function(){
        readURL(this,"img2");
    $("#arquivo3").change(function(){
        readURL(this,"img3");
    });
</script>