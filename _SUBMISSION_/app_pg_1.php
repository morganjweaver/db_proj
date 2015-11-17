<?php
include "components/php/connection.php";
$page_title = "New Application";
$page_id = "new_app";
include "components/php/html_head_tags.php"; ?>

<body id="<?php echo $page_id; ?>">

<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<?php
require "components/php/logo_nav_bar.php";

$views['student_types'] = "SELECT * FROM ddview_student_types";
$views['colleges'] = "SELECT * FROM ddview_colleges";
$views['degree_types'] = "SELECT * FROM ddview_degree_types";
$views['major_types'] = "SELECT * FROM ddview_major_types";
$views['terms'] = "SELECT * FROM ddview_terms";

//prints the tags for the option groups
function echo_options($view_name)
{
    global $conn, $views;
    foreach (mysqli_query($conn, $views[$view_name]) as $row) {
        echo "<option value='" . $row['key'] . "'>" . $row['value'] . "</option>\n";
    }
}

?>

<section class="container">
    <div class="content row">
        <section class="app_nav col col-lg-3 col-md-3">
            <?php include "components/php/app_nav_box.php"; ?>
        </section>
        <!-- main-->

        <section class="main col col-lg-9 col-md-9">
            <h2>New Student Application</h2>

            <form action="app_pg_2.php" class="form-horizontal" method="post">

                <div class="form-group">
                    <label for="student_type">What type of student are you?</label>
                    <select class="form-control" name="student_type" id="student_type">
                        <option value="#">---Select---</option>
                        <?php echo_options('student_types'); ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="applying_college">Which College are you applying to?</label>
                    <select class="form-control" name="applying_college" id="applying_college">
                        <option value="#">---Select---</option>
                        <?php echo_options('colleges'); ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="degree_type">Please select the Degree you are applying to?</label>
                    <select class="form-control" name="degree_type" id="degree_type">
                        <option value="#">---Select---</option>
                        <?php echo_options('degree_types'); ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="major_type">Please select the Major you are applying to?</label>
                    <select class="form-control" name="major_type" id="major_type">
                        <option value="#">---Select---</option>
                        <?php echo_options('major_types'); ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="applying_term">Please select the Term you plan on starting?</label>
                    <select class="form-control" name="applying_term" id="applying_term">
                        <option value="#">---Select---</option>
                        <?php echo_options('terms'); ?>
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

<?php include "components/php/include_scripts.php" ?>

</body>
</html>
