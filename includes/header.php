<?php
include 'db.php';
?>

<div id="right-panel" class="right-panel">
<header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="dashboard.php"><img src="images/logo123.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <!-- <div class="header-left">
                        <div class="form-inline">
                            
                        </div>
                    </div> -->
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?php
                                $idLogin = $_SESSION['jastip'];
                                $admin = mysqli_query($con, "SELECT * from tbladmin where IDadmin ='$idLogin'");
                                $get = mysqli_fetch_assoc($admin); ?>
                            <?php    echo $get['NamaAdmin']; ?> &nbsp;&nbsp;
                        <img class="user-avatar rounded-circle" src="images/abc.jpg" alt="User Avatar" width="50px;" height="50px;">
                        </a>
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="admin-profile.php"><i class="fa fa- user"></i>Profile</a>

                            <a class="nav-link" href="ubah-password-admin.php"><i class="fa fa -cog"></i>Ganti Password</a>

                            <a class="nav-link" href="index.php"><i class="fa fa-power -off"></i>Logout</a>
                        </div> 
                    </div>
                </div>
            </div>
</header> 