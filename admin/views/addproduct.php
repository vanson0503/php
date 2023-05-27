<h2>Thêm Sản phẩm</h2>
<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="brandid">Danh mục</label>
        <select class="form-control" name="category" id="">
            <?php
            $sqlSelectCategory = "SELECT * FROM category";
            $CategoryList = mysqli_query($conn, $sqlSelectCategory);

            if (mysqli_num_rows($CategoryList) > 0) {
                while ($row = mysqli_fetch_assoc($CategoryList)) {
                    echo '<option value="' . $row["id"] . '"> ' . $row["name"] . '</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="form-group">
        <label for="brandid">Nhãn hiệu</label>
        <select class="form-control" name="brand" id="">
            <?php
            $sqlSelectBrand = "SELECT * FROM brand";
            $BrandList = mysqli_query($conn, $sqlSelectBrand);

            if (mysqli_num_rows($BrandList) > 0) {
                while ($row = mysqli_fetch_assoc($BrandList)) {
                    echo '<option value="' . $row["id"] . '"> ' . $row["name"] . '</option>';
                }
            }
            ?>
        </select>
    </div>
    <div class="form-group">
        <label for="name">Tên sản phẩm:</label>
        <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="form-group">
        <label for="description">Mô tả:</label>
        <textarea class="form-control" id="description" name="description" required></textarea>
    </div>
    <div class="form-group">
        <label for="quantity">Số lượng:</label>
        <input type="number" class="form-control" id="quantity" name="quantity" required>
    </div>
    <div class="form-group">
        <label for="price">Giá:</label>
        <input type="text" class="form-control" id="price" name="price" required>
    </div>
    <div class="form-group">
        <label for="files">Chọn ảnh:</label> <br>
        <input type="file" id="files" name="files[]" multiple class="form-control-file" required>
    </div>
    <div class="form-group">
        <label for="cpu">CPU:</label>
        <input type="text" class="form-control" id="cpu" name="cpu" required>
    </div>
    <div class="form-group">
        <label for="ram">RAM:</label>
        <input type="text" class="form-control" id="ram" name="ram" required>
    </div>
    <div class="form-group">
        <label for="cardname">Card màn hình:</label>
        <input type="text" class="form-control" id="cardname" name="cardname" required>
    </div>
    <div class="form-group">
        <label for="harddrive">Ổ cứng:</label>
        <input type="text" class="form-control" id="harddrive" name="harddrive" required>
    </div>
    <div class="form-group">
        <label for="screen">Màn hình:</label>
        <input type="text" class="form-control" id="screen" name="screen" required>
    </div>
    <div class="form-group">
        <label for="connect">Kết nối:</label>
        <input type="text" class="form-control" id="connect" name="connect" required>
    </div>
    <div class="form-group">
        <label for="operatingsystem">Hệ điều hành:</label>
        <input type="text" class="form-control" id="operatingsystem" name="operatingsystem" required>
    </div>
    <div class="form-group">
        <label for="battery">Pin:</label>
        <input type="text" class="form-control" id="battery" name="battery" required>
    </div>
    <button type="submit" class="btn btn-primary" name="add">Thêm</button>
</form>

<?php

if (isset($_POST["add"])) {
    $name = $_POST["name"];
    $brand = $_POST["brand"];
    $category = $_POST["category"];
    $description = $_POST["description"];
    $quantity = $_POST["quantity"];
    $price = $_POST["price"];
    $cpu = $_POST["cpu"];
    $ram = $_POST["ram"];
    $cardname = $_POST["cardname"];
    $harddrive = $_POST["harddrive"];
    $screen = $_POST["screen"];
    $connect = $_POST["connect"];
    $operatingsystem = $_POST["operatingsystem"];
    $battery = $_POST["battery"];

    $insertProduct = "INSERT INTO product (categoryid, brandid, name, description, quantity, price)
    VALUES ($category, $brand, '$name', '$description', $quantity, $price)";
    mysqli_query($conn, $insertProduct);

    // Lấy ID của sản phẩm vừa chèn
    $productID = mysqli_insert_id($conn);

    $insertConfiguration = "INSERT INTO configuration( productid, cpu, ram, cardname, harddrive, screen, connect, operatingsystem, battery) 
    VALUES($productID,'$cpu','$ram','$cardname','$harddrive','$screen','$connect','$operatingsystem','$battery')";

    mysqli_query($conn, $insertConfiguration);

    $files = $_FILES['files'];

    // Kiểm tra xem có file được tải lên hay không
    if (!empty($files['name'][0])) {
        $uploadedFiles = [];
        $errors = [];

        // Thư mục lưu trữ file
        $targetDir = '../uploads/';

        // Lặp qua từng file
        for ($i = 0; $i < count($files['name']); $i++) {
            $filename = basename($files['name'][$i]);
            $targetPath = $targetDir . $filename;

            // Kiểm tra và di chuyển file vào thư mục lưu trữ
            if (move_uploaded_file($files['tmp_name'][$i], $targetPath)) {
                $insertImage = "INSERT INTO image(productid, url) VALUES($productID,'$filename')";
                mysqli_query($conn, $insertImage);
                $uploadedFiles[] = $targetPath;
            } else {
                $errors[] = "Không thể tải lên file '{$filename}'";
            }
        }

        // Hiển thị thông báo thành công và các file đã tải lên
        if (!empty($uploadedFiles)) {
            echo "Các file đã được tải lên thành công:<br>";
            foreach ($uploadedFiles as $file) {
                echo $file . "<br>";
            }
        }

        // Hiển thị thông báo lỗi (nếu có)
        if (!empty($errors)) {
            echo "Có lỗi xảy ra khi tải lên các file:<br>";
            foreach ($errors as $error) {
                echo $error . "<br>";
            }
        }
    }
}
?>