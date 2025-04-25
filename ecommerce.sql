CREATE  Database Ecommerce;

-- -- Use the bookstore database.
USE Ecommerce;

-- Brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

INSERT INTO brand (brand_name) VALUES
('Nike'),
('Apple'),
('Samsung');


-- Product Category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

INSERT INTO product_category (category_name) VALUES
('Clothing'),
('Electronics'),
('Footwear');

-- Product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

INSERT INTO product (product_name, brand_id, category_id, base_price) VALUES
('Air Max 270', 1, 3, 1500.00),
('iPhone 14', 2, 2, 12000.00),
('Galaxy S22', 3, 2, 15000.00);


-- Product Image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO product_image (product_id, image_url) VALUES
(1, 'https://www.nike.com/za/t/air-max-270-shoes-nnTrqDGR.jpg'),
(2, 'https://images.app.goo.gl/XvFBGGfJ7YnvsVMS7.jpg'),
(3, 'https://images.app.goo.gl/dep814jjFEbGPywU6.jpg');

-- Color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);

INSERT INTO color (color_name, hex_code) VALUES
('Black', '#000000'),
('White', '#FFFFFF'),
('Blue', '#0000FF');

-- Size Category table
CREATE TABLE size_category (
    size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_name VARCHAR(100) NOT NULL
);

INSERT INTO size_category (size_cat_name) VALUES
('Shoe Sizes'),
('Clothing Sizes');

-- Size Option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_id INT,
    size_value VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

INSERT INTO size_option (size_cat_id, size_value) VALUES
(1, '42'),
(1, '43'),
(2, 'M'),
(2, 'L');

-- Product Variation table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, NULL),
(3, 1, NULL);

-- Product Item table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    sku VARCHAR(50) NOT NULL UNIQUE,
    stock_qty INT DEFAULT 0,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

INSERT INTO product_item (variation_id, sku, stock_qty, price) VALUES
(1, 'NIKE-AM270-BL42', 50, 150.00),
(2, 'NIKE-AM270-WH43', 30, 150.00),
(3, 'APL-IP14-BLUE', 25, 999.99),
(4, 'SAM-GS22-BLK', 40, 899.99);

-- Attribute Category table
CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_cat_name VARCHAR(100) NOT NULL
);

INSERT INTO attribute_category (attr_cat_name) VALUES
('Physical'),
('Technical');

-- Attribute Type table
CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_type_name VARCHAR(50) NOT NULL
);

INSERT INTO attribute_type (attr_type_name) VALUES
('text'),
('number'),
('boolean');

-- Product Attribute table
CREATE TABLE product_attribute (
    product_attr_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    attr_name VARCHAR(100) NOT NULL,
    attr_value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);

INSERT INTO product_attribute (product_id, attr_cat_id, attr_type_id, attr_name, attr_value) VALUES
(1, 1, 2, 'Weight (g)', '250'),
(2, 2, 1, 'Operating System', 'iOS 17'),
(3, 2, 1, 'Operating System', 'Android 13');

