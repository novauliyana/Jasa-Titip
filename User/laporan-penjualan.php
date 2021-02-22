<?php
session_start();
error_reporting(0);
include 'includes/dbconnection.php';
if (strlen($_SESSION['jastip'] == 0)) {
    header('location:logout.php');
} else {

    ?>
<!doctype html>

<html class="no-js" lang="">
<head>

    <title>HelloWorld - Laporan</title>


    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>
<body>
    <!-- Left Panel -->

  <?php include_once 'includes/sidebar.php';?>

    <!-- Left Panel -->

    <!-- Right Panel -->

     <?php include_once 'includes/header.php';?>

        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="dashboard.php">Dashboard</a></li>
                                    <li class="active">Riwayat Jasa Titip</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Jasa Titip</strong>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <tr>
                                            <th>NO</th>
                                            <th>Nama Pembeli</th>
                                            <th>Nama Barang</th>
                                            <th>Status Transaksi</th>
                                            <th>Tanggal Beli</th>
                                            <th colspan="2"><center>Opsi</center></th>
                                        </tr>
                                    </tr>
                                </thead>
                                <?php
$idlog = $_SESSION['jastip'];
    $ret = mysqli_query($con, "select * from tbltransaksi tt join tbluser tu on tt.fk_idpembeli=tu.IDuser where fk_idpenjasa='$idlog' and status='in process'");
    $cnt = 1;
    while ($row = mysqli_fetch_array($ret)) {
        ?>
                                <tr>
                                    <td><?php echo $cnt; ?></td>
                                    <td><?php echo $row['nama']; ?></td>
                                    <td><?php echo $row['barang']; ?></td>
                                    <td><?php echo $row['status']; ?></td>
                                    <td><?php echo $row['tanggal_beli']; ?></td>
                                    <td>
                                        <a href="view-laporan-penjualan.php?viewid=<?php echo $row['IDtransaksi']; ?>">Rincian</a>
                                    </td>
                                    <td>
                                        <a href="view-laporan-penjualan.php?viewid=<?php echo $row['IDtransaksi']; ?>">Update</a>
                                    </td>
                                </tr>
    <?php $cnt++; } ?>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

<?php include_once 'includes/footer.php';?>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="assets/js/main.js"></script>


</body>
</html>
<?php }?>