-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: student-databases.cvode4s4cwrc.us-west-2.rds.amazonaws.com
-- Generation Time: May 06, 2026 at 08:04 AM
-- Server version: 8.0.42
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ZOEHARMANING`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `id` int NOT NULL,
  `class` varchar(255) NOT NULL,
  `level` int NOT NULL,
  `professor_id` int NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `semester` varchar(255) NOT NULL,
  `credits` int NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `class`, `level`, `professor_id`, `category`, `semester`, `credits`, `action`) VALUES
(1, 'Game Design Theory', 200, 2, 'GIMM', 'spring', 3, ''),
(2, 'Mobile Web Services II', 200, 1, 'GIMM', 'spring', 3, ''),
(3, 'Mobile Web Development', 300, 2, 'GIMM', 'spring', 3, ''),
(4, 'Memory Culture', 200, 4, 'University Foundations', 'spring', 3, ''),
(5, 'Introduction to Archaeology', 100, 5, 'Anthropology', 'spring', 3, ''),
(6, '3D Animation & Modeling', 300, 3, 'GIMM', 'fall', 3, ''),
(7, 'Mobile Web Development and IOT', 300, 1, 'GIMM', 'fall', 3, ''),
(8, 'Game Development', 300, 6, 'GIMM', 'fall', 3, ''),
(9, 'Web Application Development', 300, 7, 'ITM', 'fall', 3, ''),
(10, 'Introduction to Programming', 200, 7, 'ITM', 'fall', 3, ''),
(18, 'BroncoFit', 100, 8, 'Kine', 'fall', 1, ''),
(19, 'Mobile Web Services I', 200, 1, 'GIMM', 'fall', 3, ''),
(20, 'Life\'s Biggest Questions', 100, 8, 'University Foundations', 'fall', 3, ''),
(21, 'Foundations of Climate Change', 100, 8, 'University Foundations', 'fall', 3, ''),
(22, 'The Purposes of College', 100, 8, 'University Foundations', 'fall', 3, ''),
(23, 'Moral Courage', 200, 8, 'University Foundations', 'spring', 3, ''),
(24, 'Ethics in Society and Idaho History', 200, 8, 'University Foundations', 'spring', 3, ''),
(25, 'Conspiracy and Misinformation in Society', 200, 8, 'University Foundations', 'spring', 3, ''),
(26, 'Interactive Audio and Video', 200, 2, 'GIMM', 'fall', 3, ''),
(27, 'Interactive Physical Computing', 200, 2, 'GIMM', 'fall', 3, ''),
(28, 'Advanced 3D Animation', 300, 3, 'GIMM', 'spring', 3, ''),
(29, 'Visual Storytelling', 200, 3, 'GIMM', 'spring', 3, ''),
(30, 'Digital Tools for Interactivity', 100, 3, 'GIMM', 'fall', 3, ''),
(31, 'Game and Virtual Reality Audio', 300, 2, 'GIMM', 'spring', 3, ''),
(32, 'Visual Storytelling', 200, 6, 'GIMM', 'spring', 3, ''),
(33, 'Game Development', 300, 3, 'GIMM', 'fall', 3, ''),
(34, 'Multiplayer Game Development', 400, 6, 'GIMM', 'fall', 3, ''),
(35, 'Digital Portfolio', 400, 6, 'GIMM', 'spring', 3, ''),
(36, 'Archaeology of North America', 300, 5, 'Anthropology', 'both', 3, ''),
(37, 'Archaeology Field School', 400, 5, 'Anthropology', 'both', 3, ''),
(38, 'Laboratory Methods in Archaeology', 400, 5, 'Anthropology', 'both', 3, ''),
(39, 'Historical Archaeology', 400, 5, 'Anthropology', 'fall', 3, ''),
(40, 'Foundations of Ethics in Society', 200, 4, 'University Foundations', 'fall', 3, ''),
(41, 'Web Dev III', 400, 1, 'GIMM', 'spring', 3, ''),
(42, 'Game Development II', 500, 1, 'GIMM', 'spring', 3, ''),
(43, 'Game Development III', 500, 1, 'GIMM', 'fall', 3, ''),
(44, 'Visual Storytelling II', 300, 3, 'GIMM', 'spring', 3, ''),
(45, 'Visual Storytelling III', 500, 3, 'GIMM', 'fall', 3, ''),
(46, 'Archaeology Field School II', 500, 5, 'Anthropology', 'both', 4, ''),
(47, 'Intermediate Algebra', 100, 8, 'Math', 'both', 3, ''),
(48, 'Math in Modern Society', 100, 8, 'Math', 'spring', 3, ''),
(49, 'Systems Planning and Analysis', 300, 7, 'ITM', 'spring', 3, ''),
(50, 'Big Data and Web Analytics', 300, 7, 'ITM', 'spring', 3, ''),
(51, 'Predictive Analytics', 400, 7, 'ITM', 'both', 3, ''),
(52, 'Cloud Computing', 400, 7, 'ITM', 'fall', 3, ''),
(53, 'Why Societies Need Dissent', 100, 4, 'University Foundations', 'both', 3, ''),
(54, 'Navigating Difficult Conversations', 100, 4, 'University Foundations', 'fall', 3, ''),
(55, 'The Stories that Shape Us', 100, 4, 'University Foundations', 'fall', 3, ''),
(56, 'Media Literacy and Civic Engagement', 100, 4, 'University Foundations', 'both', 3, ''),
(57, 'Ethics in Society and Idaho History', 200, 4, 'University Foundations', 'both', 3, ''),
(58, 'Memory in Society', 200, 4, 'University Foundations', 'both', 3, ''),
(59, 'Global Knowledge', 200, 8, 'University Foundations', 'both', 3, ''),
(60, 'What Matters?', 200, 4, 'University Foundations', 'both', 3, ''),
(61, 'Statistical Methods', 200, 8, 'Math', 'fall', 3, ''),
(62, 'Introduction to Linear Algebra', 300, 8, 'Math', 'spring', 3, ''),
(63, 'Logic and Set Theory', 400, 8, 'Math', 'both', 3, ''),
(64, 'Statistical Learning', 400, 8, 'Math', 'fall', 3, ''),
(65, 'Cultural Anthropology', 100, 5, 'Anthropology', 'fall', 3, ''),
(66, 'History and Theory in Anthropology', 300, 5, 'Anthropology', 'spring', 3, ''),
(67, 'Hunter-Gatherers', 400, 5, 'Anthropology', 'fall', 3, ''),
(68, 'Research Methods for Social Scientists', 400, 5, 'Anthropology', 'spring', 4, ''),
(69, 'Introduction to Cultural Resource Management', 400, 5, 'Anthropology', 'fall', 4, ''),
(70, 'Digital Tools for Interactivity', 100, 3, 'GIMM', 'spring', 3, ''),
(71, 'Interactive Elements in Cinematic Virtual Environments', 400, 6, 'GIMM', 'spring', 3, ''),
(72, 'Senior Capstone I', 400, 1, 'GIMM', 'fall', 3, ''),
(73, 'Senior Capstone II', 400, 1, 'GIMM', 'spring', 3, ''),
(74, 'Advanced Game Development II', 500, 6, 'GIMM', 'fall', 3, ''),
(75, 'Ethics in a Digital Age', 200, 4, 'University Foundations', 'spring', 3, ''),
(76, 'Civics for All', 200, 8, 'University Foundations', 'fall', 3, ''),
(77, 'Ethical Relationships', 200, 8, 'University Foundations', 'spring', 3, ''),
(78, 'Ethical Leadership for Organizational Change', 200, 4, 'University Foundations', 'fall', 3, ''),
(79, 'Business Intelligence', 300, 7, 'ITM', 'fall', 3, ''),
(80, 'Information Security', 400, 7, 'ITM', 'spring', 3, ''),
(81, 'Current Topics in Information Technology Management', 400, 7, 'ITM', 'fall', 3, ''),
(82, 'Precalculus II: Trigonometry', 100, 8, 'Math', 'spring', 3, ''),
(83, 'Discrete Mathematics', 100, 8, 'Math', 'spring', 3, ''),
(84, 'Advanced 3D Animation II', 400, 3, 'GIMM', 'spring', 4, ''),
(85, 'Mobile Web Development', 300, 1, 'GIMM', 'fall', 3, ''),
(86, 'Undergraduate Research Experience', 200, 5, 'Anthropology', 'spring', 3, ''),
(87, 'Kinship and Social Organization', 300, 5, 'Anthropology', 'fall', 3, ''),
(88, 'Human Variation', 300, 5, 'Anthropology', 'spring', 3, ''),
(89, 'Evolution of the Human Life Cycle', 300, 5, 'Anthropology', 'spring', 3, ''),
(90, 'College Algebra', 100, 8, 'Math', 'fall', 3, ''),
(91, 'Functions and Modeling', 300, 8, 'Math', 'spring', 3, ''),
(92, 'Number Theory', 400, 8, 'Math', 'spring', 3, ''),
(93, 'Complex Variables', 400, 8, 'Math', 'fall', 3, ''),
(94, 'Linear Programming', 400, 8, 'Math', 'spring', 3, ''),
(95, 'Database Systems', 300, 7, 'ITM', 'spring', 3, ''),
(96, 'Advanced Database', 400, 7, 'ITM', 'spring', 3, ''),
(97, 'Foundations of Climate Change', 100, 4, 'University Foundations', 'fall', 3, ''),
(98, 'The Age of Information', 100, 4, 'University Foundations', 'fall', 3, ''),
(99, 'Action in Education', 100, 4, 'University Foundations', 'spring', 3, ''),
(100, 'Advanced 3D Rigging', 500, 3, 'GIMM', 'spring', 3, ''),
(101, 'Life in Extreme Environments', 100, 5, 'University Foundations', 'spring', 3, ''),
(102, 'Design Thinking for Better UX', 300, 3, 'GIMM', 'fall', 3, ''),
(103, 'Game Assets', 300, 6, 'GIMM', 'spring', 3, ''),
(104, 'Game Assets II', 400, 6, 'GIMM', 'fall', 3, ''),
(105, 'Advanced UI/UX I', 500, 3, 'GIMM', 'fall', 3, ''),
(106, 'Advanced UI/UX II', 500, 3, 'GIMM', 'spring', 3, ''),
(107, 'Advanced Game Audio I', 500, 2, 'GIMM', 'fall', 3, ''),
(108, 'Advanced Game Audio II', 500, 2, 'GIMM', 'spring', 3, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
