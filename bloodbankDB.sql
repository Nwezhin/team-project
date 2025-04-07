create database bloodBank;
CREATE TABLE bloodBank.Donor (
    D_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Age INT CHECK (Age >= 17 AND Age <= 70),
    Gender ENUM('Male', 'Female', 'Other'),
    PhoneNO VARCHAR(20),
    Address VARCHAR(255),
    HealthRecord TEXT,
    BloodGroup ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')
    

);
CREATE TABLE bloodBank.Blood (
    D_ID INT,
    D_DATE DATE,
    D_TIME TIME,
    D_quantity_ml INT,
    FOREIGN KEY (D_ID) REFERENCES Donor(D_ID),
    PRIMARY KEY (D_ID, D_DATE, D_TIME) -- Composite primary key
);
CREATE TABLE bloodbank.bloodbank (
    DID INT PRIMARY KEY AUTO_INCREMENT, -- Donation ID (assuming it's a unique identifier for each blood unit)
    quantity INT NOT NULL CHECK (quantity >= 0), -- Quantity of blood unit (e.g., in ml)
    bloodtype VARCHAR(3) NOT NULL CHECK (bloodtype IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    order_id  INT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE bloodBank.Hospitals (
    H_Address VARCHAR(255) PRIMARY KEY,
    H_name VARCHAR(255),
    Contact_info VARCHAR(20)
);




