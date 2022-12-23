-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 01:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` varchar(100) NOT NULL,
  `status` enum('pending','approved','rejected','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `doctor_id`, `patient_id`, `name`, `email`, `contact`, `appointment_date`, `appointment_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'John', 'john1@gmail.com', '01729 893000', '2023-01-04', '10:30', 'rejected', '2022-12-20 06:04:29', '2022-12-20 06:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `user_id`, `full_name`, `contact`, `qualification`, `specialization`, `hospital_id`, `created_at`, `updated_at`) VALUES
(1, 15, 'Allen', '01473 217777', 'MBBS', 'Heart Specialist', 4, '2022-12-19 23:31:47', '2022-12-19 23:31:47'),
(2, 19, 'Ally', '01473 217710', 'MBBS', 'Lungs Specialist', 1, '2022-12-20 03:02:17', '2022-12-20 12:01:51');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `age` int(11) NOT NULL,
  `health_history` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `user_id`, `name`, `contact`, `address`, `gender`, `age`, `health_history`, `created_at`, `updated_at`) VALUES
(1, 6, 'John', '01275 343739', 'Elton Rd,Clevedon,Avon,United Kingdom', 'male', 40, 'Blood Sugar since 2020', '2022-12-19 06:10:11', '2022-12-19 06:10:11'),
(3, 12, 'Robert', '01275 343739', '14 High St,Croydon,Surrey,United Kingdom', 'male', 42, 'Blood Pressure since 2017', '2022-12-19 06:23:34', '2022-12-19 06:23:34'),
(5, 18, 'Lewis Roberts', '01729 893000', 'Giggleswick,Settle,North Yorkshire,United Kingdom', 'male', 35, 'Heart Problem since 2020', '2022-12-20 01:25:15', '2022-12-20 01:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` varchar(255) NOT NULL,
  `tokenable_id` varchar(255) NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `last_used_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `name`, `token`, `abilities`, `tokenable_id`, `tokenable_type`, `updated_at`, `created_at`, `last_used_at`) VALUES
(1, 'Token', 'b61f09a7f0b016fcebcaa6150dd20b0be0f466645686f7853a1e416051dedd44', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:45:26', '2022-12-19 10:45:26', ''),
(2, 'Token', '3977be478e312265622f8037973decab52777f5a592824047df8b396b8fca95b', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:45:46', '2022-12-19 10:45:46', ''),
(3, 'Token', '1e1a56d029b20a3c5f38b3d7b34759977b6662de5cbeeaac967a638e3471fd61', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:45:46', '2022-12-19 10:45:46', ''),
(4, 'Token', 'eade9b608653a70e9d78185972d282954a8b9c22b5fde2b51d0cc7c86d0a4338', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:47:23', '2022-12-19 10:47:23', ''),
(5, 'Token', '1a1b8971034a050c33da5d999b7a498fbeedd2ebae7b5010133ed672b78757a7', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:47:23', '2022-12-19 10:47:23', ''),
(6, 'Token', '66955d08159cd6bee3bae62c12733a9f2c7f84cf4088c190b2ab24cafa017dc5', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:47:33', '2022-12-19 10:47:33', ''),
(7, 'Token', 'c9c8b7b58ffaa706ccbdb83407bc8214cbe931312fc9be1e902bbb4ef8e36fad', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:47:33', '2022-12-19 10:47:33', ''),
(8, 'Token', '4cb55a2fa5777625d8225bc0462a615d0d01532e24482d0afba46c7e92954dd9', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:11', '2022-12-19 10:48:11', ''),
(9, 'Token', 'e568ec54bb88c5b227701b67d65b8cbda68739794413f3c01f82a71716077586', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:11', '2022-12-19 10:48:11', ''),
(10, 'Token', 'c54494a7cc6588eeabb8eda75d11848876fe0a10810cc475cf9afa601925531e', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:31', '2022-12-19 10:48:31', ''),
(11, 'Token', '486bd80621f174aa5fc5ec06cde4ae6cc5242fdc958342b04278882317dae495', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:31', '2022-12-19 10:48:31', ''),
(12, 'Token', 'e2934ae2a1a090e3b1b3ebef724e7054883f8f005e6ce90a7abf0344c123bdd9', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:36', '2022-12-19 10:48:36', ''),
(13, 'Token', '1bbb31fbc5a18fa7ff21e22b4abe857aa9f82b2a5e0146faae683e377ba1d356', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:36', '2022-12-19 10:48:36', ''),
(14, 'Token', '264ff735c9ded7162ba96f98d109e942aba94c8d4b2f2dea4682bfe35b84b9b4', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:48', '2022-12-19 10:48:48', ''),
(15, 'Token', '457cf5c1b9fc43541d2ccc7f7732d8512feb5d6c8e94756b0312b7a96d9d3e7b', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:48:49', '2022-12-19 10:48:49', ''),
(16, 'Token', '1ad2237597dbc1fbbcd0f16133f493fc79bdaa804faf7e1b2b12331f6cf8bd9a', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:49:18', '2022-12-19 10:49:18', ''),
(17, 'Token', 'eee3207c8947021834b13e08ac5a70c64e0d6ecdfbcc4e63801b0ee792659ea4', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:49:18', '2022-12-19 10:49:18', ''),
(18, 'Token', '78873e93725c9ef49f58d63e323667e031b2946f68b673071b5ec25a5c967465', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:49:48', '2022-12-19 10:49:48', ''),
(19, 'Token', '551109493ded7b33aee19bcf33de709a3a214cd902b45c174687dbb16502d9b2', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:49:48', '2022-12-19 10:49:48', ''),
(20, 'Token', '4ea0a0dc28d6545be88a1cb4b586ce4b650cb9636dd0a7a593036f55f66e44d5', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:49:58', '2022-12-19 10:49:58', ''),
(21, 'Token', '5e5c9bf7b6cbe8d0fd931f9b95be9660c8e948c94bcd18f322085e6f4ab86b83', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:49:58', '2022-12-19 10:49:58', ''),
(22, 'Token', '9d78908fbdbdd1846fd2443d1833f096d5719dd086c1a24cea0f2b5d6e8a4d9d', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:50:07', '2022-12-19 10:50:07', ''),
(23, 'Token', '7d5ff3630bc824c03199db4c8e5697bccddce14cc341c7ef407b59a0037a660e', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:50:07', '2022-12-19 10:50:07', ''),
(24, 'Personal Access Token', '31789b7506e797a1ec72d5751538f596429283797cc02b787979535f2b61945a', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:51:41', '2022-12-19 10:51:41', ''),
(25, 'Personal Access Token', '2dfdf1674894821e02d88ce47a84886e83f3feaac30ec374c2238282055064bb', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:52:27', '2022-12-19 10:52:27', ''),
(26, 'Personal Access Token', '25d4c828e13c49e5f6ba5ae4c30c8c3f15203ad4b2d8f1050cba73976835983f', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:52:37', '2022-12-19 10:52:37', ''),
(27, 'Personal Access Token', 'b24e80be6344ff2f75d0f3f6f8476099c7b0f1bd6df3367befede70fa170c6e7', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:52:47', '2022-12-19 10:52:47', ''),
(28, 'Personal Access Token', '118ad3f4a2cafa4c6650f65745ea129c429f924ee4eedbad1834d1a7efd95e81', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:52:51', '2022-12-19 10:52:51', ''),
(29, 'Personal Access Token', 'f7ed0585e6e159bbab1a8f92b991c9af76f2067d33b37878441d15c59875e96a', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:53:11', '2022-12-19 10:53:11', ''),
(30, 'Personal Access Token', 'a03b3a847cecb4d050a8b13344ccf20b7f0f61f27db53b5a2376a07799e3c717', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:53:34', '2022-12-19 10:53:34', ''),
(31, 'Personal Access Token', 'eb678f2257cb8f9c6ae944aa609de93c006bd0bb0b0faf31a1f0b2eaf91c9b07', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:54:15', '2022-12-19 10:54:15', ''),
(32, 'Personal Access Token', '1aea911bb9b9e4ef571f8566e4d52226587d37fc4c30c6846deb379a06e9858c', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:54:36', '2022-12-19 10:54:36', ''),
(33, 'Personal Access Token', '678501118b1c63bbd2f8c0ba752514d5d1548fd61ddd121ada5a2dce060a89e8', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:55:34', '2022-12-19 10:55:34', ''),
(34, 'Personal Access Token', 'd570a4fd815558e68a42aa8587e7a44a8b3b737dc433d8bb807c88902a3fc265', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:55:41', '2022-12-19 10:55:41', ''),
(35, 'Personal Access Token', '8520318960cd25baa993a19be616b24afb8878c5014c3e442c731437db9cabe8', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:56:44', '2022-12-19 10:56:44', ''),
(36, 'Personal Access Token', 'a401be6ab38d7b66f3af89f1856fbc1b29740271af7ce22553bec6c1c0eca7e2', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:58:42', '2022-12-19 10:58:42', ''),
(37, 'Personal Access Token', '382b218737cf7da8122aa314180fbb417fcd03f1e8436c4abfc622d4443b7934', '[\"*\"]', '1', 'App\\User', '2022-12-19 10:59:31', '2022-12-19 10:59:31', ''),
(38, 'Personal Access Token', '9268083b3b6dd306f9249b02dbf23966465e3174b55664456a6a10b44b232e03', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:00:27', '2022-12-19 11:00:27', ''),
(39, 'Personal Access Token', '40664c675ceac37d89029bf5eebc67a105531a19f68e4aef3fb28c81c408ffbd', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:01:06', '2022-12-19 11:01:06', ''),
(40, 'Personal Access Token', '403f32704f7b00159245199f18c1066ff11a9565f4b35b2f23f64d5f46a586aa', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:01:18', '2022-12-19 11:01:18', ''),
(41, 'Personal Access Token', 'c17076ab6de66d266ad75a853cb40b65600cc02234dd8913973fa340ef547918', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:02:22', '2022-12-19 11:02:22', ''),
(42, 'Personal Access Token', 'c9d6c8e4d14ac29df5d4ba8276b44ccea5b362e5f96311fe0fb67216d2485940', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:02:57', '2022-12-19 11:02:57', ''),
(43, 'Personal Access Token', '1715c5fb74b2d6ba63c9e353483fbdcb46a309789ce2fa7af5bb364d0260b284', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:03:18', '2022-12-19 11:03:18', ''),
(44, 'Personal Access Token', 'd162a14e9cd3d111ab5df028c46d9d7f0487f4c965f16b8398427c595c2c03d7', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:03:29', '2022-12-19 11:03:29', ''),
(45, 'Personal Access Token', '0960dca99c1a64ea4e12c71123c9889667c95248bd405deb319f40a0839bf528', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:08:40', '2022-12-19 11:08:40', ''),
(46, 'Personal Access Token', '619263d531b019d66994a750ac5e39fb4a19f2e21e78b21bad8f7c2a28fe00b2', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:09:13', '2022-12-19 11:09:13', ''),
(47, 'Personal Access Token', 'e3df87a73a2549c231fdce3246b6e4aea1d768411de2ab71e3d4190a1df6e124', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:09:21', '2022-12-19 11:09:21', ''),
(48, 'Personal Access Token', '24f3f42beac71979d4cbb222fb912e1a27cd7c493a2c51c96f7bc9b9efbcb32c', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:09:25', '2022-12-19 11:09:25', ''),
(49, 'Personal Access Token', '07b9cc3c69360009d256dd23023ac13e3de087923273547b4670737e9f213e1f', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:09:35', '2022-12-19 11:09:35', ''),
(50, 'Personal Access Token', '7df7586e6c814bd3b560482633042d8ba61d8df67141850b0e5e0c3fec503d4d', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:09:41', '2022-12-19 11:09:41', ''),
(51, 'Personal Access Token', 'b02e20c5a11f86f4a085d8b28fd7a655e0a97a0e1c48cf108312106859129246', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:09:59', '2022-12-19 11:09:59', ''),
(52, 'Personal Access Token', '356042f320de9535cfac80e634360a86497edc89818b35a6bbfabfb877f25b21', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:10:34', '2022-12-19 11:10:34', ''),
(53, 'Personal Access Token', '4309aefc9e6f7bedb5ec28d36cf6694ecce86f47c59a9a643694b6612187caa7', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:10:41', '2022-12-19 11:10:41', ''),
(54, 'Personal Access Token', 'c738b1d1ef90f57bf9590127cda65a3ea045782c5a12c69eea15a3a30f1c6eaa', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:11:07', '2022-12-19 11:11:07', ''),
(55, 'Personal Access Token', 'f988565ab3db039de36ef4d186b0c0c47bc03db277d5e50c11aa59d8abb4f0bd', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:11:17', '2022-12-19 11:11:17', ''),
(56, 'Bearer', '5749dbb717c8ff120f06899d34b8c367323cf55c3040fc2ff25fed14ff3c90e2', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:12:19', '2022-12-19 11:12:19', ''),
(57, 'Bearer', 'f38de378f088444ff08cec492d1d123e17ad94c7758d49a4a687690f90718700', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:13:14', '2022-12-19 11:13:14', ''),
(58, 'Bearer', '55c98c84c0ea1995014155433ea9a26ae69d1834b7e5c2e71f14642a62b8ac31', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:14:01', '2022-12-19 11:14:01', ''),
(59, 'Bearer', '8e71b856b136e201cb6c4c971a6c40099e457e414f057f2e018b96bb361a958a', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:14:09', '2022-12-19 11:14:09', ''),
(60, 'Bearer', '53252feae7e6f53a165e410ef324dfe957cc9ff55d453f63680fa63f1881ee4f', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:29:20', '2022-12-19 11:29:20', ''),
(61, 'Bearer', 'b6fe321ff9c7d7c2f0f2e89aee3a0f9d973310e07673e10e87747669bf77d379', '[\"*\"]', '1', 'App\\User', '2022-12-19 11:29:39', '2022-12-19 11:29:39', ''),
(62, 'Bearer', '042f9753d26de617ea36cd15c0bbd160b9abc4fbd324163909880e08c1c0efc1', '[\"*\"]', '2', 'App\\User', '2022-12-19 11:31:46', '2022-12-19 11:31:46', ''),
(63, 'Bearer', '892d6e04cd839767ca600cd5f2b92efcd8cb37ef254a63cbbb19a764ca65cfe4', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:07:02', '2022-12-19 12:07:02', ''),
(64, '1671451941', '072692e519a45dc1e5ddfb6f352ddd9532cdee3f59ae6c90dec7d1094b278f8a', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:12:21', '2022-12-19 12:12:21', ''),
(65, '1671451941', 'f15bf08cb75dd551ad8f13366c6729e15fa93f8259975859679bdcfb2f8cb4ba', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:12:21', '2022-12-19 12:12:21', ''),
(66, '1671451960', '12eff3763b0d39cb4d2dab709a40651c677b500ccbe192c598c1f62640f1dbb8', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:12:40', '2022-12-19 12:12:40', ''),
(67, '1671451960', 'b356628e7429191112abf95ee6d65bd882239b11b464f26a4d4a2e0235a1ad29', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:12:40', '2022-12-19 12:12:40', ''),
(68, '1671451972', 'de473b184c284eced524e6f6b9b428c00c8a23c5c438f9a54680349b60797e0a', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:12:52', '2022-12-19 12:12:52', ''),
(71, '1671452768', '0a7571209717ed70db257d303dfa9fac19aeaa16fef0d46fd64c47c195bda0c0', '[\"*\"]', '1', 'App\\User', '2022-12-19 12:26:08', '2022-12-19 12:26:08', NULL),
(72, '1671452778', 'c95a2f0deffe175aa78ee1400f490da6fafb439ef850fc5dc18a8939d84f5309', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:48:19', '2022-12-19 12:26:18', '2022-12-20 07:48:19'),
(73, '1671512198', '74893fe399b5996a81064054601761c786521cf54739db0d67e15376b20747de', '[\"*\"]', '6', 'App\\User', '2022-12-20 09:48:07', '2022-12-20 04:56:38', '2022-12-20 09:48:07'),
(74, '1671519985', '79f515d2cb4c4a2aeba4c373f3aff755986e906bfa298303366e370990162656', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:06:25', '2022-12-20 07:06:25', NULL),
(75, '1671519990', 'b43151528ab03b4f032a1e7b83424eb52a2c794dab4254b619c14cccaf79f7df', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:06:30', '2022-12-20 07:06:30', NULL),
(76, '1671520267', 'b7de35038dfc56b9159160fb72e4754d4bfb604245d7a78ae2d00c845b81a54d', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:11:07', '2022-12-20 07:11:07', NULL),
(77, '1671520356', '04d9abcf95adeb248c447b9a5d8315815c3e48c7e5f77f64da274b2f39d1699d', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:12:36', '2022-12-20 07:12:36', NULL),
(78, '1671520567', 'c15dabed97fec62935b2f2e7d738d6dee5ff097616f84582bb085962a2f9cfb6', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:16:07', '2022-12-20 07:16:07', NULL),
(79, '1671520594', '50f21cb5aeffcc129c47f3d73ca9e58d32220bab291893b14c2b332886e56a23', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:16:34', '2022-12-20 07:16:34', NULL),
(80, '1671520623', 'c81407f0f0062488abc178adcace557a66523c86c809e8546fa81114bac8bf60', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:17:03', '2022-12-20 07:17:03', NULL),
(81, '1671520675', 'a407087e74dbeb4e66ef10dd2be3f2e3edb71d1fa63026cb75a9dd7d2a236f3c', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:17:55', '2022-12-20 07:17:55', NULL),
(82, '1671521683', '10a10cc9610ba4b56b63364101c00a715f509f3df81416a20473aecddbbfe57d', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:34:43', '2022-12-20 07:34:43', NULL),
(83, '1671522892', '3fc6b8a4970d5b4f72f32af1a1ba398d8ad452b830ca9f5f3ed67e96119c784b', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:54:52', '2022-12-20 07:54:52', NULL),
(84, '1671523157', '5f4482c72c5ca960914ac74e4b54fb6468004f927d79f9e12f699ddb28afc011', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:59:17', '2022-12-20 07:59:17', NULL),
(85, '1671523194', 'e15bc522824a44234772184161985c3fa42379b621e34f0827dfb5ebef5726e3', '[\"*\"]', '6', 'App\\User', '2022-12-20 07:59:54', '2022-12-20 07:59:54', NULL),
(86, '1671523213', '57d344c9806d0cc5562776002f04ab02b19af9cde7187bd41bd7256dc908905a', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:00:13', '2022-12-20 08:00:13', NULL),
(87, '1671523320', 'e0791845f388abb6b4aa4afd784408c486bae04ca483c158c5659d5a3926deaa', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:02:00', '2022-12-20 08:02:00', NULL),
(88, '1671523343', '6c2b252575ad88ac5c4d214de2186ec1ddf927a135a27beca6d766c572df589a', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:02:23', '2022-12-20 08:02:23', NULL),
(89, '1671523374', 'd9b75dc96ce280f5f7942a39c744ccfef0e2ff7c163393be5074de8893e4f4ff', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:02:54', '2022-12-20 08:02:54', NULL),
(90, '1671523396', '4c16fdee22c2f84e612af2228e05337863a92f473bce7bed21b8951371839a6c', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:03:16', '2022-12-20 08:03:16', NULL),
(91, '1671523472', '61ef43f134830e9b442e390378f295ba28d0760f38fff42e1818ae1569de3224', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:04:32', '2022-12-20 08:04:32', NULL),
(92, '1671523549', '034ce6d3cb51e24e3741f766c65a1bdc37c7e962627b78c0f3952c84dcfa0e02', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:05:50', '2022-12-20 08:05:50', NULL),
(93, '1671523570', '8c01251b5330085bfeb4d2f7937a424c39f67ca1cad94596ff19a8675008bac4', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:06:10', '2022-12-20 08:06:10', NULL),
(94, '1671523636', '12f645e854dd83c48f34bb1a9b71ffeb67d5975e47a37c0a1d0b37ab7537c12f', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:07:16', '2022-12-20 08:07:16', NULL),
(95, '1671523661', 'd6956c6058e191db8f68c14e5f7a0d23fd2acca258087ab6b2718a7ce6bfa957', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:07:41', '2022-12-20 08:07:41', NULL),
(96, '1671523688', '2f4bb1ca22e9546df7d52b5a984d7f75d8a383f4ebe60b006e7e0099f2194415', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:08:08', '2022-12-20 08:08:08', NULL),
(97, '1671523750', '49dba717e211529be3936015fdfb8d16fcc9aa2c264f8306b024d4bdeb5749c6', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:09:10', '2022-12-20 08:09:10', NULL),
(98, '1671523804', '45428034d388de7d8ec19739e775fa3b285d696cc9638d7653fc3b6165d86e97', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:10:04', '2022-12-20 08:10:04', NULL),
(99, '1671523844', '48eeb541a91b36d04a369b7aabf2f5a8bf41ec9478a9715f8f12e79277d5b6fa', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:10:44', '2022-12-20 08:10:44', NULL),
(100, '1671523871', '7f90b3788c791d2942bdd6c166bcec9e4c3540d882746634ee25a5d56166ba06', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:11:11', '2022-12-20 08:11:11', NULL),
(101, '1671523901', 'b3c89a198b3e13074d72545e4e46b4b0154eff97602ba1df61f3f51580daa881', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:11:41', '2022-12-20 08:11:41', NULL),
(102, '1671523934', 'c524b4f5d371e635631b5b790935aeec69300f13e4234c723e1ed9de1b1f3ad5', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:12:14', '2022-12-20 08:12:14', NULL),
(103, '1671523996', 'd8c32b3f2db067c0f503397ce14a103903bbc2f31c327e2aab4a7d56fcda5784', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:13:16', '2022-12-20 08:13:16', NULL),
(104, '1671524032', '7ab139836cd58be020ceefbefda13ff50f65c8fedeb21009b71853dbb43f3ac8', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:13:52', '2022-12-20 08:13:52', NULL),
(105, '1671524326', '5f3f17cc8986e452595f26916cf578f1dc7b48e9fbc6384d5968a779abe7f118', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:18:46', '2022-12-20 08:18:46', NULL),
(106, '1671524705', '7d548db89e21fc17fb209b5b0a7e4d69d3b1643445cf5a4556d7512beed339ce', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:25:05', '2022-12-20 08:25:05', NULL),
(107, '1671524736', '81983097b2c3fdd42d9bc45394b524ceb9cd99187c0a15c448f6ff9c8d2a5743', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:25:36', '2022-12-20 08:25:36', NULL),
(108, '1671524789', 'f949c6cac2d9f0889478e0c6a0ac8085ae61ad7d69e17eea7e9ca57e1dbb3449', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:26:29', '2022-12-20 08:26:29', NULL),
(109, '1671524832', '1ec549c9756f20afc3fc6ea828ef8fd0c4e892e5631ca0a963358d9eb9b35556', '[\"*\"]', '6', 'App\\User', '2022-12-20 08:27:12', '2022-12-20 08:27:12', NULL),
(110, '1671530473', 'b01c6466a24fc70d170dc0dde93107bf5c349cca475c35c391ef3059ba8cce04', '[\"*\"]', '6', 'App\\User', '2022-12-20 10:01:13', '2022-12-20 10:01:13', NULL),
(111, '1671533561', 'a0726a9033b37ff9d343e669fd71e2fa1836891b1861197c53bd2ce81db30382', '[\"*\"]', '6', 'App\\User', '2022-12-20 10:52:41', '2022-12-20 10:52:41', NULL),
(112, '1671534904', '6c81ef6fa3bd6041aa08f1d59780d29f1efceb2b5106ef4650fd02fb95df6b31', '[\"*\"]', '15', 'App\\User', '2022-12-20 11:15:04', '2022-12-20 11:15:04', NULL),
(113, '1671535903', '07c055791397d3f343c61dadadd45744d8367bf51cb0c8318aea5b39980d9415', '[\"*\"]', '6', 'App\\User', '2022-12-20 11:31:43', '2022-12-20 11:31:43', NULL),
(114, '1671535987', 'b6752b93fc00a0075983fb774211f73a95120b51882fd967c4ef0450f98a5d32', '[\"*\"]', '6', 'App\\User', '2022-12-20 11:33:07', '2022-12-20 11:33:07', NULL),
(115, '1671536103', '9673c7a1fec5b901d8322c1829a04258bdee70aeab35e575c217b6afead51b75', '[\"*\"]', '15', 'App\\User', '2022-12-20 11:35:03', '2022-12-20 11:35:03', NULL),
(116, '1671536187', '88e9000ec36b07e04871644e792cd16ac4d444a5ff78b1e8a6d02690541c937d', '[\"*\"]', '6', 'App\\User', '2022-12-20 11:36:27', '2022-12-20 11:36:27', NULL),
(117, '1671537030', 'fd760fdc64fc410c413b7ec7000a402613f398de1826fb47ad7e5a8e34e20467', '[\"*\"]', '15', 'App\\User', '2022-12-20 11:50:30', '2022-12-20 11:50:30', NULL),
(118, '1671537045', '6ea87ab47933b337acbd6edc0b1510a901c2343d53c07849b2542c888a3824d3', '[\"*\"]', '6', 'App\\User', '2022-12-20 11:50:45', '2022-12-20 11:50:45', NULL),
(119, '1671538041', '10f6520c9bbe88c6baded538f11a6bd7ded56e0f230731f9e25cb30b5832326a', '[\"*\"]', '1', 'App\\User', '2022-12-20 12:07:21', '2022-12-20 12:07:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` enum('admin','doctor','patient') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `user_role`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', '$2y$10$1624Vcs4G70UsNItupP5HOlxboAGjp/jFXcH.TBfmYDimGO1KUnTq', 'admin', '2022-12-19 09:59:20', '2022-12-19 11:31:04'),
(6, 'john@gmail.com', '$2y$10$eh2Ost0N2hmfJ7LSt1mCKuDQOQOhfZw5sLgPDVOQyUWJnMlr/yXfS', 'patient', '2022-12-19 06:10:11', '2022-12-19 06:10:11'),
(12, 'robert@gmail.com', '$2y$10$RFU.Rm9xlCJLKqzG50ZAHe9eixnbwH2heLybfMZx2.qpWau5JNF/q', 'patient', '2022-12-19 06:23:34', '2022-12-19 06:23:34'),
(15, 'allen@gmail.com', '$2y$10$Tf5YiRZCMA.yHGgLovG7oufM6q3t8NdAg6GrEkT.RkDG4IoFk6kq.', 'doctor', '2022-12-19 23:31:47', '2022-12-19 23:31:47'),
(18, 'lewis@gmail.com', '$2y$10$nNE7bi9t0zxL9Ec/1biyLuwd41JfGuf7BgkuGguEy.xs.bAJsr2ba', 'patient', '2022-12-20 01:25:15', '2022-12-20 01:25:15'),
(19, 'ally@gmail.com', '$2y$10$UxBz6l6izClPtwxAnuvjI.Ov/ZiskvfLzr9EaLsJEwHuWKKGbZHIa', 'doctor', '2022-12-20 03:02:17', '2022-12-20 12:01:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
