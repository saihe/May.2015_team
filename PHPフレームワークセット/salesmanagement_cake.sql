-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015 年 8 朁E06 日 11:21
-- サーバのバージョン： 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `salesmanagement_cake`
--
CREATE DATABASE IF NOT EXISTS `i510a` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `i510a`;

-- --------------------------------------------------------

--
-- テーブルの構造 `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL COMMENT '顧客ID',
  `customer_name` varchar(30) NOT NULL COMMENT '顧客名',
  `tel` varchar(12) DEFAULT NULL COMMENT '電話番号',
  `email` varchar(50) DEFAULT NULL COMMENT 'メールアドレス',
  `created` datetime NOT NULL COMMENT '作成日時',
  `modified` datetime NOT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='顧客マスタ';

--
-- テーブルのデータのダンプ `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `tel`, `email`, `created`, `modified`) VALUES
(1, '青山商事', '0268-26-9999', 'ao@aaaa.jp', '2015-06-29 13:13:16', '2015-06-29 13:13:16'),
(2, 'ひまわり商事', '06-6547-8947', 'info@himawari.com', '2015-06-29 13:14:55', '2015-06-29 13:14:55'),
(3, 'まこに酒房', '0268-36-3214', 'makoni@plala.pr', '2015-06-29 13:14:55', '2015-06-29 13:14:55'),
(4, '丸子文具', '0268-26-9999', 'tatsudai2000@gmail.com', '2015-06-29 13:15:43', '2015-06-29 13:15:43');

-- --------------------------------------------------------

--
-- テーブルの構造 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL COMMENT '商品ID',
  `good_name` varchar(20) NOT NULL COMMENT '商品名',
  `price` int(11) NOT NULL COMMENT '単価',
  `created` datetime NOT NULL COMMENT '作成日時',
  `modified` datetime NOT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='商品マスタ';

--
-- テーブルのデータのダンプ `goods`
--

INSERT INTO `goods` (`id`, `good_name`, `price`, `created`, `modified`) VALUES
(1, 'シンプルな消しゴム', 300, '2015-06-29 13:16:13', '2015-06-29 13:16:13'),
(2, 'カラフルノート', 300, '2015-06-29 13:17:22', '2015-06-29 13:17:22'),
(3, 'きらきらボールペン', 120, '2015-06-29 13:17:22', '2015-06-29 13:17:22'),
(4, '天使のメモ帳', 200, '2015-06-29 13:18:16', '2015-06-29 13:18:16'),
(5, 'チョコの味するスケール', 1080, '2015-06-29 13:18:16', '2015-06-29 13:18:16'),
(6, 'センサー付クリップ', 650, '2015-06-29 13:19:07', '2015-06-29 13:19:07'),
(7, 'おせっかいなノート', 1500, '2015-06-29 13:19:07', '2015-06-29 13:19:07'),
(8, 'ミスト付ボールペン', 230, '2015-06-29 13:19:44', '2015-06-29 13:19:44'),
(9, 'どっしりしたブックエンド', 500, '2015-07-08 16:28:11', '2015-07-08 16:28:11'),
(10, '消せるボールペン', 250, '2015-07-08 16:28:44', '2015-07-08 16:28:44'),
(11, '多彩なマーカー（24色）', 800, '2015-07-08 16:29:28', '2015-07-08 16:29:28'),
(12, 'らくがき帳', 300, '2015-07-08 16:44:26', '2015-07-08 16:44:26'),
(13, 'ごついペンケース', 500, '2015-07-08 16:45:53', '2015-07-08 16:45:53'),
(14, '厚いノート（A4/200頁）', 650, '2015-07-08 16:46:50', '2015-07-08 16:46:50'),
(15, '水彩色鉛筆', 1200, '2015-07-08 16:47:21', '2015-07-08 16:47:21'),
(16, '定規セット', 200, '2015-07-08 16:47:47', '2015-07-08 16:47:47'),
(17, 'クリアケース（50枚）', 150, '2015-07-08 16:48:23', '2015-07-08 16:48:23'),
(18, '陶器製ペン・スタンド', 350, '2015-07-08 16:48:56', '2015-07-08 16:55:24'),
(19, '製図用シャープペンシル（0.3mm）', 1000, '2015-07-08 16:50:03', '2015-07-08 16:50:03'),
(20, 'まい、修造（日めくり松岡修造カレンダー）', 1080, '2015-07-08 16:54:27', '2015-07-08 16:54:27'),
(21, 'システム手帳用リフィル（月間ダイアリー）', 756, '2015-07-08 16:56:31', '2015-07-08 16:56:31');

-- --------------------------------------------------------

--
-- テーブルの構造 `sales_infos`
--

CREATE TABLE IF NOT EXISTS `sales_infos` (
  `id` int(11) NOT NULL COMMENT '売上ID',
  `sales_date` date NOT NULL COMMENT '売上日',
  `customer_id` int(11) NOT NULL COMMENT '顧客ID',
  `good_id` int(11) NOT NULL COMMENT '商品ID',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `created` datetime NOT NULL COMMENT '作成日時',
  `modified` datetime NOT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='売上情報';

--
-- テーブルのデータのダンプ `sales_infos`
--

INSERT INTO `sales_infos` (`id`, `sales_date`, `customer_id`, `good_id`, `quantity`, `created`, `modified`) VALUES
(1, '2015-06-29', 1, 1, 10, '2015-06-29 07:07:18', '2015-06-29 07:07:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_infos`
--
ALTER TABLE `sales_infos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顧客ID',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sales_infos`
--
ALTER TABLE `sales_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '売上ID',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
