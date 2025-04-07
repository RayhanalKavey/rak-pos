-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2025 at 10:01 AM
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
-- Database: `rak-pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(19, 'Wallet', 15, '2025-04-07 01:53:36', '2025-04-07 01:53:36'),
(20, 'Long wallet', 15, '2025-04-07 01:53:44', '2025-04-07 01:53:44'),
(21, 'Belt', 15, '2025-04-07 01:54:09', '2025-04-07 01:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 'Rohim', 'rohim@gamil.com', '23134114', 15, '2025-04-07 01:54:47', '2025-04-07 01:54:47'),
(11, 'korim', 'korim@gamil.com', '3241234', 15, '2025-04-07 01:55:00', '2025-04-07 01:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '5f9577df-58be-47b3-b2d3-ca4aec4b2a97', 'database', 'default', '{\"uuid\":\"5f9577df-58be-47b3-b2d3-ca4aec4b2a97\",\"displayName\":\"App\\\\Mail\\\\OTPMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\OTPMail\\\":4:{s:3:\\\"otp\\\";i:114914;s:10:\\\"expiration\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-03-23 07:20:15.793139\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"rayhanalkavey@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\OTPMail has been attempted too many times. in /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/MaxAttemptsExceededException.php:24\nStack trace:\n#0 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(794): Illuminate\\Queue\\MaxAttemptsExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(528): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(431): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#3 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#4 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#6 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#7 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#8 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#9 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#10 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#11 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#12 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#13 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#21 {main}', '2025-03-23 01:27:38'),
(2, '815a1354-9c7b-4f49-a88a-8b1a3575abcc', 'database', 'default', '{\"uuid\":\"815a1354-9c7b-4f49-a88a-8b1a3575abcc\",\"displayName\":\"App\\\\Mail\\\\OTPMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\OTPMail\\\":4:{s:3:\\\"otp\\\";i:381343;s:10:\\\"expiration\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-03-23 07:26:13.544666\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"rayhankavey@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\OTPMail has been attempted too many times. in /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/MaxAttemptsExceededException.php:24\nStack trace:\n#0 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(794): Illuminate\\Queue\\MaxAttemptsExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(528): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(431): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#3 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#4 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#6 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#7 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#8 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#9 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#10 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#11 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#12 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#13 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#15 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#21 {main}', '2025-03-23 01:29:08'),
(3, 'de47a770-e524-4233-866d-541eec132824', 'database', 'default', '{\"uuid\":\"de47a770-e524-4233-866d-541eec132824\",\"displayName\":\"App\\\\Mail\\\\OTPMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:16:\\\"App\\\\Mail\\\\OTPMail\\\":4:{s:3:\\\"otp\\\";i:187535;s:10:\\\"expiration\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-03-23 07:42:51.779403\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"rayhankavey@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Illuminate\\Queue\\TimeoutExceededException: App\\Mail\\OTPMail has timed out. in /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/TimeoutExceededException.php:15\nStack trace:\n#0 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(805): Illuminate\\Queue\\TimeoutExceededException::forJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(219): Illuminate\\Queue\\Worker->timeoutExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#2 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(154): Illuminate\\Queue\\Worker->{closure:Illuminate\\Queue\\Worker::registerTimeoutHandler():216}(14, Array)\n#3 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->{closure:Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream::initialize():153}(2, \'stream_socket_c...\', \'/Users/kavey/De...\', 157)\n#4 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client(\'smtp.gmail.com:...\', 0, \'\', 60.0, 4, Resource id #834)\n#5 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(279): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#6 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#7 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#8 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#9 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#10 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#11 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(206): Illuminate\\Mail\\Mailer->send(\'email.OTPPage\', Array, Object(Closure))\n#12 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->{closure:Illuminate\\Mail\\Mailable::send():199}()\n#13 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(199): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#14 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#15 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#16 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#17 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#18 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#19 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#20 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#21 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(170): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():123}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():168}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(126): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#25 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(170): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():121}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#26 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():168}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#27 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#29 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#30 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(392): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#32 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#35 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#37 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#38 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#39 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Container/Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#40 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call(Array)\n#41 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Command/Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/symfony/console/Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 /Users/kavey/Desktop/Programming-Involvment/Ostad/LARAVEL + VUE + INERTIA/rak-pos/artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#49 {main}', '2025-03-23 01:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `vat` varchar(50) NOT NULL,
  `payable` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `total`, `discount`, `vat`, `payable`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(24, '1200', '120', '60', '1140', 15, 10, '2025-04-07 01:58:10', '2025-04-07 01:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) NOT NULL,
  `sale_price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `user_id`, `qty`, `sale_price`, `created_at`, `updated_at`) VALUES
(16, 24, 10, 15, '1', '1200', '2025-04-07 01:58:10', '2025-04-07 01:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(16, '2025_03_17_055833_update_users_table', 2),
(17, '2025_03_17_061050_create_categories_table', 2),
(18, '2025_03_17_061625_create_customers_table', 2),
(19, '2025_03_17_061658_create_products_table', 2),
(20, '2025_03_17_061720_create_invoices_table', 2),
(21, '2025_03_17_061914_create_invoice_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `sale_status` enum('yes','no') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `user_id`, `name`, `price`, `unit`, `sale_status`, `image`, `created_at`, `updated_at`) VALUES
(10, 19, 15, 'Wallet', '1200', '4', 'yes', 'uploads/1744012557.jpeg', '2025-04-07 01:55:57', '2025-04-07 01:58:10'),
(11, 20, 15, 'Long wallet', '1500', '4', 'yes', 'uploads/1744012592.jpeg', '2025-04-07 01:56:32', '2025-04-07 01:56:32'),
(12, 21, 15, 'Belt', '500', '3', 'yes', 'uploads/1744012607.jpg', '2025-04-07 01:56:47', '2025-04-07 01:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3DawBcdkRZtXy7BpLEf9OKSNNPXRKk4XZtukR6lk', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo2OiJfdG9rZW4iO3M6NDA6IkpwQUFTbHJPbUpIVFR6WnhNR2FaOTFubVlNUmdkV3dabTluS2tKTngiO3M6MTM6Imxhc3RfYWN0aXZpdHkiO2k6MTc0Mzk0MDM4MTt9', 1743940649),
('bxvi4vLl8hZNPX2vehp3czNbUqEdrCELYpvWFyKn', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiQk9VYTJTY0lTZ0ZNalpHeXh1bFNwUk9EV0t5dm94anE3V0kzYVRjcSI7czo1OiJlbWFpbCI7czoyMToicmF5aGFua2F2ZXlAZ21haWwuY29tIjtzOjc6InVzZXJfaWQiO2k6MTU7czoxMzoibGFzdF9hY3Rpdml0eSI7aToxNzQ0MDEyODAxO30=', 1744012801),
('J4dJsxvtCc6cp4KH6GVAPA37iDBQK1K4MUirWf9q', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREd1bkRrOWQwdTBGdmFTWnRDY3phNFNGY0ZHaUFnRWZwOGtscGtXWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743970724),
('oUd1zhueIQASrWORGgzNII2pJjxGxxMeY8to825U', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3ZtUWpwYkxaWXFqVnJBQWQzWGJIZ3hSdk1TcnRGMzkzZzQ3bGtISSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743923178),
('t1WTNIP8Wt6YA97e16rcjjdKfTlmDU9Ks81JYHqx', NULL, '127.0.0.1', 'PostmanRuntime/7.43.2', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUjZCTEZMSHdzaUk0TVhKUkY1b3R3MWNhakg4ZjJIQ2cweGhoMEVjYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9JbnZvaWNlTGlzdFBhZ2UiO31zOjU6ImVtYWlsIjtzOjIxOiJyYXloYW5rYXZleUBnbWFpbC5jb20iO3M6NzoidXNlcl9pZCI7aTo2O3M6MTM6Imxhc3RfYWN0aXZpdHkiO2k6MTc0MzkzMDU0Njt9', 1743930546),
('V5XgWM689Wp2ES2oWtHOowbncZlawFzrEHsxr6ct', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDRxblM3VEtzcmZmZkRFN1h5cmpnU3l4YU02cEJDWkx6WTNDeklnbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743963430),
('v7nziRkY2mKmNt1rinnOw3M0wLOA70MJBpIiBvaz', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzVsc3ZOQnF2RUhOTXA2cmR0eEhkekk3SmdFcUlmQnIxVXBFSnllUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743982565);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `otp`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(15, 'rayhannn', '231323133', '0', 'rayhankavey@gmail.com', NULL, '$2y$12$OVTjHo9fr0/lnhH4kKE8tu2wb1FGYQ7o2vv4WrMJ3NuRae43G6X7y', NULL, '2025-04-07 01:52:54', '2025-04-07 01:59:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
