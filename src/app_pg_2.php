<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>
        Personal Information
    </title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body id="pers_info">
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<?php include "components/php/header.php"; ?>

<section class="container">
    <div class="content row">
        <section class="app_nav col col-lg-2">
            <?php include "components/php/app_nav_box.php"; ?>
        </section>
        <!-- main-->

        <section class="main col col-lg-10">
            <h2>Personal Information</h2>

            <form action="#" class="form-horizontal">

                <div class="form-group">
                    <label>Your Name:</label>

                    <div class="row">
                        <div class="col-sm-4">
                            <input type="text" class="form-control col-sm-4 sr-only"
                                   placeholder="First" name="name_first" id="name_first">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control col-sm-4 sr-only"
                                   placeholder="Last" name="name_last"
                                   id="name_last">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control col-sm-4 sr-only"
                                   placeholder="Preffered Name" name="name_preferred"
                                   id="name_preferred">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="applying_college">Which College are you applying to?</label>
                    <select class="form-control" name="applying_college" id="applying_college">
                        <option value="#">---Select---</option>
                        <option value="#">1</option>
                        <option value="#">2</option>
                        <option value="#">3</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="degree_type">Please select the Degree you are applying to?</label>
                    <select class="form-control" name="degree_type" id="degree_type">
                        <option value="#">---Select---</option>
                        <option value="#">1</option>
                        <option value="#">2</option>
                        <option value="#">3</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="major_type">Please select the Major you are applying to?</label>
                    <select class="form-control" name="major_type" id="major_type">
                        <option value="#">---Select---</option>
                        <option value="#">1</option>
                        <option value="#">2</option>
                        <option value="#">3</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="applying_term">Please select the Term you plan on starting?</label>
                    <select class="form-control" name="applying_term" id="applying_term">
                        <option value="#">---Select---</option>
                        <option value="#">1</option>
                        <option value="#">2</option>
                        <option value="#">3</option>
                    </select>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Continue</button>
                </div>

            </form>


        </section>
        <!-- sidebar-->
    </div>
    <!--content-->
</section>
<!--container-->
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/{{JQUERY_VERSION}}/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-{{JQUERY_VERSION}}.min.js"><\/script>')</script>
-->
<script src="js/jquery-1.11.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/main.js"></script>

</body>
</html>
