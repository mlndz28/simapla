SELECT 'Users marcello';
CREATE USER 'marcello' IDENTIFIED BY '1234';
GRANT ALL ON `SimaplaDb`.* TO 'marcello';
GRANT SELECT ON TABLE `SimaplaDb`.* TO 'marcello';
GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'marcello';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `SimaplaDb`.* TO 'marcello';
GRANT EXECUTE ON ROUTINE `SimaplaDb`.* TO 'marcello';
