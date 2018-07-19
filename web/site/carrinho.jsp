<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Compralivro"%>
<%@page import="modelo.Compralivro"%>
<%@include file="cabecalho.jsp"%>
<%
    
    
    if(request.getParameter("id")==null){
        response.sendRedirect("index.jsp");
        return;
    }
    
    Integer id = Integer.parseInt(request.getParameter("id"));
    LivroDAO dao = new LivroDAO();
    Livro l = dao.buscarPorChavePrimaria(id);
    List<Compralivro> carrinho;
    Compralivro cl = new Compralivro ();
    cl.setLivro(l);
    cl.setValorunit(l.getPreco());
    if(session.getAttribute("carrinho")!=null)
            {
                carrinho = (List<Compralivro>)session.getAttribute("carrinho");
                carrinho.add(cl); }
                
    else
    {
        carrinho = new ArrayList<Compralivro>();
            carrinho.add(cl);
            }
    session.setAttribute("carrinho", carrinho);
         %> 
<body>
    <!-- Order Details -->
    <div class="col-md-5 order-details">
        <div class="section-title text-center">
            <h3 class="title">Your Order</h3>
        </div>
        <%for (Compralivro compra : carrinho) {
            
        
        %>
        <div class="order-summary">
            <div class="order-col">
                <div><strong>PRODUCT</strong></div>
                <div><strong>TOTAL</strong></div>
            </div>
            <div class="order-products">
                <div class="order-col">
                    <div><%=compra.getLivro().getNome()%></div>
                    <div> R$ <%=compra.getLivro().getPreco()%></div>
                </div>
                  
                <div class="order-col">

                    </br> <div><strong>TOTAL  </strong></div> 
                    <div><strong class="order-total">$ <%=compra.getLivro().getPreco()%></strong></div>
                 
                    <div class="input-checkbox">
                        <input type="checkbox" id="terms">
                       
                        <label for="terms">

                        </label>
                                       <a href="checkout.jsp" class="primary-btn order-submit">Fazer Pedido</a>

                    </div>
                      
                    
                </div>
            </div>
                    
                <%}%> 
        </div>
    </div>



</body>


<%@include file="rodape.jsp"%>
