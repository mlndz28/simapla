SELECT 'users/WebClient';
CREATE USER 'WebClient' IDENTIFIED BY 'wc*3';
  GRANT
    SELECT,
    INSERT,
    TRIGGER
    ON TABLE `SimaplaDb`.* TO 'WebClient';
  GRANT
    EXECUTE
    ON ROUTINE `SimaplaDb`.* TO 'WebClient';
  GRANT
    SELECT
    ON TABLE `SimaplaDb`.* TO 'WebClient';
