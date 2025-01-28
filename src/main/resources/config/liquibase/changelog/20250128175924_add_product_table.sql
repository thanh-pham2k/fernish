DROP TABLE IF EXISTS category;

DROP TABLE IF EXISTS product;

-- Table: category
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table: product
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_to_buy NUMERIC(10, 2) NOT NULL,
    price_per_month NUMERIC(10, 2) NOT NULL,
    availability VARCHAR(50) CHECK (
        availability IN ('INSTOCK', 'LIMITED', 'OUTOFSTOCK')
    ) NOT NULL,
    category_id INT REFERENCES category(id) ON DELETE CASCADE,
    color VARCHAR(50),
    material VARCHAR(255),
    size VARCHAR(50),
    images TEXT []
);

-- Insert sample data into category
INSERT INTO
    category (name)
VALUES
    ('Living Room'),
    ('Dining Room'),
    ('Bedroom'),
    ('Office');

-- Insert sample data into product
INSERT INTO
    product (
        name,
        description,
        price_to_buy,
        price_per_month,
        availability,
        category_id,
        color,
        material,
        size,
        images
    )
VALUES
    (
        'Remy Reversible Sectional, Beige',
        'A versatile sectional sofa with reversible design and comfortable cushions.',
        3599.00,
        152.00,
        'INSTOCK',
        1,
        'Beige',
        'Fabric',
        'Large',
        ARRAY ['https://example.com/images/remy-beige-1.jpg',
'https://example.com/images/remy-beige-2.jpg']
    ),
    (
        'Shawna Dining Chair',
        'A stylish and ergonomic dining chair, perfect for any dining room.',
        599.00,
        26.00,
        'INSTOCK',
        2,
        'Black',
        'Wood',
        'Medium',
        ARRAY ['https://example.com/images/shawna-chair-1.jpg']
    ),
    (
        'Marcel Bed, Oak, Queen',
        'A sturdy and elegant queen-sized bed made from oak wood.',
        1599.00,
        68.00,
        'LIMITED',
        3,
        'Oak',
        'Wood',
        'Queen',
        ARRAY ['https://example.com/images/marcel-bed-1.jpg',
'https://example.com/images/marcel-bed-2.jpg']
    ),
    (
        'Chloe Platform Bed, Queen',
        'A modern queen platform bed with sleek design and durable materials.',
        1199.00,
        51.00,
        'INSTOCK',
        3,
        'Gray',
        'Metal',
        'Queen',
        ARRAY ['https://example.com/images/chloe-bed-1.jpg']
    ),
    (
        'Hudson Dining Chair, Gray Walnut',
        'A contemporary dining chair with gray walnut finish.',
        599.00,
        26.00,
        'OUTOFSTOCK',
        2,
        'Gray Walnut',
        'Wood',
        'Medium',
        ARRAY ['https://example.com/images/hudson-chair-1.jpg']
    ),
    (
        'Colton Occasional Chair',
        'A premium occasional chair with plush cushions and solid build.',
        1099.00,
        47.00,
        'LIMITED',
        1,
        'Blue',
        'Leather',
        'Large',
        ARRAY ['https://example.com/images/colton-chair-1.jpg']
    );