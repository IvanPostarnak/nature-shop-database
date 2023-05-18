DROP TABLE IF EXISTS product;

CREATE TABLE product
(
	product_id INTEGER GENERATED ALWAYS AS IDENTITY,
  outer_id TEXT NOT NULL,
  name TEXT NOT NULL,
  company_id INTEGER NOT NULL,
  brand_id INTEGER NOT NULL,
  
	CONSTRAINT pk_product_product_id PRIMARY KEY (product_id),
  CONSTRAINT unq_product_outer_id_name_company_id UNIQUE (outer_id, name, company_id),
  CONSTRAINT chk_product_outer_id CHECK (outer_id != ''),
  CONSTRAINT chk_product_name CHECK (name != ''),
  CONSTRAINT fk_product_company_id_company_company_id FOREIGN KEY (company_id) REFERENCES company(company_id)
);

INSERT INTO product(name, outer_id, company_id, brand_id)
     VALUES ('Vitamin D3', 'RU22485', 1, 4), -- 1
            ('Co Q10 – 100 mg', 'RU4135', 1, 4), -- 2
            ('Lymphatic Drainage', 'RU3171', 1, 4), -- 3
            ('Colloidal Silver Forte', 'RU6274', 1, 4), -- 4
            ('Fizz Active', 'RU3044', 1, 4), -- 5
            ('Bee Pollen', 'RU70', 1, 4), -- 6
            ('Solstic Slim', 'RU6502', 1, 4), -- 7
            ('Astragalus', 'RU22751', 1, 4), -- 8
            ('Solstic Revive', 'RU6507', 1, 4), -- 9
            ('Herbasaurs Chewable Vitamins Plus Iron', 'RU1622', 1, 4), -- 10
            ('Bifidophilus Chewable for Kids «Bifidosaurs»', 'RU3302', 1, 4), -- 11
            ('Zаmbroza', 'RU4104', 1, 4), -- 12
            ('Wild Yam', 'RU746', 1, 4), -- 13
            ('Vitamin E', 'RU1650', 1, 4), -- 14
            ('Vitamin C', 'RU1635', 1, 4), -- 15
            ('HP Garlic', 'RU292', 1, 4), -- 16
            ('HSN-W (Hair, Skin, Nails)', 'RU935', 1, 4), -- 17
            ('5-HTP-Power', 'RU3088', 1, 4), -- 18
            ('HVP', 'RU940', 1, 4), -- 19
            ('Indole-3-Carbinol', 'RU1506', 1, 4), -- 20
            ('Iron Chelate', 'RU1784', 1, 4), -- 21
            ('Kelp', 'RU410', 1, 4), -- 22
            ('Lecithin', 'RU1661', 1, 4), -- 23
            ('Liv-Guard', 'RU4015', 1, 4), -- 24
            ('Loclo', 'RU1346', 1, 4), -- 25
            ('Magnesium Complex', 'RU1859', 1, 4), -- 26
            ('Milk Thistle', 'RU4112', 1, 4), -- 27
            ('Mind-Max', 'RU3134', 1, 4), -- 28
            ('Mоrinda', 'RU22752', 1, 4), -- 29
            ('MSM', 'RU4059', 1, 4), -- 30
            ('Nature Lax', 'RU984', 1, 4), -- 31
            ('Nature''s Noni Juice', 'RU4066', 1, 4), -- 32
            ('Nutri Burn', 'RU3213', 1, 4), -- 33
            ('Olive leaf', 'RU204', 1, 4), -- 34
            ('Omega 3 EPA', 'RU1609', 1, 4), -- 35
            ('Osteo Plus', 'RU1806', 1, 4), -- 36
            ('Achieve with Yohimbe', 'RU1118', 1, 4), -- 37
            ('AG-X', 'RU1197', 1, 4), -- 38
            ('Alfalfa', 'RU30', 1, 4), -- 39
            ('Aloe Vera Juice', 'RU4186', 1, 4), -- 40
            ('Antioxidant', 'RU1825', 1, 4), -- 41
            ('Bifidophilus Flora Force', 'RU4100', 1, 4), -- 42
            ('Black Walnut', 'RU90', 1, 4), -- 43
            ('Pau D''Arco', 'RU514', 1, 4), -- 44
            ('Bon-C', 'RU1548', 1, 4), -- 45
            ('Paw Paw Cell Reg', 'RU515', 1, 4), -- 46
            ('Peptovit with Magnesium & L-Carnitine', 'RU3664', 1, 4), -- 47
            ('Perfect Eyes', 'RU60038', 1, 4), -- 48
            ('Pro Formula', 'RU60021', 1, 4), -- 49
            ('Protease Plus', 'RU1841', 1, 4), -- 50
            ('Boswellia Plus', 'RU1295', 1, 4), -- 51
            ('Red Сlover', 'RU550', 1, 4), -- 52
            ('Saw Palmetto', 'RU630', 1, 4), -- 53
            ('Shark Rei Formula', 'RU1602', 1, 4), -- 54
            ('Smart Meal Vanilla Shake', 'RU22892', 1, 4), -- 55
            ('Solstic Energy', 'RU6500', 1, 4), -- 56
            ('Stevia', 'RU1386', 1, 4), -- 57
            ('BP-C', 'RU1881', 1, 4), -- 58
            ('Stomach Comfort', 'RU1820', 1, 4), -- 59
            ('Super Complex', 'RU4052', 1, 4), -- 60
            ('Breast Assured', 'RU1122', 1, 4), -- 61
            ('TNT - Total Nutrition Today', 'RU4300', 1, 4), -- 62
            ('Una de Gato', 'RU175', 1, 4), -- 63
            ('Uro Lax', 'RU1150', 1, 4), -- 64
            ('Breath Ease', 'RU775', 1, 4), -- 65
            ('Zinc Lozenges', 'RU1596', 1, 4), -- 66
            ('Bupleurum Plus', 'RU1860', 1, 4), -- 67
            ('Burdock', 'RU140', 1, 4), -- 68
            ('Calcium Magnesium Chelate', 'RU3243', 1, 4), -- 69
            ('Capsicum & Garlic with Parsley', 'RU832', 1, 4), -- 70
            ('Caprylic Combination', 'RU1808', 1, 4), -- 71
            ('Cascara Sagrada', 'RU170', 1, 4), -- 72
            ('Carbo Grabbers', 'RU2954', 1, 4), -- 73
            ('CC-A', 'RU896', 1, 4), -- 74
            ('Liquid Chlorophyll', 'RU1580', 1, 4), -- 75
            ('Chondroitin', 'RU1811', 1, 4), -- 76
            ('Chromium Chelate', 'RU1894', 1, 4), -- 77
            ('Colloidal Minerals with Acai Juice', 'RU312', 1, 4), -- 78
            ('Colostrum', 'RU1587', 1, 4), -- 79
            ('Coral Calcium', 'RU1873', 1, 4), -- 80
            ('Cordyceps', 'RU1240', 1, 4), -- 81
            ('C-X', 'RU1204', 1, 4), -- 82
            ('Defense Maintenance', 'RU6154', 1, 4), -- 83
            ('Eight', 'RU850', 1, 4), -- 84
            ('E-tea', 'RU1360', 1, 4), -- 85
            ('Fat grabbers', 'RU2937', 1, 4), -- 86
            ('FC with Dong Quai', 'RU882', 1, 4), -- 87
            ('Food Enzymes', 'RU1836', 1, 4), -- 88
            ('Garcinia Combination', 'RU906', 1, 4), -- 89
            ('Ginkgo Gotu Kola', 'RU907', 1, 4), -- 90
            ('Glucosamine', 'RU903', 1, 4), -- 91
            ('Gotu Kola', 'RU360', 1, 4), -- 92
            ('Grapine with Protectors', 'RU1750', 1, 4), -- 93
            ('Hawthorn Plus', 'RU930', 1, 4), -- 94
            ('Hista Block', 'RU776', 1, 4), -- 95
            ('HP Fighter', 'RU917', 1, 4), -- 96
            ('Vari-Gone', 'RU999', 1, 4), -- 97
            ('L-carnitine', 'RU23065', 1, 4), -- 98

            ('Silver shield', 'RU4950', 1, 9), -- 99
            ('Tei-Fu', 'RU3538', 1, 9), -- 100
            ('Tea Tree Oil', 'RU3877', 1, 9), -- 101
            ('Sunshine Brite with green tea leaf extract', 'RU2851', 1, 9), -- 102
            ('Lip Balm SPF15 “Natural Care”', 'RU6036', 1, 9), -- 103

            ('Purifying and Mattifying Toner', 'RU21600', 1, 2), -- 104
            ('Day Anti-age Face Cream SPF 15 40+', 'RU21601', 1, 2), -- 105
            ('Night Anti-age Face Cream 40+', 'RU21602', 1, 2), -- 106
            ('Anti-age Eye Contour Cream SPF 15', 'RU21603', 1, 2), -- 107
            ('Moisturizing Face Cream. Intensive Hydration 48 Hours. SPF 15', 'RU21604', 1, 2), -- 108
            ('Revitalizing Eye Contour Cream SPF 15', 'RU21605', 1, 2), -- 109
            ('Radiance Face Mask Cinderella Effect', 'RU21606', 1, 2), -- 110
            ('Energy Shampoo (orange)', 'RU21610', 1, 2), -- 111
            ('Energy Conditioner (orange)', 'RU21611', 1, 2), -- 112
            ('Makeover Shampoo (yellow)', 'RU21612', 1, 2), -- 113
            ('Makeover Conditioner (yellow)', 'RU21613', 1, 2), -- 114
            ('Magnolia Charm Shower Gel', 'RU21614', 1, 2), -- 115
            ('Magnolia Charm Body Lotion', 'RU21615', 1, 2), -- 116
            ('Wow-Serum with Chestnut Extract. Anti-age and Lifting', 'RU21616', 1, 2), -- 117
            ('Cleansing Micellar Gel Blooming Skin', 'RU21617', 1, 2), -- 118
            ('Hair Body Baby Wash «Oh, my Baby!»', 'RU21618', 1, 2), -- 119
            ('Age Control Day Cream', 'RU21619', 1, 2), -- 120
            ('Age Control Serum', 'RU21620', 1, 2), -- 121

            ('Light Apricot Cleanser Apri-Cleanse', 'RU61563', 1, 3), -- 122
            ('Conditioning Сream with Сocoa Butter', 'RU61555', 1, 3), -- 123
            ('Relaxing TT Oil', 'RU61564', 1, 3), -- 124
            ('Sea Salt Roll-On Antiperspirant/Deodorant', 'RU61566', 1, 3), -- 125
            ('Witch-Vera Gel', 'RU61565', 1, 3), -- 126
            ('Cool Comfort Aftershave Gel', 'RU61567', 1, 3), -- 127
            ('Almond-Apricot Anti Stress Moisturizing Lotion', 'RU61560', 1, 3), -- 128

            ('Lip Gloss Crystal Gel Volume & Shimmering', 'RU21514', 1, 1), --129
            ('Lip Gloss Crystal Gel Volume & Shimmering', 'RU21515', 1, 1), --130
            ('Powder Luxury Brow Pencil 1', 'RU61800', 1, 1), -- 131
            ('Powder Luxury Brow Pencil 2', 'RU61801', 1, 1), -- 132
            ('Compact Powder Biscuit', 'RU62203', 1, 1), -- 133
            ('Blush Bronzers Hazelnut', 'RU62105', 1, 1), -- 134
            ('Lip Pencil Magic Stick', 'RU61854', 1, 1), -- 135

            ('Booklet Vitamin D3', 'd001', 1, 6), -- 136
            ('Brochure Black Walnut', 'd002', 1, 6), -- 137
            ('Unique Benefits of Nature''s Sunshine Products', 'd003', 1, 6), -- 138
            ('Wellness technologies from the company NSP', 'd004', 1, 6), -- 139
            ('The secret of health and harmony Anna Kotelnikova, Andrey Yashkov', 'd005', 1, 6), -- 140
            ('Booklets describing wellness programs', 'd006', 1, 6), -- 141
            ('Booklet "Wow-serum"', 'd007', 1, 6), -- 142
            ('Booklets describing dietary supplements NSP', 'd008', 1, 6), -- 143
            ('Brochure "Recommended schemes for the purpose of NSP products"', 'd009', 1, 6), -- 144
            ('Catalog of dietary supplements and cosmetics', 'd010', 1, 6), -- 145
            ('Collection of articles "Healthy nutrition for healthy longevity"', 'd011', 1, 6), -- 146
            ('Analytical test for the selection of biologically active additives', 'd012', 1, 6), -- 147
            ('Brochure "Your 85% success rate"', 'd013', 1, 6), -- 148
            ('Brochure "Super complexes for every day"', 'd014', 1, 6), -- 149
            ('Booklet "Ecology of your body"', 'd015', 1, 6), -- 150
            ('The book "Human Biorhythms and prevention of seasonal diseases"', 'd016', 1, 6), -- 151
            ('Brochure "Chinese Cordyceps, or Mushroom for Emperors"', 'd017', 1, 6), -- 152
            ('MSM: sulfur is our companion on the way to health', 'd018', 1, 6), -- 153
            ('Methodological recommendations for doctors issue 10', 'd019', 1, 6), -- 154
            ('Methodological recommendations for doctors issue 9 "Application of dietary supplements in dentistry"', 'd020', 1, 6), -- 155
            ('Methodological recommendations for doctors issue 8 "Reprod.men''s health. Prostate diseases"', 'd021', 1, 6), -- 156
            ('Methodical recommendations for doctors issue 7 "Complex treatment and rehabilitation. Patients with skin diseases"', 'd022', 1, 6), -- 157
            ('Methodical recommendations for doctors issue 7 "Complex treatment and rehabilitation. Patients with skin diseases"', 'd023', 1, 6), -- 158
            ('Methodical recommendations for doctors issue 6 "Application of dietary supplements of the NSP company in the practice of a district doctor', 'd024', 1, 6), -- 159
            ('Methodological recommendations for doctors issue 5 "Gynecology. Fibroids, mastopathy"', 'd025', 1, 6), -- 160
            ('Methodological recommendations for doctors issue 1 "Osteoarthritis"', 'd026', 1, 6), -- 161
            ('Brochure "Tea Tree oil"', 'd027', 1, 6), -- 162
            ('Brochure "Fundamentals of nutrition" Part 7 (lipid metabolism disorders)', 'd028', 1, 6), -- 163
            ('Brochure "Fundamentals of nutritionology" Part 6', 'd029', 1, 6), -- 164
            ('Brochure "Fundamentals of nutrition" Part 5', 'd030', 1, 6), -- 165
            ('Brochure "Fundamentals of nutrition" Part 4', 'd031', 1, 6), -- 166
            ('PH Balance Brochure', 'd032', 1, 6), -- 167
            ('Brochure "Clinical studies of dietary supplements of NSP company" book 2', 'd033', 1, 6), -- 168
            ('Brochure "The effectiveness of the use of dietary supplements of the company NSP" (clinical studies)', 'd034', 1, 6), -- 169
            ('NSP catalog "From A to Z"', 'd035', 1, 6), -- 170
            ('Collection of articles "Experience of clinical application of dietary supplements of NSP company" issue 2', 'd036', 1, 6), -- 171
            ('Collection of articles "Experience of clinical application of dietary supplements of NSP company" issue 1', 'd037', 1, 6), -- 172
            ('The world of medicinal plants NSP', 'd038', 1, 6), -- 173
            ('Methodical recommendations for doctors issue 14. "Urolithiasis"', 'd039', 1, 6), -- 174
            ('Brochure Red Clover', 'd040', 1, 1), -- 175
            
            ('Printed T-shirt', 'e1238874', 2, 8), -- 176
            ('Tablet organizer with the NSP logo', 'e1238875', 2, 7); -- 177

SELECT *
  FROM product;