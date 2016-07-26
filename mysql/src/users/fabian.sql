SELECT 'users/fabian';
CREATE USER 'fabian' IDENTIFIED BY '1234';
  GRANT
    SELECT
    ON TABLE `SimaplaDb`.* TO 'fabian';
  GRANT
    SELECT,
    INSERT,
    TRIGGER
    ON TABLE `SimaplaDb`.* TO 'fabian';
  GRANT
    SELECT,
    INSERT,
    TRIGGER,
    UPDATE,
    DELETE
    ON TABLE `SimaplaDb`.* TO 'fabian';
  GRANT
    EXECUTE
    ON ROUTINE `SimaplaDb`.* TO 'fabian';
