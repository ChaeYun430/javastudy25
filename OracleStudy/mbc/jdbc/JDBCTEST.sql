--캠핑카 대여회사
CREATE TABLE C_CAR_RENT_COMP (
       c_car_rent_comp_id   varchar2(10) NOT NULL,
       c_comp_name          varchar2(25) NOT NULL,
       c_comp_addr          varchar2(100) NOT NULL,
       c_comp_phone         varchar2(15) NOT NULL,
       c_comp_admin_name    varchar2(25) NOT NULL,
       c_comp_admin_email   varchar2(50) NOT NULL
)
ALTER TABLE C_CAR_RENT_COMP ADD CONSTRAINT c_rent_comp_id_pk PRIMARY KEY (c_car_rent_comp_id)

--캠핑카 
CREATE TABLE C_CARS (
       c_car_reg_id         varchar2(10) NOT NULL,
       c_car_rent_comp_id   varchar2(10) NOT NULL,
       c_car_name           varchar2(25) NOT NULL,
       c_car_number         varchar2(10) NOT NULL,
       c_car_capa           number(2) NOT NULL,
       c_car_detail         varchar2(1000) NOT NULL,
       c_car_rent_price     number(7) NOT NULL,
       c_car_reg_date       date NOT NULL
)
--동일한 캠핑카 아이디에 대여회사가 다른 경우
ALTER TABLE C_CARS ADD CONSTRAINT c_car_rent_comp_id PRIMARY KEY (c_car_reg_id, c_car_rent_comp_id)
ALTER TABLE C_CARS ADD  CONSTRAINT c_car_rent_comp_id_fk FOREIGN KEY (c_car_rent_comp_id) REFERENCES C_CAR_RENT_COMP (c_car_rent_comp_id) 

--캠핑카 대여
CREATE TABLE C_CAR_RENT (
       c_car_rent_id        number(10) NOT NULL,
       c_car_reg_id         varchar2(10) ,
       cust_driver_license_id varchar2(25) ,
       c_car_rent_comp_id   varchar2(10) ,
       c_car_rent_start_date date NOT NULL,
       c_car_rent_period    number(3) NOT NULL,
       charge_price         number(10) NOT NULL,
       price_deadline       date NOT NULL,
       add_amount_contents  varchar2(300),
       add_amount_price     number(10)
)

ALTER TABLE C_CAR_RENT ADD CONSTRAINT c_rent_id_pk PRIMARY KEY (c_car_rent_id)
ALTER TABLE C_CAR_RENT ADD  CONSTRAINT c_car_dlicense_fk FOREIGN KEY (cust_driver_license_id) REFERENCES CUSTOMERS(cust_driver_license_id)
ALTER TABLE C_CAR_RENT ADD  CONSTRAINT c_car_rent_reg_comp_id_fk FOREIGN KEY (c_car_reg_id, c_car_rent_comp_id) REFERENCES C_CARS (c_car_reg_id, c_car_rent_comp_id)

--고객
CREATE TABLE CUSTOMERS (
       cust_driver_license_id varchar2(25) NOT NULL,
       cust_name            varchar2(20) NOT NULL,
       cust_addr            varchar2(100) NOT NULL,
       cust_phone           varchar2(15) NOT NULL,
       cust_email           varchar2(50) NOT NULL,
       cust_past_used_date  date,
       cust_past_used_type  varchar2(20)
)
ALTER TABLE CUSTOMERS ADD CONSTRAINT cust_dlicense_id_pk PRIMARY KEY (cust_driver_license_id)

--캠핑카정비정보
CREATE TABLE C_CAR_REPAIR_INFORM (
       repair_number        varchar2(25) NOT NULL,
       c_car_reg_id         varchar2(10) ,
       c_car_garage_id      varchar2(10) ,
       c_car_rent_comp_id   varchar2(10) ,
       cust_driver_license_id varchar2(25) ,
       repair_contents      varchar2(15) NOT NULL,
       repair_date          date NOT NULL,
       repair_price         number(10) NOT NULL,
       price_deadline       date NOT NULL,
       add_repair_contents  varchar2(300) NOT NULL
)
ALTER TABLE C_CAR_REPAIR_INFORM ADD CONSTRAINT repair_number_pk PRIMARY KEY (repair_number)
ALTER TABLE C_CAR_REPAIR_INFORM ADD  CONSTRAINT c_car_repair_inform_cust_fk FOREIGN KEY (cust_driver_license_id) REFERENCES CUSTOMERS (cust_driver_license_id) 
ALTER TABLE C_CAR_REPAIR_INFORM ADD  CONSTRAINT c_car_inform_garage_id_fk FOREIGN KEY (c_car_garage_id) REFERENCES C_CAR_GARAGE (c_car_garage_id)
ALTER TABLE C_CAR_REPAIR_INFORM ADD  CONSTRAINT c_repair_inform_car_comp_id_fk FOREIGN KEY (c_car_reg_id, c_car_rent_comp_id) REFERENCES C_CARS (c_car_reg_id, c_car_rent_comp_id) 

--캠핑카 정비소
CREATE TABLE C_CAR_GARAGE (
       c_car_garage_id      varchar2(10) NOT NULL,
       garage_name          varchar2(15) NOT NULL,
       garage_addr          varchar2(100) NOT NULL,
       garage_phone         varchar2(15) NOT NULL,
       garage_admin_name    varchar2(25) NOT NULL,
       garage_admin_email   varchar2(50) NOT NULL
)
ALTER TABLE C_CAR_GARAGE  ADD CONSTRAINT c_garage_id_pk PRIMARY KEY (c_car_garage_id)
--===========================================
INSERT INTO C_CAR_RENT_COMP (c_car_rent_comp_id, c_comp_name, c_comp_addr, c_comp_phone, c_comp_admin_name, c_comp_admin_email)
VALUES ('1001', '가회사', '인계로 111번길 11', '01011110000', '가담당자', 'AAA@gmail.com')

INSERT INTO C_CAR_RENT_COMP (c_car_rent_comp_id, c_comp_name, c_comp_addr, c_comp_phone, c_comp_admin_name, c_comp_admin_email)
VALUES ('1002', '나회사', '인계로 222번길 22', '01022220000', '나담당자', 'BBB@gmail.com')

INSERT INTO C_CAR_RENT_COMP (c_car_rent_comp_id, c_comp_name, c_comp_addr, c_comp_phone, c_comp_admin_name, c_comp_admin_email)
VALUES ('1003', '다회사', '인계로 333번길 33', '01033330000', '다담당자', 'CCC@gmail.com')

INSERT INTO C_CAR_RENT_COMP (c_car_rent_comp_id, c_comp_name, c_comp_addr, c_comp_phone, c_comp_admin_name, c_comp_admin_email)
VALUES ('1004', '나회사', '인계로 444번길 44', '01044440000', '라담당자', 'DDD@gmail.com')

SELECT * FROM C_CAR_RENT_COMP
--==============================================
INSERT INTO C_CAR_GARAGE (c_car_garage_id, garage_name,garage_addr, garage_phone, garage_admin_name, garage_admin_email)
VALUES ('2001', '가정비소', '권선로 111번길 11', '01000001111', 'A담당자', 'aaa@gmail.com')

INSERT INTO C_CAR_GARAGE (c_car_garage_id, garage_name,garage_addr, garage_phone, garage_admin_name, garage_admin_email)
VALUES ('2002', '나정비소', '권선로 222번길 22', '01000002222', 'B담당자', 'bbb@gmail.com')

INSERT INTO C_CAR_GARAGE (c_car_garage_id, garage_name,garage_addr, garage_phone, garage_admin_name, garage_admin_email)
VALUES ('2003', '다정비소', '권선로 333번길 33', '01000003333', 'C담당자', 'ccc@gmail.com')

SELECT * FROM C_CAR_GARAGE
--===============================================
INSERT INTO CUSTOMERS (cust_driver_license_id, cust_name, cust_addr, cust_phone, cust_email, cust_past_used_date, cust_past_used_type)
VALUES ('1100111100', '가고객', '중부대로 111번길 11', '01011001100', 'a1a@gmail.com', '2011/01/01', '가켐핑카')

INSERT INTO CUSTOMERS (cust_driver_license_id, cust_name, cust_addr, cust_phone, cust_email, cust_past_used_date, cust_past_used_type)
VALUES ('1100222200', '나고객', '중부대로 222번길 22', '01022002200', 'b2b@gmail.com', '2012/02/02', '가켐핑카')

INSERT INTO CUSTOMERS (cust_driver_license_id, cust_name, cust_addr, cust_phone, cust_email, cust_past_used_date, cust_past_used_type)
VALUES ('1100333300', '다고객', '중부대로 333번길 33', '01033003300', 'c3c@gmail.com', '2013/03/03', '가켐핑카')

SELECT * FROM CUSTOMERS
--==============================================
--두 번째 외래키인데 기본키야
--캠핑카 등록 아이디가 겹칠 수 있으니까 대여 회사까지 복합키로
INSERT INTO C_CARS (c_car_reg_id, c_car_rent_comp_id, c_car_name, c_car_number, c_car_capa, c_car_detail, c_car_rent_price , c_car_reg_date)
VALUES ('3001', '1001', '가캠핑카', '11거 1111', 5, '침수 이력 있음', 100000, '2001/01/01' )

INSERT INTO C_CARS (c_car_reg_id, c_car_rent_comp_id, c_car_name, c_car_number, c_car_capa, c_car_detail, c_car_rent_price , c_car_reg_date)
VALUES ('3002', '1002', '나캠핑카', '22너 2222', 5, '엔진 교체 이력 있음', 200000, '2002/02/02' )

INSERT INTO C_CARS (c_car_reg_id, c_car_rent_comp_id, c_car_name, c_car_number, c_car_capa, c_car_detail, c_car_rent_price , c_car_reg_date)
VALUES ('3003', '1003', '다캠핑카', '33더 3333', 7, '10km 주행', 300000, '2003/03/03' )

INSERT INTO C_CARS (c_car_reg_id, c_car_rent_comp_id, c_car_name, c_car_number, c_car_capa, c_car_detail, c_car_rent_price , c_car_reg_date)
VALUES ('3003', '1002', '다캠핑카', '32더 3333', 7, '10km 주행', 300000, '2003/03/03' )

INSERT INTO C_CARS (c_car_reg_id, c_car_rent_comp_id, c_car_name, c_car_number, c_car_capa, c_car_detail, c_car_rent_price , c_car_reg_date)
VALUES ('3004', '1004', '라캠핑카', '44러 4444', 7, '침수 이력 있음', 400000, '2004/04/04' )


SELECT * FROM C_CARS

--==========================================
INSERT INTO C_CAR_RENT (c_car_rent_id, c_car_reg_id, cust_driver_license_id, c_car_rent_comp_id, c_car_rent_start_date, c_car_rent_period, charge_price, price_deadline)
VALUES (4001, '3001', '1100111100', '1001', '2021/01/01', 48, 200000, '2021/03/31')

INSERT INTO C_CAR_RENT (c_car_rent_id, c_car_reg_id, cust_driver_license_id, c_car_rent_comp_id, c_car_rent_start_date, c_car_rent_period, charge_price, price_deadline)
VALUES (4002, '3002', '1100222200', '1001', '2021/01/01', 48, 200000, '2021/03/31')

INSERT INTO C_CAR_RENT (c_car_rent_id, c_car_reg_id, cust_driver_license_id, c_car_rent_comp_id, c_car_rent_start_date, c_car_rent_period, charge_price, price_deadline)
VALUES (4002, '3002', '1100222200', '1002', '2022/02/02', 72, 600000, '2022/04/31')

INSERT INTO C_CAR_RENT (c_car_rent_id, c_car_reg_id, cust_driver_license_id, c_car_rent_comp_id, c_car_rent_start_date, c_car_rent_period, charge_price, price_deadline)
VALUES (4003, '3003', '1100222200', '1003', '2023/03/03', 96, 1200000, '2023/05/31')

INSERT INTO C_CAR_RENT (c_car_rent_id, c_car_reg_id, cust_driver_license_id, c_car_rent_comp_id, c_car_rent_start_date, c_car_rent_period, charge_price, price_deadline)
VALUES (4004, '3003', '1100333300', '1002', '2024/04/04', 144, 1800000, '2024/06/31')

SELECT * FROM C_CAR_RENT

--========================================
INSERT INTO C_CAR_REPAIR_INFORM (repair_number, c_car_reg_id, c_car_garage_id, c_car_rent_comp_id, cust_driver_license_id, repair_contents, repair_date, repair_price, price_deadline, add_repair_contents)
VALUES ()