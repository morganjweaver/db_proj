<?php
include "components/php/connection.php";
$page_title = "Application Information";
$page_id = "app_info";
include "components/php/html_head_tags.php"; ?>


<body id="<?php echo $page_id; ?>">

<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<?php include "components/php/logo_nav_bar.php"; ?>

<section class="container">
    <div class="content row">
        <section class="app_nav col col-lg-3 col-md-3">
            <?php include "components/php/app_nav_box.php"; ?>
        </section><!-- main-->

        <section class="main col col-lg-9 col-md-9">
            <h2>Application Information</h2>

			<form action="#" class="form-horizontal">

                <div class="form-group">
                    <label>Will you be applying for financial aid?</label>
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
                    <label>Do you have employer tuition assistance?</label>
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
                    <label>Are you also applying to other programs?</label>
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
                    <label>Have you ever been convicted of a felony or a gross misdemeanor?</label>
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
				
				<div class="well well-sm">A conviction will not necessarily bar admission but will require additional documentation prior
					to a decision. You will be contacted shortly via email with instructions on reporting the nature 
					of your conviction.</div>
					
                <div class="form-group">
                    <label>Have you ever been placed on probation, suspended from, dismissed from or
					otherwise sanctioned by (for any period of time) any higher education institution?</label>
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
					<button type="submit" class="btn btn-primary">Continue</button>
				</div>

            </form>


        </section><!-- sidebar-->
    </div><!--content-->
</section> <!--container-->
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/{{JQUERY_VERSION}}/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-{{JQUERY_VERSION}}.min.js"><\/script>')</script>
-->
<script src="js/jquery-1.11.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/main.js"></script>

</body>
</html>
