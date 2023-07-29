-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2023 at 09:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Quick&Easy'),
(2, 'Kid Friendly'),
(3, 'Entertainings'),
(4, 'Weeknight'),
(5, 'Cookout'),
(6, 'Globally inspired'),
(8, 'Summer'),
(9, 'Winter'),
(10, 'Fall'),
(11, 'Chicken'),
(12, 'Beef'),
(13, 'Pork'),
(14, 'Seafood'),
(15, 'Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `meal_plan`
--

CREATE TABLE `meal_plan` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `creator_id` int(11) NOT NULL,
  `breakfast` varchar(255) NOT NULL,
  `lunch` varchar(255) NOT NULL,
  `dinner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_plan`
--

INSERT INTO `meal_plan` (`id`, `plan_name`, `start_date`, `end_date`, `creator_id`, `breakfast`, `lunch`, `dinner`) VALUES
(0, 'irst', '2023-07-10', '2023-07-28', 24, 'salad', '', 'pasta');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `prepare_time` int(11) NOT NULL COMMENT 'minutes',
  `cook_time` int(11) NOT NULL COMMENT 'minutes',
  `Ingredient` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `serving` int(2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `instructions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `title`, `prepare_time`, `cook_time`, `Ingredient`, `category_id`, `serving`, `date`, `image`, `video`, `user_id`, `description`, `instructions`) VALUES
(4, 'Creamy Salad Dressing', 10, 5, '- 1/2 cup mayonnaise\r\n- 1/4 cup sour cream or plain yogurt\r\n- 1 tablespoon lemon juice (or white wine vinegar)\r\n- 1 teaspoon Dijon mustard\r\n- 1 clove garlic, minced\r\n- Salt and pepper, to taste\r\n- Optional: 1-2 tablespoons milk or buttermilk (to adjust consistency)\r\n- Optional: Fresh herbs (such as parsley, dill, chives) or dried herbs (such as basil, thyme, or oregano) for added flavor\r\n', 1, 4, '2017-03-26 15:49:38', '', '', 1, 'It\'s complex and lovely, perfect for dressing a simple plate of greens, like our favorite side salad, or for using as a dip for party platter of veggies.', '1. In a bowl, combine the mayonnaise, sour cream (or yogurt), lemon juice (or vinegar), and Dijon mustard.\r\n2. Add the minced garlic, and season with salt and pepper to taste.\r\n3. If you prefer a thinner dressing, you can add 1 to 2 tablespoons of milk or buttermilk and stir until the desired consistency is reached.\r\n4. For additional flavor, consider incorporating fresh herbs like parsley, dill, chives, or dried herbs like basil, thyme, or oregano. Add them to the dressing and mix well.\r\n5. Taste the dressing and adjust the seasonings or other ingredients according to your preference.\r\n6. Once the dressing is well-mixed and seasoned to your liking, it\'s ready to use.\r\n7. Pour the creamy salad dressing over your favorite salad greens or use it to dress pasta salads or other dishes.\r\n8. Store any leftover dressing in an airtight container in the refrigerator. It should stay fresh for several days.\r\n'),
(5, 'Italian Salad Dressing #1', 20, 15, '1. Olive oil</br>\r\n2. Vinegar (white wine vinegar or red wine vinegar)</br>\r\n4. Lemon juice</br>\r\n5. Garlic</br>\r\n6. Dijon mustard</br>\r\n7. Italian herbs (oregano, basil, thyme, parsley, etc.)</br>\r\n8. Salt</br>\r\n9. Pepper</br>\r\n10. Optional sweetener (sugar or honey)</br>', 2, 6, '2017-03-26 15:59:33', 'Italian-Dressing.jpg', '', 2, 'This Basic Italian Salad dressing is great for turning mixed greens, steamed broccoli or asparagus spears into a delicious salad.', '1. Mix in a bowl: 1/2 cup olive oil, 1/4 cup vinegar, 2 tbsp lemon juice, 2 minced garlic cloves, 1 tsp Dijon mustard, 1 tsp dried Italian herbs, 1/2 tsp salt, and 1/4 tsp pepper. </br>\r\n\r\n2. Whisk well or shake in a jar.</br>\r\n\r\n3. Adjust taste with optional 1-2 tsp sugar or honey.</br>\r\n\r\n4. Use on salads or as a marinade.</br>\r\n\r\n5. Store leftovers in the fridge. Shake before reusing. Enjoy!');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_category`
--

CREATE TABLE `recipe_category` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0 COMMENT '0-user, 1-admin',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'UNVERIFIED',
  `profile_img` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `admin`, `name`, `email`, `password`, `status`, `profile_img`) VALUES
(1, 1, 'natan', 'natan@gmail.com', '093d8a0793df4654fee95cc1215555b3', 'UNVERIFIED', NULL),
(5, 1, 'alexabreham', 'alexabrham@gmail.com', '534b44a19bf18d20b71ecc4eb77c572f', 'UNVERIFIED', NULL),
(7, 1, 'sveta', 'sveta@gmail.com', 'a561e9a0104572145cabf1b94df59b0c', 'VERIFIED', NULL),
(8, 1, 'irina', 'irina@gmail.com', '6f73e3f14834aab0917c93282cda62a6', 'UNVERIFIED', NULL),
(14, 1, 'salima', 'salima@gmail.com', '18a676046273a8aa84866d28cc49186a', 'UNVERIFIED', NULL),
(16, 1, 'donald', 'donald@gmail.com', '0d343c0f0ca763f983c8042350059f56', 'UNVERIFIED', NULL),
(17, 1, 'serg', 'serg@gmail.com', '94747a1470803117683bc8fad40ce2ec', 'UNVERIFIED', NULL),
(23, 1, 'admin', 'admin@admin.com', '$2y$10$M1s9JpyFLU/3e1GNGMXVh.ippoqCutJFwxppZGd/qJJI.ZQMFklHG', 'VERIFIED', NULL),
(24, 0, 'gha', 'ghab@gmail.com', '$2y$10$MFMSbFhh4fcvqMjplenTZ.OvcD.RvxoGMVJ4zfwuTGVamSETeJdf2', 'UNVERIFIED', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_favorite`
--

CREATE TABLE `user_favorite` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `recipe_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_favorite`
--

INSERT INTO `user_favorite` (`id`, `user_id`, `recipe_id`) VALUES
(33, 24, 5),
(40, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_plan`
--
ALTER TABLE `meal_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recipe_id_2` (`recipe_id`,`category_id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_favorite`
--
ALTER TABLE `user_favorite`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `recipe_category`
--
ALTER TABLE `recipe_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_favorite`
--
ALTER TABLE `user_favorite`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `category_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
