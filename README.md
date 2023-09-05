## Membuat Database

```bash
  CREATE DATABASE tourism;
```

### Membuat tabel untuk Destinations, Hotels dan Bookings
```bash
  CREATE TABLE IF NOT EXISTS Destinations(
    ID_Destination INT AUTO_INCREMENT,
    Name VARCHAR(20),
    Country VARCHAR(20),
    Description VARCHAR(100),
    Rating INT,
    PRIMARY KEY(ID_Destination) 
);

CREATE TABLE IF NOT EXISTS Hotels(
    ID_Hotel INT AUTO_INCREMENT,
    Name VARCHAR(20),
    ID_Destination INT,
    Rating INT, 
    Address VARCHAR(255),
    PRIMARY KEY(ID_Hotel)
    FOREIGN KEY(ID_Destination) REFERENCES Destinations(ID_Destination)
);

CREATE TABLE IF NOT EXISTS Bookings(
    ID_Bookings INT AUTO_INCREMENT,
    Guest_Name VARCHAR(50),
    ID_Hotel INT,
    Check_In DATE,
    Check_Out DATE,
    PRIMARY KEY(ID_Bookings)
    FOREIGN KEY(ID_Hotel) REFERENCES Hotels(ID_Hotel)
);
```

### Menambahkan value Destinations, Hotels dan Bookings
```bash
INSERT INTO Destinations (Name, Country, Description, Rating) 
VALUES
	('Lombok','Indonesia','Pulau yang memiliki ragam wisata terkhusus dengan kekayaan alamnya yang mengagumkan, mulai dari wisata ekstrim seperti wisata Gunung Rinjani, hingga wisata halal yang terkenal religi seperti wisata masjid Islamic Center',4.8),
    ('Palawan','Filipina','Pulau yang memiliki hutan bakau, sungai, danau, serta air terjun yang indah',4.7),
    ('Santorini','Yunani','Pulau Santorini di Yunani dikenal sebagai salah satu pulau paling instagramable. Di sini bukan hanya sunset-nya yang menawan, tapi juga bangunan-bangunan putih yang berdiri di atas tebing',4.5);

INSERT INTO Hotels (Name, ID_Destination, Rating, Address) 
VALUES
	('Golden Palace Hotel Lombok', 1, 4.5, 'Jl. Sriwijaya No.38'),
    ('Lime Resort El Nido', 2, 4.6, 'Sitio Lugadia, Brgy. Corong Corong'),
    ('Nautilus Dome', 3, 4.3, 'Fira, Fira, 84700');

INSERT INTO Bookings (Guest_Name, ID_Hotel, Check_In, Check_Out) 
VALUES
	('Marcus Rashford', 1, '2023-09-01', '2023-09-03'),
    ('Andre Onana', 2, '2023-08-25', '2023-09-01'),
    ('Bruno Fernandes', 3, '2023-08-29', '2023-09-04');
```
## Data Retrieval

### A. Menampilkan semua Destinations yang tersimpan dalam database
```bash
  SELECT * FROM Destinations;
```

### B. Menampilkan semua Hotels yang tersimpan dalam database
```bash
  SELECT * FROM Hotels;
```
### C. Menampilkan semua Bookings yang tersimpan dalam database
```bash
  SELECT * FROM Bookings;
```
### D. Menampilkan hotel di destinasi tertentu berdasarkan user input
```bash
SELECT Hotels.name, Hotels.rating, Hotels.address
FROM Hotels
JOIN Destinations ON Hotels.ID_Destination = Destinations.ID_Destination
WHERE Destinations.name = 'Lombok';
```
### E. Menghitung dan menampilkan rating rata-rata hotel di destinasi tertentu
```bash
SELECT AVG(Hotels.rating) AS average_rating
FROM Hotels
JOIN Destinations ON Hotels.ID_Destination = Destinations.ID_Destination
WHERE Destinations.name = 'Santorini';
```
## Data Modification:
### Update the rating of a destination.
```bash
    UPDATE Destinations 
    SET Rating = 3
    WHERE name = 'Palawan';
```
### Update the address of a hotel.
```bash
    UPDATE Hotels 
    SET Address = 'Sitio Lugadia'
    WHERE ID_Destination = 2;
```
### Delete a booking record based on its ID.
```bash
    DELETE FROM Bookings
    WHERE ID_Hotel = 1;
```