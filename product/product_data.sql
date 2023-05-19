DROP TABLE IF EXISTS product_data;

CREATE TABLE product_data
(
	product_data_id INTEGER GENERATED ALWAYS AS IDENTITY,
  product_id INTEGER NOT NULL,
  product_form_id INTEGER NOT NULL,
  has_dispenser BOOLEAN,
  total_volume INTEGER,
  items_total INTEGER,
  item_volume REAL,
  measure_unit_id INTEGER,
  
	CONSTRAINT pk_product_data_product_data_id PRIMARY KEY (product_data_id),
  CONSTRAINT unq_product_data_product_id UNIQUE (product_id),
  CONSTRAINT chk_product_data_items_total CHECK (items_total >= 0),
  CONSTRAINT chk_product_data_item_volume CHECK (item_volume >= 0),
  CONSTRAINT chk_product_data_total_volume CHECK (total_volume >= 0),
  CONSTRAINT fk_product_data_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT fk_product_data_product_form_id_product_form_product_form_id FOREIGN KEY (product_form_id) REFERENCES product_form(product_form_id),
  CONSTRAINT fk_product_data_measure_unit_id_measure_unit_measure_unit_id FOREIGN KEY (measure_unit_id) REFERENCES measure_unit(measure_unit_id)
);

INSERT INTO product_data(product_id, product_form_id, has_dispenser, total_volume, items_total, item_volume, measure_unit_id)
     VALUES (1, 1, FALSE, NULL, 180, 355, 1), -- 1
            (2, 2, TRUE, NULL, 60, 400, 1), -- 2
            (3, 3, FALSE, 59, NULL, NULL, 2), -- 3
            (4, 3, FALSE, 118, NULL, NULL, 2), -- 4
            (5, 1, FALSE, NULL, 20, 1876, 1), -- 5
            (6, 1, FALSE, NULL, 100, 550, 1), -- 6
            (7, 4, FALSE, NULL, 30, 3750, 1), -- 7
            (8, 2, TRUE, NULL, 150, 520, 1), -- 8
            (9, 4, TRUE, NULL, 30, 7500, 1), -- 9
            (10, 1, FALSE, NULL, 120, 1200, 1), -- 10
            (11, 1, FALSE, NULL, 90, 1250, 1), -- 11
            (12, 3, FALSE, 458, NULL, NULL, 2), -- 12
            (13, 2, FALSE, NULL, 100, 519, 1), -- 13
            (14, 2, FALSE, NULL, 180, 260, 1), -- 14
            (15, 1, FALSE, NULL, 60, 1280, 1), -- 15
            (16, 1, FALSE, NULL, 60, 745, 1), -- 16
            (17, 2, FALSE, NULL, 100, 510, 1), -- 17
            (18, 1, FALSE, NULL, 60, 590, 1), -- 18
            (19, 2, FALSE, NULL, 100, 490, 1), -- 19
            (20, 2, FALSE, NULL, 60, 605, 1), -- 20
            (21, 1, FALSE, NULL, 180, 614, 1), -- 21
            (22, 2, TRUE, NULL, 100, 630, 1), -- 22
            (23, 2, TRUE, NULL, 170, 800, 1), -- 23
            (24, 1, TRUE, NULL, 50, 1046.5, 1), -- 24
            (25, 4, FALSE, 344000, 38, 9000, 1), -- 25
            (26, 2, FALSE, NULL, 100, 802, 1), -- 26
            (27, 2, FALSE, NULL, 60, 595, 1), -- 27
            (28, 2, FALSE, NULL, 90, 576, 1), -- 28
            (29, 2, FALSE, NULL, 150, 526, 1), -- 29
            (30, 1, FALSE, NULL, 90, 1170, 1), -- 30
            (31, 2, FALSE, NULL, 100, 525, 1), -- 31
            (32, 3, FALSE, 473, NULL, NULL, 2), -- 32
            (33, 4, FALSE, 564000, 28, 20000, 1), -- 33
            (34, 2, FALSE, NULL, 60, 585, 1), -- 34
            (35, 2, FALSE, NULL, 60, 1638, 1), -- 35
            (36, 1, TRUE, NULL, 150, 1385, 1), -- 36
            (37, 2, FALSE, NULL, 50, 500, 1), -- 37
            (38, 2, FALSE, NULL, 100, 590, 1), -- 38
            (39, 2, FALSE, NULL, 100, 440, 1), -- 39
            (40, 3, FALSE, 473, NULL, NULL, 2), -- 40
            (41, 1, FALSE, NULL, 60, 630, 1), -- 41
            (42, 2, FALSE, NULL, 90, 610, 1), -- 42
            (43, 2, TRUE, NULL, 100, 620, 1), -- 43
            (44, 2, FALSE, NULL, 100, 620, 1), -- 44
            (45, 2, FALSE, NULL, 100, 530, 1), -- 45
            (46, 2, FALSE, NULL, 180, 500, 1), -- 46
            (47, 1, FALSE, NULL, 60, 1204, 1), -- 47
            (48, 2, FALSE, NULL, 60, 695, 1), -- 48
            (49, 2, FALSE, NULL, 45, 584.3, 1), -- 49
            (50, 2, FALSE, NULL, 90, 600, 1), -- 50
            (51, 2, FALSE, NULL, 100, 500, 1), -- 51
            (52, 2, FALSE, NULL, 100, 490, 1), -- 52
            (53, 2, FALSE, NULL, 100, 650, 1), -- 53
            (54, 2, TRUE, NULL, 100, 685, 1), -- 54
            (55, 4, TRUE, 510000, 15, 34000, 1), -- 55
            (56, 4, FALSE, NULL, 30, 37700, 1), -- 56
            (57, 4, FALSE, 36000, 120, 300, 1), -- 57
            (58, 2, FALSE, NULL, 100, 570, 1), -- 58
            (59, 1, FALSE, NULL, 60, 1762, 1), -- 59
            (60, 1, FALSE, NULL, 60, 1165, 1), -- 60
            (61, 2, FALSE, NULL, 60, 600, 1), -- 61
            (62, 4, FALSE, 532000, 28, 19000, 1), -- 62
            (63, 2, FALSE, NULL, 100, 570, 1), -- 63
            (64, 1, FALSE, NULL, 120, 567.8, 1), -- 64
            (65, 2, FALSE, NULL, 100, 540, 1), -- 65
            (66, 1, FALSE, NULL, 96, 1350, 1), -- 66
            (67, 2, FALSE, NULL, 100, 585, 1), -- 67
            (68, 2, FALSE, NULL, 100, 545.6, 1), -- 68
            (69, 1, FALSE, NULL, 150, 1400, 1), -- 69
            (70, 2, FALSE, NULL, 100, 600, 1), -- 70
            (71, 2, FALSE, NULL, 90, 505, 1), -- 71
            (72, 2, FALSE, NULL, 100, 490, 1), -- 72
            (73, 2, FALSE, NULL, 60, 528, 1), -- 73
            (74, 2, FALSE, NULL, 100, 500, 1), -- 74
            (75, 3, FALSE, 475, NULL, NULL, 2), -- 75
            (76, 2, FALSE, NULL, 60, 630, 1), -- 76
            (77, 2, FALSE, NULL, 90, 620, 1), -- 77
            (78, 3, FALSE, 473, NULL, NULL, 2), -- 78
            (79, 2, FALSE, NULL, 60, 510, 1), -- 79
            (80, 4, FALSE, 75000, 50, 1500, 1), -- 80
            (81, 2, FALSE, NULL, 90, 678, 1), -- 81
            (82, 2, FALSE, NULL, 100, 520, 1), -- 82
            (83, 1, FALSE, NULL, 120, 600, 1), -- 83
            (84, 2, TRUE, NULL, 100, 525, 1), -- 84
            (85, 2, TRUE, NULL, 100, 534, 1), -- 85
            (86, 2, TRUE, NULL, 120, 625, 1), -- 86
            (87, 2, FALSE, NULL, 100, 500, 1), -- 87
            (88, 1, FALSE, NULL, 120, 644, 1), -- 88
            (89, 2, FALSE, NULL, 100, 525, 1), -- 89
            (90, 2, FALSE, NULL, 60, 585, 1), -- 90
            (91, 2, FALSE, NULL, 60, 657, 1), -- 91
            (92, 2, FALSE, NULL, 100, 495, 1), -- 92
            (93, 1, FALSE, NULL, 90, 627, 1), -- 93
            (94, 2, FALSE, NULL, 100, 560, 1), -- 94
            (95, 2, FALSE, NULL, 90, 585, 1), -- 95
            (96, 2, FALSE, NULL, 60, 570, 1), -- 96
            (97, 2, FALSE, NULL, 90, 608, 1), -- 97
            (98, 2, FALSE, NULL, 60, 540, 1), -- 98

            (99, 5, FALSE, 85000, NULL, NULL, 1), -- 99
            (100, 5, FALSE, 118.3, NULL, NULL, 2), -- 100
            (101, 3, TRUE, 15, NULL, NULL, 2), -- 101
            (102, 5, FALSE, 100000, NULL, NULL, 1), -- 102
            (103, 6, FALSE, 45000, NULL, NULL, 1), -- 103

            (104, 3, FALSE, 125, NULL, NULL, 2), -- 104
            (105, 5, FALSE, 50, NULL, NULL, 2), -- 105
            (106, 5, FALSE, 50, NULL, NULL, 2), -- 106
            (107, 5, FALSE, 15, NULL, NULL, 2), -- 107
            (108, 5, FALSE, 50, NULL, NULL, 2), -- 108
            (109, 5, FALSE, 15, NULL, NULL, 2), -- 109
            (110, 5, TRUE, 50, NULL, NULL, 2), -- 110
            (111, 5, FALSE, 200, NULL, NULL, 2), -- 111
            (112, 5, FALSE, 200, NULL, NULL, 2), -- 112
            (113, 5, FALSE, 200, NULL, NULL, 2), -- 113
            (114, 5, FALSE, 200, NULL, NULL, 2), -- 114
            (115, 5, FALSE, 200, NULL, NULL, 2), -- 115
            (116, 3, FALSE, 200, NULL, NULL, 2), -- 116
            (117, 3, TRUE, 50, NULL, NULL, 2), -- 117
            (118, 3, FALSE, 125, NULL, NULL, 2), -- 118
            (119, 5, FALSE, 250, NULL, NULL, 2), -- 119
            (120, 5, FALSE, 50, NULL, NULL, 2), -- 120
            (121, 3, FALSE, 30, NULL, NULL, 2), -- 121

            (122, 5, FALSE, 125, NULL, NULL, 2), -- 122
            (123, 5, FALSE, 126, NULL, NULL, 2), -- 123
            (124, 5, TRUE, 127, NULL, NULL, 2), -- 124
            (125, 8, FALSE, 59, NULL, NULL, 2), -- 125
            (126, 5, FALSE, 127, NULL, NULL, 2), -- 126
            (127, 5, TRUE, 118.3, NULL, NULL, 2), -- 127
            (128, 3, FALSE, 226, NULL, NULL, 2), -- 128

            (129, 10, FALSE, 251, NULL, NULL, 2), -- 129
            (130, 10, FALSE, 251, NULL, NULL, 2), -- 130
            (131, 7, FALSE, 32000, NULL, NULL, 1), -- 131
            (132, 7, FALSE, 32000, NULL, NULL, 1), -- 132
            (133, 10, FALSE, 32000, NULL, NULL, 1), -- 133
            (134, 10, FALSE, 32000, NULL, NULL, 1), -- 134
            (135, 7, FALSE, 54, NULL, NULL, 1), -- 135

            (136, 9, FALSE, NULL, 235, 1, 3), -- 136
            (137, 9, FALSE, NULL, 3, 1, 3), -- 137
            (138, 9, FALSE, NULL, 156, 1, 3), -- 138
            (139, 9, FALSE, NULL, 264, 1, 3), -- 139
            (140, 9, FALSE, NULL, 15, 1, 3), -- 140
            (141, 9, FALSE, NULL, 459, 1, 3), -- 141
            (142, 9, TRUE, NULL, 457, 1, 3), -- 142
            (143, 9, TRUE, NULL, 159, 1, 3), -- 143
            (144, 9, FALSE, NULL, 89, 1, 3), -- 144
            (145, 9, FALSE, NULL, 16, 1, 3), -- 145
            (146, 9, FALSE, NULL, 312, 1, 3), -- 146
            (147, 9, FALSE, NULL, 275, 1, 3), -- 147
            (148, 9, FALSE, NULL, 562, 1, 3), -- 148
            (149, 9, FALSE, NULL, 187, 1, 3), -- 149
            (150, 9, FALSE, NULL, 7, 1, 3), -- 150
            (151, 9, FALSE, NULL, 65, 1, 3), -- 151
            (152, 9, FALSE, NULL, 198, 1, 3), -- 152
            (153, 9, FALSE, NULL, 230, 1, 3), -- 153
            (154, 9, FALSE, NULL, 572, 1, 3), -- 154
            (155, 9, FALSE, NULL, 920, 1, 3), -- 155
            (156, 9, FALSE, NULL, 567, 1, 3), -- 156
            (157, 9, FALSE, NULL, 402, 1, 3), -- 157
            (158, 9, FALSE, NULL, 12, 1, 3), -- 158
            (159, 9, FALSE, NULL, 139, 1, 3), -- 159
            (160, 9, FALSE, NULL, 187, 1, 3), -- 160
            (161, 9, TRUE, NULL, 236, 1, 3), -- 161
            (162, 9, TRUE, NULL, 451, 1, 3), -- 162
            (163, 9, FALSE, NULL, 12, 1, 3), -- 163
            (164, 9, FALSE, NULL, 12, 1, 3), -- 164
            (165, 9, FALSE, NULL, 46, 1, 3), -- 165
            (166, 9, FALSE, NULL, 59, 1, 3), -- 166
            (167, 9, TRUE, NULL, 157, 1, 3), -- 167
            (168, 9, FALSE, NULL, 194, 1, 3), -- 168
            (169, 9, FALSE, NULL, 241, 1, 3), -- 169
            (170, 9, FALSE, NULL, 351, 1, 3), -- 170
            (171, 9, FALSE, NULL, 684, 1, 3), -- 171
            (172, 9, FALSE, NULL, 152, 1, 3), -- 172
            (173, 9, FALSE, NULL, 462, 1, 3), -- 173
            (174, 9, FALSE, NULL, 137, 1, 3), -- 174
            (175, 9, FALSE, NULL, 156, 1, 3), -- 175
            
            (176, 10, TRUE, NULL, NULL, NULL, NULL), -- 176
            (177, 10, FALSE, NULL, NULL, NULL, NULL); -- 177

SELECT *
  FROM product_data;