SELECT 'users/emilio';
CREATE USER 'emilio' IDENTIFIED BY '1234';
  GRANT
    SELECT
    ON TABLE `SimaplaDb`.* TO 'emilio';
  GRANT
    SELECT,
    INSERT,
    TRIGGER
    ON TABLE `SimaplaDb`.* TO 'emilio';
  GRANT
    SELECT,
    INSERT,
    TRIGGER,
    UPDATE,
    DELETE
    ON TABLE `SimaplaDb`.* TO 'emilio';
  GRANT
    EXECUTE
    ON ROUTINE `SimaplaDb`.* TO 'emilio';