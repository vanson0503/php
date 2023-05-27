-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 27, 2023 lúc 03:56 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `csdl_laptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `description`) VALUES
(1, 'HP', 'HP'),
(2, 'ACER', 'ACER'),
(3, 'DELL', 'DELL'),
(4, 'ASUS', 'ASUS'),
(5, 'Lenovo', 'Lenovo'),
(6, 'MacBook', 'MacBook');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customerid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Văn Phòng', 'Văn Phòng'),
(2, 'Sinh Viên', 'Sinh Viên'),
(3, 'Gamming', 'Gamming'),
(4, 'Đồ họa', 'Đồ họa'),
(5, 'Mỏng nhẹ', 'Mỏng nhẹ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `cardname` varchar(255) DEFAULT NULL,
  `harddrive` varchar(255) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `connect` varchar(255) DEFAULT NULL,
  `operatingsystem` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `configuration`
--

INSERT INTO `configuration` (`id`, `productid`, `cpu`, `ram`, `cardname`, `harddrive`, `screen`, `connect`, `operatingsystem`, `battery`) VALUES
(1, 4, '1', '1', '10', '1', '1', '1', '1', '1'),
(2, 5, '1', '1', '10', '1', '1', '1', '1', '1'),
(3, 6, '1', '1', '10', '1', '1', '1', '1', '1'),
(4, 7, '1', '1', '10', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `productid`, `url`) VALUES
(1, 4, 'Inked272726724_363832168921642_1970641462923346599_n_LI (2).jpg'),
(2, 4, 'Inked272726724_363832168921642_1970641462923346599_n_LI (3).jpg'),
(3, 4, 'Inked272726724_363832168921642_1970641462923346599_n_LI.jpg'),
(4, 5, 'Screenshot 2022-03-22 135623.png'),
(5, 5, 'Screenshot 2022-03-22 140653.png'),
(6, 5, 'Screenshot 2022-03-22 144439.png'),
(7, 5, 'Screenshot 2022-03-22 145018.png'),
(8, 6, 'hinh-nen-thien-nhien-dep-nhat-8.jpg'),
(9, 6, 'logo.png'),
(10, 7, 'Screenshot 2022-03-16 083227.png'),
(11, 7, 'Screenshot 2022-03-16 083326.png'),
(12, 7, 'Screenshot 2022-03-21 170001.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderdetailid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `categoryid`, `brandid`, `name`, `description`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 'API', 'q', 10, '1.00', NULL, '2023-05-26 15:46:42'),
(5, 1, 1, 'sadsafsaf', 'qsàasff', 10, '1.00', '2023-05-26 15:48:24', '2023-05-26 15:48:24'),
(6, 1, 1, 'sadsafsafdfdsfdsf', 'qsàasff', 10, '1.00', '2023-05-26 17:55:40', '2023-05-26 17:55:40'),
(7, 3, 3, 'sp sdsad', 'qsàasff', 10, '1.00', '2023-05-27 08:51:30', '2023-05-27 08:51:30');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `productid` (`productid`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetailid` (`orderdetailid`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `productid` (`productid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryid` (`categoryid`),
  ADD KEY `brandid` (`brandid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `configuration`
--
ALTER TABLE `configuration`
  ADD CONSTRAINT `configuration_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderdetailid`) REFERENCES `orderdetail` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandid`) REFERENCES `brand` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
