-- Catégories
INSERT INTO categories (name, description, image_url)
VALUES 
('Informatique', 'Ordinateurs, périphériques et accessoires', 'cat_informatique.jpg'),
('Téléphonie', 'Smartphones et accessoires', 'cat_telephonie.jpg'),
('Maison', 'Meubles et décoration', 'cat_maison.jpg'),
('Mode', 'Vêtements et chaussures', 'cat_mode.jpg'),
('Sport', 'Équipements et vêtements de sport', 'cat_sport.jpg');

-- Produits (25)
INSERT INTO products (category_id, name, description, price, stock, image_url, is_active)
VALUES
(1, 'Ordinateur Portable HP', 'HP Pavilion 15 pouces', 750.00, 10, 'hp_laptop.jpg', TRUE),
(1, 'Souris Logitech', 'Souris sans fil', 25.50, 50, 'logitech_mouse.jpg', TRUE),
(1, 'Clavier mécanique', 'Clavier RGB', 80.00, 30, 'keyboard.jpg', TRUE),
(1, 'Écran 24 pouces', 'Écran Full HD', 150.00, 20, 'screen24.jpg', TRUE),
(1, 'Disque SSD 1TB', 'Stockage rapide', 120.00, 15, 'ssd1tb.jpg', TRUE),
(2, 'iPhone 15', 'Apple iPhone 15', 1200.00, 8, 'iphone15.jpg', TRUE),
(2, 'Samsung Galaxy S23', 'Samsung S23', 999.00, 10, 'galaxy_s23.jpg', TRUE),
(2, 'Chargeur rapide', 'Chargeur USB-C', 20.00, 100, 'charger.jpg', TRUE),
(2, 'Écouteurs Bluetooth', 'Écouteurs sans fil', 60.00, 25, 'earbuds.jpg', TRUE),
(2, 'Coque iPhone', 'Coque silicone', 15.00, 50, 'case_iphone.jpg', TRUE),
(3, 'Canapé 3 places', 'Confortable', 500.00, 5, 'sofa.jpg', TRUE),
(3, 'Table à manger', 'Pour 6 personnes', 300.00, 7, 'table.jpg', TRUE),
(3, 'Chaise design', 'Chaise moderne', 70.00, 20, 'chair.jpg', TRUE),
(3, 'Lampe de bureau', 'LED réglable', 40.00, 15, 'lamp.jpg', TRUE),
(3, 'Tapis salon', 'Tapis doux', 80.00, 10, 'tapis.jpg', TRUE),
(4, 'T-shirt homme', 'Coton 100%', 25.00, 30, 'tshirt.jpg', TRUE),
(4, 'Jean femme', 'Denim bleu', 50.00, 25, 'jean.jpg', TRUE),
(4, 'Baskets', 'Chaussures confortables', 70.00, 20, 'sneakers.jpg', TRUE),
(4, 'Robe femme', 'Robe élégante', 80.00, 15, 'robe.jpg', TRUE),
(4, 'Veste homme', 'Veste légère', 60.00, 10, 'jacket.jpg', TRUE),
(5, 'Ballon de football', 'Taille 5', 30.00, 20, 'ball.jpg', TRUE),
(5, 'Chaussures running', 'Pour la course', 90.00, 15, 'running_shoes.jpg', TRUE),
(5, 'T-shirt sport', 'Respirant', 20.00, 25, 'sport_tshirt.jpg', TRUE),
(5, 'Short sport', 'Short léger', 15.00, 30, 'sport_short.jpg', TRUE),
(5, 'Sac de sport', 'Pour le gym', 40.00, 10, 'gym_bag.jpg', TRUE);

-- Clients (5)
INSERT INTO customers (first_name, last_name, email, password_hash, phone, address, city, postal_code)
VALUES
('Alice', 'Dupont', 'alice@example.com', 'passwordhash1', '0600000001', '10 rue de Paris', 'Paris', '75001'),
('Bob', 'Martin', 'bob@example.com', 'passwordhash2', '0600000002', '20 rue Lyon', 'Lyon', '69001'),
('Claire', 'Durand', 'claire@example.com', 'passwordhash3', '0600000003', '30 rue Marseille', 'Marseille', '13001'),
('David', 'Lemoine', 'david@example.com', 'passwordhash4', '0600000004', '40 rue Lille', 'Lille', '59000'),
('Eva', 'Moreau', 'eva@example.com', 'passwordhash5', '0600000005', '50 rue Bordeaux', 'Bordeaux', '33000');

-- Administrateurs (2)
INSERT INTO admins (username, email, password_hash, role)
VALUES
('admin1', 'admin1@example.com', 'passhash1', 'admin'),
('superadmin', 'superadmin@example.com', 'passhash2', 'super_admin');

-- Commandes (10)
INSERT INTO orders (order_number, customer_id, status, total_amount, shipping_address, shipping_city, shipping_postal_code)
VALUES
('ORD001', 1, 'pending', 1050.00, '10 rue de Paris', 'Paris', '75001'),
('ORD002', 2, 'paid', 60.00, '20 rue Lyon', 'Lyon', '69001'),
('ORD003', 3, 'shipped', 200.00, '30 rue Marseille', 'Marseille', '13001'),
('ORD004', 4, 'delivered', 150.00, '40 rue Lille', 'Lille', '59000'),
('ORD005', 5, 'cancelled', 90.00, '50 rue Bordeaux', 'Bordeaux', '33000'),
('ORD006', 1, 'paid', 750.00, '10 rue de Paris', 'Paris', '75001'),
('ORD007', 2, 'pending', 45.00, '20 rue Lyon', 'Lyon', '69001'),
('ORD008', 3, 'shipped', 120.00, '30 rue Marseille', 'Marseille', '13001'),
('ORD009', 4, 'delivered', 200.00, '40 rue Lille', 'Lille', '59000'),
('ORD010', 5, 'paid', 350.00, '50 rue Bordeaux', 'Bordeaux', '33000');

-- Lignes de commande (OrderLine)
INSERT INTO order_lines (order_id, product_id, product_name, unit_price, quantity, line_total)
VALUES
(1, 1, 'Ordinateur Portable HP', 750.00, 1, 750.00),
(1, 2, 'Souris Logitech', 25.50, 2, 51.00),
(1, 3, 'Clavier mécanique', 80.00, 3, 240.00),
(2, 9, 'Écouteurs Bluetooth', 60.00, 1, 60.00),
(3, 11, 'Canapé 3 places', 500.00, 1, 500.00),
(3, 12, 'Table à manger', 300.00, 1, 300.00),
(4, 16, 'T-shirt homme', 25.00, 2, 50.00),
(4, 17, 'Jean femme', 50.00, 2, 100.00),
(5, 21, 'Ballon de football', 30.00, 3, 90.00),
(6, 1, 'Ordinateur Portable HP', 750.00, 1, 750.00),
(7, 8, 'Chargeur rapide', 20.00, 2, 40.00),
(8, 14, 'Lampe de bureau', 40.00, 3, 120.00),
(9, 11, 'Canapé 3 places', 500.00, 1, 500.00),
(9, 13, 'Chaise design', 70.00, 1, 70.00),
(10, 12, 'Table à manger', 300.00, 1, 300.00),
(10, 18, 'Baskets', 70.00, 1, 70.00);
