<h1>Products</h1>
<a href="?quanly=themsanpham" class="btn btn-primary">Thêm sản phẩm</a>

<table class="table">
    <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Ảnh</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Thao tác</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $selectProduct = "SELECT * FROM product";
        $productList = mysqli_query($conn, $selectProduct);

        if (mysqli_num_rows($productList) > 0) {
            while ($row = mysqli_fetch_assoc($productList)) {
                $selectImage = "SELECT * FROM image WHERE productid=" . $row["id"] . " LIMIT 1";
                $imagelist = mysqli_query($conn, $selectImage);

                if (mysqli_num_rows($imagelist) > 0) {
                    $imageurl = mysqli_fetch_assoc($imagelist);
                    echo '<tr>
                            <th>' . $row["name"] . '</th>
                            <th><img style="width:100px" src="../uploads/' . $imageurl["url"] . '"></th>
                            <th>' . $row["quantity"] . '</th>
                            <th>' . $row["price"] . '</th>
                            <th><a class="btn btn-success " data-product-id="' . $row["id"] . '">Edit</a>
                            <a class="btn btn-danger btn-delete" data-product-id="' . $row["id"] . '" onclick="return confirm(\'Bạn có chắc chắn muốn xóa sản phẩm này?\')">Delete</a></th>
                        </tr>';
                } else {
                    // Xử lý khi không có hình ảnh cho sản phẩm này
                }
            }
        }



        ?>

        <script>
            $(document).ready(function () {
                $('.btn-delete').click(function () {
                    var productId = $(this).data('product-id');

                    $.ajax({
                        url: 'delete_product.php',
                        type: 'POST',
                        data: { id: productId },
                        success: function (response) {
                            
                        },
                        error: function (xhr, status, error) {
                            console.log(error);
                        }
                    });
                });
            });
        </script>
    </tbody>
</table>