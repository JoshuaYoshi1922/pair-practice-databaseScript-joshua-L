START TRANSACTION;
-- Drop existing tables
DROP TABLE IF EXISTS ticket_sales, bookings, venues, full_event;

-- create venues
CREATE TABLE venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
-- Create ticket_sales
CREATE TABLE ticket_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    number_sold INT NOT NULL,
    venue_id int NOT NULL,
    event_date timestamp not null,
    foreign key (venue_id) references venues(venue_id)
);
-- create bookings
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name varchar(40) NOT NULL,
	last_name varchar(40) NOT NULL,
    venue_id int NOT NULL,
	event_type varchar(40) not null,
    foreign key (venue_id) references venues(venue_id)
);
create table full_event (
	event_id int auto_increment primary key,
    title varchar(100) not null,
    venue_id int NOT NULL,
    booking_id int not null,
    sale_id int,
    event_type varchar(40) not null,
    event_organizer varchar(80) not null,
    foreign key (venue_id) references venues (venue_id),
    foreign key (booking_id) references bookings (booking_id),
    foreign key (sale_id) references ticket_sales (sale_id)
);
-- insert test data
-- venues
INSERT INTO venues (name) VALUES
('The Hall of Grand'),
('The Room'),
('The Other Room'),
('Play Room');

-- bookings
INSERT INTO bookings (first_name, last_name, venue_id, event_type) VALUES
('Ash', 'Ketchum', 1, 'Game Expo'),
('Philip', 'Philips', 2, 'Wedding'),
('Mike', 'Scott', 3, 'Concert'),
('Tessa', 'Johnson', 4, 'Yoga');

-- ticket sales
INSERT INTO ticket_sales (venue_id, event_date, number_sold) VALUES
(1, '2025-09-10 09:00:00', 100),
(2, '2025-09-15 19:00:00', 900),
(3, '2025-09-20 14:00:00', 200),
(4, '2025-09-25 10:00:00', 320);


-- full events
INSERT INTO full_event (title, venue_id, booking_id, sale_id, event_type, event_organizer) VALUES
('Gaming Con 2025', 1, 1, 1, 'Game Expo', 'Ash Ketchum'),
('The Wedding Day', 2, 2, 2, 'Wedding', 'Philip Philips'),
('Batman Live in Conceret', 3, 3, 3, 'Concert', 'Mike Scott'),
('Hot Yoga', 4, 4, 4, 'Yoga', 'Tessa Johnson');

-- Commit
commit;
