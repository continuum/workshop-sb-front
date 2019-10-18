<!DOCTYPE html>
<html>
<head>
    <title>Workshop SB Front</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>
</head>
<body>

<main role="main">

    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="#">Workshop SB Front</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/index">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin">Admin</a>
                    </li>

                </ul>
                <form class="form-inline mt-2 mt-md-0" method="post" action="search">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" id="name" name="name">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </header>
    <br/><br/>
    <div class="container">
        <!-- Example row of columns -->
        <div class="row" style="margin-top: 30px;">
                <#if model?has_content>
                    <#list model.products as p>
                        <div class="card" style="width: 18rem; margin: 5px;">
                           <h5 class="card-header">${p.name}</h5>
                           <div class="card-body">
                               <p class="card-text">Price in our shop: <b>$${p.price}</b></p>
                               <hr>
                               <#list p.detail as d>
                                <p class="card-text">Referencia: <b>${d.ecommerce}</b></p>
                                 <p class="card-text">Comentarios: ${d.commentsCount}</p>
                                 <p class="card-text">Valoraciones:
                                     <#list 1..d.rating as x>
                                         <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                     </#list>
                                 </p>
                                 <p class="card-text">Price <b>$${d.price}</b> in <b>${d.ecommerce}</b></p>
                                 <hr>
                               </#list>
                           </div>
                       </div>
                    </#list>
                </#if>
        </div>

    </div> <!-- /container -->

</main>
</body>

<script>
    $("#input-1").rating();
</script>

</html>