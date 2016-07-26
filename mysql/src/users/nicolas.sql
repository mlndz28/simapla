SELECT 'users/nicolas';
CREATE USER 'nicolas' IDENTIFIED BY '1234';
  GRANT
    SELECT
    ON TABLE `SimaplaDb`.* TO 'nicolas';
  GRANT
    SELECT,
    INSERT,
    TRIGGER
    ON TABLE `SimaplaDb`.* TO 'nicolas';
  GRANT
    SELECT,
    INSERT,
    TRIGGER,
    UPDATE,
    DELETE
    ON TABLE `SimaplaDb`.* TO 'nicolas';
  GRANT
    EXECUTE
    ON ROUTINE `SimaplaDb`.* TO 'nicolas';
