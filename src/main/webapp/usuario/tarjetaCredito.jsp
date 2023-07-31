
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Ja-Vagos</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="icon" href="pestania.png">

    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container d-flex align-items-center justify-content-center vh-100">
    <!-- CREDIT CARD FORM STARTS HERE -->
    <div class="panel panel-default credit-card-box customwidth center-block">
        <div class="panel-heading display-table" >
            <div class="row display-tr" >
                <h3 class="panel-title display-td" >Payment Hola</h3>
                <div class="display-td" id="cardLogoTop">
                    <img class="img-responsive pull-right" src="https://i.imgur.com/gIMFDbp.png">
                    <!-- <img class="img-responsive pull-right" src="https://i.imgur.com/WluzPvZ.png">
                    <img class="img-responsive pull-right" src="https://i.imgur.com/H5lJRwk.png">
                    <img class="img-responsive pull-right" src="https://i.imgur.com/1U8OBnM.png">
                    <img class="img-responsive pull-right" src="https://i.imgur.com/iqIDYfz.png">
                    -->
                </div>
            </div>
        </div>
        <div class="panel-body">
            <form role="form" id="payment-form" method="post" action="" onSubmit="return false;">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="cardNumber">CARD NUMBER</label>
                            <div class="input-group">
                                <input
                                        type="tel"
                                        class="form-control"
                                        name="cardNumber"
                                        id="cardNumber"
                                        placeholder="XXXX-XXXX-XXXX-XXXX"
                                        autocomplete="cc-number"
                                        pattern="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$"
                                        required autofocus
                                        onchange="validar(this.value)"
                                        onblur="
                                          // save input string and strip out non-numbers
                                          cc_number_saved = this.value;
                                          this.value = this.value.replace(/[^\d]/g, '');
                                          if(!validar(this.value)) {
                                            alert('Disculpe, este número de atrjeta no es válido');
                                            this.value = '';
                                          }
                                        " onfocus="
                                          // restore saved string
                                          if(this.value != cc_number_saved) this.value = cc_number_saved;
                                        "
                                />
                                <span class="input-group-addon"><i class="fa fa-credit-card" id="cardlogo" style="color:purple;font-size:2rem;"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-7 col-md-7">
                        <div class="form-group">
                            <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                            <input
                                    type="tel"
                                    class="form-control"
                                    name="cardExpiry"
                                    placeholder="MM / YY"
                                    autocomplete="cc-exp"
                                    required
                            />
                        </div>
                    </div>
                    <div class="col-xs-5 col-md-5 pull-right">
                        <div class="form-group">
                            <label for="cardCVC">CV CODE</label>
                            <input
                                    type="tel"
                                    class="form-control"
                                    name="cardCVC"
                                    placeholder="CVC"
                                    autocomplete="cc-csc"
                                    required
                                    pattern="^[0-9]{4}"
                                    title="Debe escribir un código válido"
                            />
                        </div>
                    </div>
                </div>
                <!--<div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="couponCode">COUPON CODE</label>
                            <input type="text" class="form-control" name="couponCode" />
                        </div>
                    </div>
                </div>-->
                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn btn-success btn-lg btn-block" type="submit">Start Subscription</button>
                    </div>
                </div>
                <div class="row" style="display:none;">
                    <div class="col-xs-12">
                        <p class="payment-errors"></p>
                    </div>
                </div>
            </form>

            <a class="btn btn-success btn-lg btn-block" href="<%=request.getContextPath()%>/UsuariosJuegosServlet">Cancelar compra</a>

        </div>
    </div>
    <!-- CREDIT CARD FORM ENDS HERE -->
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
