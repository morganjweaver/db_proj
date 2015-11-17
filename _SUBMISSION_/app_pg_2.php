<?php
include "components/php/connection.php";
$page_title = "Personal Information";
$page_id = "pers_info";
include "components/php/html_head_tags.php"; ?>


<body id="<?php echo $page_id; ?>">

<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<?php
include "components/php/logo_nav_bar.php";

$views['states'] = "SELECT * FROM ddview_states";
$views['genders'] = "SELECT * FROM ddview_genders";
$views['veteran_statuses'] = "SELECT * FROM ddview_veteran_statuses";
$views['mil_branches'] = "SELECT * FROM ddview_mil_branches";
$views['ethnicities'] = "SELECT * FROM ddview_ethnicities";

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
            <h2><?php echo $page_title; ?></h2>

            <form action="app_pg_3.php" class="form-horizontal" method="post">

                <div class="form-group">
                    <label>Name:</label>

                    <div class="row">
                        <div class="col-md-4">
                            <input type="text" class="form-control" required
                                   placeholder="First" size=50 name="name_first" id="name_first">
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" required
                                   placeholder="Last" size=50 name="name_last"
                                   id="name_last">
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control"
                                   placeholder="Preffered Name" size=50 name="name_preferred"
                                   id="name_preferred">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="dob">Date of Birth:</label>

                    <div class="input-group date col-lg-4 col-sm-8 col-xs-12" data-provide="datepicker">
                        <input type="text" class="form-control" maxlength=10 required name="dob" id="dob"
                               placeholder="MM/DD/YYYY" data-date-format="mm/dd/yyyy">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone_num">What is your preferred phone number?</label>
                    <input type="text" class="form-control" placeholder="(###) ###-####" pattern="[\(\)\-\ 0-9]{8,20}"
                           required size=20 name="phone_num"
                           id="phone_num">
                </div>

                <div class="form-group">
                    <label>Are you a US Citizen?</label>

                    <div class="radio">
                        <label>
                            <input type="radio" name="us_citizen" value="true" required>
                            Yes
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="us_citizen" value="false" required>
                            No
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Mailing Address:</label>
                    <input type="text" class="form-control" placeholder="Line 1" maxlength=150 name="mail_line1"
                           id="mail_line1" required>
                    <input type="text" class="form-control" placeholder="Line 2" maxlength=150 name="mail_line2"
                           id="mail_line2">


                    <div class="row">
                        <div class="col-md-4">
                            <input type="text" class="form-control" placeholder="City"
                                   maxlength=20 name="mail_city" id="mail_city">
                        </div>

                        <div class="col-md-4">
                            <select class="form-control" name="mail_state" id="mail_state">
                                <option value="#">(Select State)</option>
                                <?php echo_options('states'); ?>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <input type="text" class="form-control" placeholder="Zip Code" pattern="[\-0-9]{10}"
                                   maxlength=9 name="mail_zip" id="mail_zip">
                        </div>
                    </div>

                </div>

                <div class="form-group">
                    <label>Is English your native language?</label>

                    <div class="radio">
                        <label>
                            <input type="radio" name="eng_nat_lang" value="true" required>
                            Yes
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="eng_nat_lang" value="false" required>
                            No
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select class="form-control" name="gender" id="gender">
                        <option value="#">---Select---</option>
                        <?php echo_options('genders'); ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="gender">Veteran Status:</label>
                    <select class="form-control" name="vet_status" id="vet_status">
                        <option value="#">---Select---</option>
                        <?php echo_options('veteran_statuses'); ?>
                    </select>
                </div>

                <div class="form-group" id="mil_branch_group">
                    <label for="gender">Military Branch:</label>
                    <select class="form-control" name="mil_branch" id="mil_branch">
                        <option value="#">---Select---</option>
                        <?php echo_options('mil_branches'); ?>
                    </select>
                </div>

                <div class="form-group">
                    <label>Are you Hispanic/Latino origin?</label>

                    <div class="radio">
                        <label>
                            <input type="radio" name="us_citizen" value="true">
                            Yes
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="us_citizen" value="false">
                            No
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Mark all that apply to you:</label>

                    <?php
                    $rows = mysqli_query($conn, $views['ethnicities']);
                    foreach ($rows as $row) {
                        echo "
                    <div class=\"checkbox\">
                        <label>
                            <input type=\"checkbox\" name=\"ethnicities[]\" value=\"" . $row['key'] . "\">
                                " . $row['value'] . "
                        </label>
                    </div>
                    ";
                    }
                    ?>
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

<script>
    //hide the military branch field if the veteran status is 0: never served
    $('#vet_status').change(function () {
        $('#mil_branch_group').toggle(this.value != 0);
    });
</script>


</body>
</html>
