<?php
require_once "config/connectDatabase.php";
?>

<?php
    $search = $_GET["search"];
    $sql = "SELECT * FROM laptops where model LIKE '%".$search."%'";
    echo $sql;
    $result = $conn->query($sql);

    // Check if any rows are returned
    if ($result->num_rows > 0) {
        // Output data for each row
        while ($row = $result->fetch_assoc()) {
            $id = $row["id"];
            echo "<tr>
    <td>" . $row["id"] . "</td>
    <td>" . $row["brand"] . "</td>
    <td>" . $row["model"] . "</td>
    <td>" . $row["price"] . "</td>
    <td>" . $row["description"] . "</td>
    <td  ><img class='img-thumbnail' width='150px' src='public/images/" . $row["image_url"] . "'></td>
    <td><a class='btn btn-success' href='edit.php?eid=" . $row["id"] . "'>Edit</a>
    <a class='btn btn-danger' href='admin.php?delete_id=$id' onclick='return confirm(\"Bạn có chắc chắn muốn xóa sản phẩm này?\")'>Delete</a>
    </td>
    </tr>";
        }
    }
    
?>