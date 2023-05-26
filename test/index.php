<?php
require_once "config/connectDatabase.php";
// Lấy tổng số sản phẩm từ cơ sở dữ liệu
$sqlTotal = "SELECT COUNT(*) as total FROM Laptops";
$resultTotal = $conn->query($sqlTotal);

$totalProducts = $resultTotal->fetch_assoc()["total"];
$itemsPerPage = 6;
?>

<!DOCTYPE html>
<html>

<head>
    <title>Load dữ liệu bằng Ajax và PHP</title>
    <script src="public/js/ajax.js"></script>
    <link rel="stylesheet" href="public\css\bootstrap\bootstrap.min.css">
    <script src="public\js\bootstrap\bootstrap.min.js"></script>

    <script>
        var currentPage = 1;
        var itemsPerPage = 6; // Số mục trên mỗi trang
        var totalPages = 0; // Thêm biến totalPages ở phạm vi toàn cục

        $(document).ready(function () {
            loadData(currentPage);


            $(document).on("click", ".pagination .page-link", function (e) {
                e.preventDefault();
                var page = parseInt($(this).text());
                loadData(page);
            });

            
        });


        function loadData(page) {
            $.ajax({
                url: "load_data.php",
                method: "GET",
                data: { page: page, itemsPerPage: itemsPerPage },
                dataType: "html",
                success: function (response) {
                    if (response.trim() === "") {
                        $("#result").html("No data available.");
                        $(".pagination").empty(); // Xóa phân trang
                    } else {
                        $("#result").html(response);
                        generatePagination(page);
                    }
                },
                error: function () {
                    $("#result").html("Failed to load data.");
                }
            });
        }



        function generatePagination(currentPage) {
            $.ajax({
                url: "load_data.php",
                method: "GET",
                dataType: "json",
                success: function (response) {
                    totalPages = response; // Sửa thành totalPages = response
                    var paginationElement = $(".pagination");
                    paginationElement.empty(); // Xóa nội dung phân trang trước khi tạo phân trang mới

                    

                    

                    

                    // Xử lý sự kiện khi nhấp
                    // Xử lý sự kiện khi nhấp vào các liên kết trang
                    paginationElement.find("a.page-link").click(function (e) {
                        e.preventDefault();
                        var page = parseInt($(this).text());

                        // Tải dữ liệu cho trang đã nhấp vào
                        loadData(page);
                    });

                    

                },
                error: function () {
                    paginationElement.html("Failed to generate pagination.");
                }
            });
        }


    </script>
</head>

<body>
    <div class="container pt-5">
        <table class="table table-striped" id="data">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Thương hiệu</th>
                    <th>Mẫu</th>
                    <th>Giá</th>
                    <th>Mô tả</th>
                    <th>Ảnh</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="result">

            </tbody>
        </table>
    </div>
    <div class="container">
        <ul class="pagination">
            <?php
            $totalPages = ceil($totalProducts / $itemsPerPage);
            // Tạo các nút phân trang
            for ($i = 1; $i <= $totalPages; $i++) {
                echo '<li class="page-item">'.$i.'<a class="page-link" href="#"</a></li>';
            }
            ?>
        </ul>
    </div>

</body>

</html>