-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: animalshelter
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adopter`
--

DROP TABLE IF EXISTS `adopter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopter` (
  `ID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption` (
  `Adopter_ID` int NOT NULL,
  `Animal_Id` int NOT NULL,
  `Adoption_Date` date NOT NULL,
  PRIMARY KEY (`Adopter_ID`,`Animal_Id`),
  KEY `Animal_Id` (`Animal_Id`),
  CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`Animal_Id`) REFERENCES `animal` (`ID`),
  CONSTRAINT `adoption_ibfk_2` FOREIGN KEY (`Adopter_ID`) REFERENCES `adopter` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoption_application`
--

DROP TABLE IF EXISTS `adoption_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_application` (
  `App_ID` int NOT NULL,
  `Adopter_ID` int NOT NULL,
  `Animal_ID` int NOT NULL,
  `Adopter_Name` varchar(50) NOT NULL,
  `Co_Adopter_Name` varchar(50) NOT NULL,
  `adopter_phone` varchar(15) DEFAULT NULL,
  `Adopter_Email` varchar(80) NOT NULL,
  `Over_18` tinyint(1) NOT NULL,
  `Rent_Or_Own` enum('Rent','Own') NOT NULL,
  `Landlord_Phone_No` varchar(15) DEFAULT NULL,
  `Have_Children` tinyint(1) NOT NULL,
  `Have_Animals` tinyint(1) NOT NULL,
  `Have_Yard` tinyint(1) NOT NULL,
  `Employed` tinyint(1) NOT NULL,
  `Status` enum('Accepted','Denied','Processing') DEFAULT NULL,
  PRIMARY KEY (`App_ID`),
  KEY `Animal_ID` (`Animal_ID`),
  KEY `Adopter_ID` (`Adopter_ID`),
  CONSTRAINT `adoption_application_ibfk_1` FOREIGN KEY (`Animal_ID`) REFERENCES `animal` (`ID`),
  CONSTRAINT `adoption_application_ibfk_2` FOREIGN KEY (`Adopter_ID`) REFERENCES `adopter` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoption_fees`
--

DROP TABLE IF EXISTS `adoption_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_fees` (
  `Animal_Type` varchar(25) NOT NULL,
  `Cost` decimal(15,2) NOT NULL,
  `Includes` tinytext,
  PRIMARY KEY (`Animal_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `ID` int NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Type` varchar(25) NOT NULL,
  `Shelter_ID` int NOT NULL,
  `Age_Years` int DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `Gender` enum('M','F') NOT NULL,
  `Good_With_Children` tinyint(1) DEFAULT NULL,
  `Good_With_Men` tinyint(1) DEFAULT NULL,
  `Good_With_Animals` tinyint(1) DEFAULT NULL,
  `House_trained` tinyint(1) DEFAULT NULL,
  `Special_Needs` tinyint(1) NOT NULL,
  `Intake_Date` date NOT NULL,
  `Photo` blob,
  `Adoption_Status` enum('Adopted','Processing','Available','Fostered','Unavailable') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `adoption_fees` (`Animal_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bathroom_schedule`
--

DROP TABLE IF EXISTS `bathroom_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bathroom_schedule` (
  `Animal_ID` int NOT NULL,
  `Date` date NOT NULL,
  `Employee_ID_1` int NOT NULL,
  `Time_1` time DEFAULT NULL,
  `Employee_ID_2` int DEFAULT NULL,
  `time_2` time DEFAULT NULL,
  `Employee_ID_3` int DEFAULT NULL,
  `time_3` time DEFAULT NULL,
  `Employee_ID_4` int DEFAULT NULL,
  `time_4` time DEFAULT NULL,
  PRIMARY KEY (`Animal_ID`,`Date`),
  KEY `Employee_ID` (`Employee_ID_1`),
  KEY `Employee_ID_2` (`Employee_ID_2`),
  KEY `Employee_ID_3` (`Employee_ID_3`),
  KEY `Employee_ID_4` (`Employee_ID_4`),
  CONSTRAINT `bathroom_schedule_ibfk_1` FOREIGN KEY (`Animal_ID`) REFERENCES `animal` (`ID`),
  CONSTRAINT `bathroom_schedule_ibfk_2` FOREIGN KEY (`Employee_ID_1`) REFERENCES `employee` (`ID`),
  CONSTRAINT `bathroom_schedule_ibfk_3` FOREIGN KEY (`Employee_ID_2`) REFERENCES `employee` (`ID`),
  CONSTRAINT `bathroom_schedule_ibfk_4` FOREIGN KEY (`Employee_ID_3`) REFERENCES `employee` (`ID`),
  CONSTRAINT `bathroom_schedule_ibfk_5` FOREIGN KEY (`Employee_ID_4`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cage`
--

DROP TABLE IF EXISTS `cage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cage` (
  `Cage_No` int NOT NULL,
  `Cage_Type` enum('XS','S','M','L','XL') DEFAULT NULL,
  `Animal_ID` int DEFAULT NULL,
  `Status` enum('Available','Unavailable') DEFAULT NULL,
  PRIMARY KEY (`Cage_No`),
  KEY `Animal_ID` (`Animal_ID`),
  CONSTRAINT `cage_ibfk_1` FOREIGN KEY (`Animal_ID`) REFERENCES `animal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cage_cleaning`
--

DROP TABLE IF EXISTS `cage_cleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cage_cleaning` (
  `Cage_No` int NOT NULL,
  `Employee_ID` int NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Cage_No`,`Date`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `cage_cleaning_ibfk_1` FOREIGN KEY (`Cage_No`) REFERENCES `cage` (`Cage_No`),
  CONSTRAINT `cage_cleaning_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `capacity`
--

DROP TABLE IF EXISTS `capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacity` (
  `Shelter_ID` int NOT NULL,
  `Date` date NOT NULL,
  `Current_Occupation` int NOT NULL,
  `Capacity` int NOT NULL,
  `XS_Cage_Occupied` int DEFAULT NULL,
  `Total_XS_Cage` int NOT NULL,
  `S_Cage_Occupied` int DEFAULT NULL,
  `Total_S_Cage` int NOT NULL,
  `M_Cage_Occupied` int DEFAULT NULL,
  `Total_M_Cage` int NOT NULL,
  `L_Cage_Occupied` int DEFAULT NULL,
  `Total_L_Cage` int NOT NULL,
  `XL_Cage_Occupied` int DEFAULT NULL,
  `Total_XL_Cage` int NOT NULL,
  `Intake` int DEFAULT NULL,
  `Outtake` int DEFAULT NULL,
  PRIMARY KEY (`Shelter_ID`,`Date`),
  CONSTRAINT `capacity_ibfk_1` FOREIGN KEY (`Shelter_ID`) REFERENCES `shelter` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `ID` int NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Birth_date` date NOT NULL,
  `Job_Title` varchar(50) NOT NULL,
  `Hire_Date` date NOT NULL,
  `manager_id` int DEFAULT NULL,
  `Dept_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Job_Title` (`Job_Title`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Job_Title`) REFERENCES `positions` (`Job_Position`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_schedule`
--

DROP TABLE IF EXISTS `employee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_schedule` (
  `Employee_ID` int NOT NULL,
  `Date` date NOT NULL,
  `Start_Time` time DEFAULT NULL,
  `lunch_time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`,`Date`),
  CONSTRAINT `employee_schedule_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_wage`
--

DROP TABLE IF EXISTS `employee_wage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_wage` (
  `Employee_Id` int NOT NULL,
  `Last_Raise` date DEFAULT NULL,
  `Next_Raise` date DEFAULT NULL,
  `Current_Salary` decimal(15,2) NOT NULL,
  `Pay_Frequency` enum('Weekly','Bi-weekly','Monthly','Daily') DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`),
  CONSTRAINT `employee_wage_ibfk_1` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foster`
--

DROP TABLE IF EXISTS `foster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foster` (
  `ID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `Email` varchar(80) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosterings`
--

DROP TABLE IF EXISTS `fosterings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fosterings` (
  `Foster_ID` int NOT NULL,
  `Animal_ID` int NOT NULL,
  KEY `Foster_ID` (`Foster_ID`),
  KEY `Animal_ID` (`Animal_ID`),
  CONSTRAINT `fosterings_ibfk_1` FOREIGN KEY (`Foster_ID`) REFERENCES `foster` (`ID`),
  CONSTRAINT `fosterings_ibfk_2` FOREIGN KEY (`Animal_ID`) REFERENCES `animal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `health_report`
--

DROP TABLE IF EXISTS `health_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_report` (
  `ID` int NOT NULL,
  `Inspection_Date` date NOT NULL,
  `Inspector` int NOT NULL,
  `Animal_ID` int NOT NULL,
  `Microchip` int DEFAULT NULL,
  `Sex` enum('M','F') NOT NULL,
  `Weight` int NOT NULL,
  `Vaccines` tinytext,
  `Neuter_Status` enum('Neutered','Spayed','Unneutered','Pregnant') DEFAULT NULL,
  `Conditions` tinytext,
  `Treatements` tinytext,
  PRIMARY KEY (`ID`),
  KEY `Animal_ID` (`Animal_ID`),
  KEY `Inspector` (`Inspector`),
  CONSTRAINT `health_report_ibfk_1` FOREIGN KEY (`Animal_ID`) REFERENCES `animal` (`ID`),
  CONSTRAINT `health_report_ibfk_2` FOREIGN KEY (`Inspector`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `Job_Position` varchar(80) NOT NULL,
  `Reporting_Position` varchar(80) DEFAULT NULL,
  `Min_Salary` decimal(15,2) DEFAULT NULL,
  `Max_Salary` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Job_Position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shelter`
--

DROP TABLE IF EXISTS `shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelter` (
  `ID` int NOT NULL,
  `Shelter_Name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(13) DEFAULT NULL,
  `fax_no` varchar(13) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shelter_hours`
--

DROP TABLE IF EXISTS `shelter_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelter_hours` (
  `Shelter_ID` int NOT NULL,
  `Monday_Open` time DEFAULT NULL,
  `Monday_Close` time DEFAULT NULL,
  `Tuesday_Open` time DEFAULT NULL,
  `Tuesday_Close` time DEFAULT NULL,
  `Wednesday_Open` time DEFAULT NULL,
  `Wednesday_Close` time DEFAULT NULL,
  `Thursday_Open` time DEFAULT NULL,
  `Thursday_Close` time DEFAULT NULL,
  `Friday_Open` time DEFAULT NULL,
  `Friday_close` time DEFAULT NULL,
  `Saturday_Open` time DEFAULT NULL,
  `Saturday_Close` time DEFAULT NULL,
  `Sunday_Open` time DEFAULT NULL,
  `Sunday_Close` time DEFAULT NULL,
  PRIMARY KEY (`Shelter_ID`),
  CONSTRAINT `shelter_hours_ibfk_1` FOREIGN KEY (`Shelter_ID`) REFERENCES `shelter` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `Shelter_ID` int NOT NULL,
  `Visitor_Name` varchar(50) NOT NULL,
  `Visit_Date` date NOT NULL,
  `Visit_Time` time NOT NULL,
  PRIMARY KEY (`Visitor_Name`),
  KEY `Shelter_ID` (`Shelter_ID`),
  CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`Shelter_ID`) REFERENCES `shelter` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 21:35:32
