-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 16, 2022 lúc 05:41 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_update` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_name`, `status`, `date_create`, `date_update`) VALUES
(108, 'Drink', 1, '2022-05-14 19:01:04', NULL),
(109, 'Pizza', 1, '2022-05-14 19:01:39', NULL),
(110, 'Ice cream', 1, '2022-05-14 19:01:49', NULL),
(111, 'Cake', 1, '2022-05-14 19:02:06', NULL),
(112, 'Snake', 1, '2022-05-14 19:03:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_detail`
--

CREATE TABLE `tbl_detail` (
  `detail_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_detail`
--

INSERT INTO `tbl_detail` (`detail_id`, `pro_id`, `quantity`, `price`) VALUES
(101, 1839082788, 1, 30),
(101, 1839082767, 1, 11),
(102, 1839082766, 1, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment` varchar(25) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status3` tinyint(4) NOT NULL DEFAULT 1,
  `date_delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(100) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` text DEFAULT NULL,
  `status2` tinyint(4) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_name`, `cat_id`, `images`, `price`, `description`, `status2`, `date_create`, `quantity`) VALUES
(1839082765, 'Chicken', 112, 'dish-3.png', 20, '', 1, '2022-05-14 19:04:58', 0),
(1839082766, 'Pizza', 109, 'dish-4.png', 8, '', 1, '2022-05-14 19:05:17', 0),
(1839082767, 'Mango ice cream', 110, 'icecream3.jpg', 11, '', 1, '2022-05-14 19:07:40', 0),
(1839082768, 'Strawberry ice cream', 110, 'icecream.jpg', 6, '', 1, '2022-05-14 19:28:22', 0),
(1839082769, 'Kebab', 112, 'pizza1.jpg', 13.36, '', 1, '2022-05-14 19:08:59', 0),
(1839082770, 'Chocolate cake', 111, 'dish-5.png', 12, '', 1, '2022-05-14 19:09:55', 0),
(1839082771, 'Super ice cream', 110, 'icecream1.jpg', 15, '', 1, '2022-05-14 19:10:18', 0),
(1839082772, 'Chocolate ice cream', 110, 'icecream2.jpg', 12.76, '', 1, '2022-05-14 19:10:43', 0),
(1839082773, 'French chicken', 112, 'home-img-2.png', 25, '', 1, '2022-05-14 19:11:11', 0),
(1839082774, 'Orang juice', 108, 'drink4.jpg', 6, '', 1, '2022-05-14 19:11:32', 0),
(1839082775, 'Coffee', 108, 'drink2.jpg', 4, '', 1, '2022-05-14 19:12:58', 0),
(1839082776, 'Spaghetti', 112, 'home-img-1.png', 9, '', 1, '2022-05-14 19:12:28', 0),
(1839082777, 'Hamburger', 112, 'menu-2.jpg', 12, '', 1, '2022-05-14 19:13:33', 0),
(1839082778, 'Meat pizza', 109, 'home-img-3.png', 9, '', 1, '2022-05-14 19:29:48', 0),
(1839082779, 'Beef', 112, 'beef.jpg', 18, '', 1, '2022-05-14 19:16:25', 0),
(1839082780, 'Mushroom pizza', 109, 'pizza4.jpg', 16, '', 1, '2022-05-14 19:16:52', 0),
(1839082781, 'Coke and hamburger', 112, 'dish-8.png', 7, '', 1, '2022-05-14 19:21:30', 0),
(1839082782, 'Sugar cake', 111, 'menu-4.jpg', 16, '', 1, '2022-05-14 19:22:11', 0),
(1839082783, 'Cake', 111, 'dish-10.png', 21, '', 1, '2022-05-14 19:23:04', 0),
(1839082784, 'Beef', 112, 'kebab.jpg', 27, '', 1, '2022-05-14 19:23:36', 0),
(1839082785, 'Juice cake', 111, 'menu-5.jpg', 23, '', 1, '2022-05-14 19:25:26', 0),
(1839082786, 'Coocktail', 108, 'menu-7.jpg', 21, '', 1, '2022-05-14 19:31:30', 0),
(1839082787, 'Lemon chicken', 112, 'chicken.jpg', 19, '', 1, '2022-05-14 19:35:48', 0),
(1839082788, 'Fire chicken', 112, 'fire chicken.jpg', 30, '', 1, '2022-05-14 19:39:54', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` char(32) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status4` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `name`, `email`, `password`, `user_type`, `phone`, `address`, `status4`) VALUES
(23, 'Minh', 'user@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'user', NULL, NULL, 1),
(24, 'Minh', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'admin', NULL, NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`pro_id`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1839082790;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
