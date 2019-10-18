<!DOCTYPE html>
<html>
<head>
    <title>Admin Workshop SB Front</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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

            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                </tr>
                </thead>
                <tbody>
                <#if model?has_content>
                    <#list model.products as product>
                        <tr>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                        </tr>
                    </#list>
                </#if>
                </tbody>
            </table>
            <hr>

            <form class="form-inline" action="create" method="post">
                <div class="form-group mb-2">
                    <label for="name" class="sr-only">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="" placeholder="name">
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <label for="price" class="sr-only">Password</label>
                    <input type="text" class="form-control" id="price" name="price" placeholder="price">
                </div>
                <button type="submit" class="btn btn-primary mb-2">Create Product</button>
            </form>
        </div>
        </div> <!-- /container -->

</main>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>