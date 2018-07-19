<%@include file="cabecalho.jsp"%>

<%
LivroDAO dao = new LivroDAO();
List<Livro> listaLivro = dao.listar();


dao.fecharConexao();

%>



<body>
<!-- /NAVIGATION -->

<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">
<!-- shop -->
<div class="col-md-4 col-xs-6">
<div class="shop">
<div class="shop-img">
<img src="./img/shop01.png" alt="">
</div>
<div class="shop-body">
<h3>Lançamentos</h3>
<a href="#" class="cta-btn">Veja agora<i class="fa fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
<!-- /shop -->

<!-- shop -->
<div class="col-md-4 col-xs-6">
<div class="shop">
<div class="shop-img">
<img src="./img/shop03.png" alt="">
</div>
<div class="shop-body">
<h3>Promoçoes</h3>
<a href="#" class="cta-btn"> Veja agora <i class="fa fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
<!-- /shop -->

<!-- shop -->
<div class="col-md-4 col-xs-6">
<div class="shop">
<div class="shop-img">
<img src="./img/shop02.png" alt="">
</div>
<div class="shop-body">
<h3>Mais vendidos</h3>
<a href="#" class="cta-btn">Veja agora <i class="fa fa-arrow-circle-right"></i></a>
</div>
</div>
</div>
<!-- /shop -->
</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">

<!-- section title -->

<!-- /section title -->

<!-- Products tab & slick -->
<div class="col-md-12">
<div class="section-title">
<h3 class="title">Nossos Livros</h3>
<div class="section-nav">


</div>
</div>
<div class="row">

<div class="products-tabs">
<!-- tab -->
<div id="tab1" class="tab-pane active">

<div class="products-slick" data-nav="#slick-nav-1">
<!-- product -->

<% for (Livro livro : listaLivro) {
%>


<div class="product">

<div class="product-img">

<img src="./img/product01.png" alt="">
<div class="product-label">
<span class="sale">-30%</span>
<span class="new">NEW</span>
</div>
</div>
<div class="product-body">
<p class="product-category"><%=livro.getCategoria()%></p>
<a href="produto.jsp?id=<%=livro.getId()%>"> <h3 class="product-name"><%=livro.getNome()%> </h3> </a>

<h4 class="product-price"><%=livro.getPreco()%> </h4>
<div class="product-rating">
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
</div>
<div class="product-btns">
<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
</div>

</div>
<div class="add-to-cart">
<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
</div>

</div>
<% }%>
<!-- /product -->

<!-- product -->

</div>
<!-- /tab -->
</div>

</div>

</div>
<!-- Products tab & slick -->

</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->

<!-- /container -->
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
<!-- container -->
<div class="container">
<!-- row -->
<div class="row">

<!-- section title -->
<div class="col-md-12">
<div class="section-title">
<h3 class="title">Mais Vendidos</h3>
<div class="section-nav">

</div>
</div>
</div>
<!-- /section title -->

<!-- Products tab & slick -->
<div class="col-md-12">
<div class="row">
<div class="products-tabs">
<!-- tab -->
<div id="tab2" class="tab-pane fade in active">
<div class="products-slick" data-nav="#slick-nav-2">
<!-- product -->
<% for (Livro livro : listaLivro) {

%>
<div class="product">
<div class="product-img">
<img src="./img/product06.png" alt="">
<div class="product-label">
<span class="sale">-30%</span>
<span class="new">NEW</span>
</div>
</div>
<div class="product-body">
<p class="product-category"><%=livro.getCategoria()%></p>
<h3> <a href="product.jsp" class="product-name">  <%=livro.getNome()%> </a></h3>
<h4 class="product-price"><%=livro.getPreco()%> </h4>
<div class="product-rating">
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
<i class="fa fa-star"></i>
</div>
<div class="product-btns">
<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
</div>
</div>
<div class="add-to-cart">
<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
</div>

<%}%></div>
<!-- /product -->

<!-- product -->

<!-- /product -->

<!-- product -->

<!-- /product -->

<!-- product -->

<!-- /product -->

<!-- product -->

<!-- /product -->
</div>


</div>
<!-- /tab -->
</div>
</div>
</div>
<!-- /Products tab & slick -->
</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
</body>
<%@include file="rodape.jsp"%>

