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
                                   placeholder="First" size=50 name="name_first" id="name_first">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control col-sm-4 sr-only"
                                   placeholder="Last" size=50 name="name_last"
                                   id="name_last">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control col-sm-4 sr-only"
                                   placeholder="Preffered Name" size=50 name="name_preferred"
                                   id="name_preferred">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="dob">What is your date of birth? (mm-dd-yyy)</label>
					<input type="text" class="form-control" placeholder="MM-DD-YYYY" size=50 name="dob" id="dob">
				</div>
				
                <div class="form-group">
                    <label for="mailing_addr">What is your mailing address?</label>
					<input type="text" class="form-control" placeholder="Street ..." size=50 name="mailing_addr" id="mailing_addr">
				</div>

                <div class="form-group">
                    <label for="phone_num">What is your preferred phone number?</label>
					<input type="text" class="form-control" placeholder="(###) ###-####" size=20 name="phone_num" id="phone_num">
				</div>

                <div class="form-group">
                    <label>Are you a US Citizen?</label>
					<div class="radio">
						<label>
							<input type="radio" name="us_citizen" value="true">
							Yes
						</label>
					</div>					
					<div class="radio">
						<label>
							<input type="radio" name="us_citizen" value="true">
							No
						</label>
					</div>					
				</div>

                <div class="form-group">
                    <label for="dob">What is your date of birth? (mm-dd-yyy)</label>
					<input type="text" class="form-control" placeholder="MM-DD-YYYY" size=50 name="dob" id="dob">
				</div>
                <div class="form-group">
                    <label for="dob">What is your date of birth? (mm-dd-yyy)</label>
					<input type="text" class="form-control" placeholder="MM-DD-YYYY" size=50 name="dob" id="dob">
				</div>
                <div class="form-group">
                    <label for="dob">What is your date of birth? (mm-dd-yyy)</label>
					<input type="text" class="form-control" placeholder="MM-DD-YYYY" size=50 name="dob" id="dob">
				</div>

<!--  <br>
 <input type="radio" name="y" value="Yes">Yes<br>
 <input type="radio" name="n" value="No">No<br>
 <p>
 Is English your native language? <br>
 <input type="radio" name="y" value="Yes">Yes<br>
 <input type="radio" name="n" value="No">No<br>
 <p>
 What is your gender? <br>
 <input type="radio" name="m" value= "male">Male<br>
 <input type="radio" name="f" value="female">Female<br>
 <p>
 Please tell us your veteran status <br>
 <input type="radio" name="not a veteran" value="0">Not a veteran<br>
 <input type="radio" name="currently serving" value="1">Currently serving<br>
 <input type="radio" name="previously served" value="2">Previously served<br>
 <input type="radio" name="current dependent" value="3">Current dependent<br>
 <p>
 Military Branch? <br>
  <input type="radio" name="army" value= "0">Army<br>
 <input type="radio" name="marine corp" value="1">Marine Corp<br>
  <input type="radio" name="navy" value= "2">Navy<br>
 <input type="radio" name="air force" value="3">Air Force<br>
 <input type="radio" name="coast guard" value="4">Coast Guard<br>
 <p>
 Are you Hispanic/Latino origin? <br>
  <input type="radio" name="y" value="Yes">Yes<br>
 <input type="radio" name="n" value="No">No<br>
 <p>
 Please mark all that apply: <br>
 <input type="checkbox" name="asian" value="0">Asian<br>
 <input type="checkbox" name="black/african american" value="1">Black/African American<br>
 <input type="checkbox" name="native hawaiian/pacific islander" value="2">Native Hawaiian/Pacific Islander<br>
 <input type="checkbox" name="native american/native indian" value="3">Native American/Native Indian<br>
 <input type="checkbox" name="white/middle eastern" value="4">White/Middle Eastern<br>-->


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
