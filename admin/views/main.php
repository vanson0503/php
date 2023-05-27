<?php //lấy qiamly từ menu truyền vào bằng phuongư thức GET
if (isset($_GET['quanly'])) {
    $bientam = $_GET['quanly'];
    if ($bientam == 'products') {
        include("products.php");
    } elseif ($bientam == 'themsanpham') {
        include("addproduct.php");
    } elseif ($bientam == 'login') {
        include("auth/login.php");
    } elseif ($bientam == 'cart') {
        include("cart.php");
    } elseif ($bientam == 'checkout') {
        include("checkout.php");
    } else {
        include("content.php");
    }

} else {
    include("content.php");
}


?>